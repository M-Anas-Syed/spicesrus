package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;


import java.awt.Color;
import java.io.File;
import java.io.FileWriter;   // Import the FileWriter class
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import com.example.domain.Basket;
import com.example.domain.BasketItem;
import com.example.domain.Customer;
import com.example.domain.Transaction;
import com.example.domain.TransactionItems;
import com.example.repo.BasketItemRepository;
import com.example.repo.BasketRepository;
import com.example.repo.CustomerRepository;
import com.example.repo.ProductRepository;
import com.example.repo.TransactionItemsRepository;
import com.example.repo.TransactionRepository;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Row;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

@Controller
public class CheckoutController {

	@Autowired
	private BasketRepository basketrepo;
	@Autowired
	private ProductRepository productrepo;
	@Autowired
	private BasketItemRepository itemrepo;
	@Autowired
	private CustomerRepository customerrepo;
	@Autowired
	private TransactionRepository trepo;
	@Autowired
	private TransactionItemsRepository tirepo;
	

	
	@RequestMapping("/checkoutpage")
	public String checkout(Model model, String totalitems,Float subtotal, Float total, @RequestParam String id[],@RequestParam int quantity[], @RequestParam String total_price[]) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			  Customer customer = customerrepo.findByEmail(username);
			  int ordernum = trepo.countTransactionsForUser(customer.getId());
			  model.addAttribute("customer",customer);
			  model.addAttribute("ordernum",ordernum);

			} else {
			  username = principal.toString();
			}
		
		for(int i = 0; i < id.length; i++) {
			Optional<BasketItem> it = itemrepo.findById(Integer.parseInt(id[i]));
			it.get().setQuantity(quantity[i]);
			it.get().setTotal_price(Float.parseFloat(total_price[i]));
			itemrepo.save(it.get());
		}
		Iterable<Basket> b = basketrepo.findAll();
		Basket basket3 = b.iterator().next();
		
		basket3.setSubtotal(subtotal);
		basket3.setTotal(total);
		basket3.setTotalitems(Integer.parseInt(totalitems));
		
		basketrepo.save(basket3);
		
		model.addAttribute("basket", basket3);
		model.addAttribute("totalitems", itemrepo.count());


		return "/checkout";
	}
	
	@PostMapping("/pay")
	public String payment(String firstname, String lastname,String email, String phone, String address1, String address2, String city, String country, String postcode, String cardnumber, String cardHolderName, String cvv) {
		Transaction transaction = new Transaction();
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			  Customer customer = customerrepo.findByEmail(username);
			  transaction.setCustomer(customer);
			} else {
			  username = principal.toString();
			}
		
		
		
		Iterable<Basket> orgB = basketrepo.findAll();
		
		Basket b = orgB.iterator().next();
		
		List<BasketItem> bi = b.getItems();
		List<TransactionItems> tis = new ArrayList<>();
		
		
		for(int i = 0; i < b.getItems().size(); i++) {
			TransactionItems ti = new TransactionItems();
			ti.setItemName(bi.get(i).getProduct().getName());
			ti.setItemPrice(bi.get(i).getTotal_price());
			ti.setItemQuantity(bi.get(i).getQuantity());
			
			tirepo.save(ti);
			tis.add(ti);
			
		}
		
		transaction.setTransactionItems(tis);
		transaction.setFirstname(firstname);
		transaction.setLastname(lastname);
		transaction.setEmail(email);
		transaction.setPhone(Long.parseLong(phone));
		transaction.setAddress1(address1);
		transaction.setAddress2(address2);
		transaction.setCity(city);
		transaction.setCountry(country);
		transaction.setPostcode(postcode);
		transaction.setCardnumber(Long.parseLong(cardnumber));
		transaction.setCardHolderName(cardHolderName);
		transaction.setCvv(Integer.parseInt(cvv));
		transaction.setTransactionTotal(b.getTotal());
		
		
		trepo.save(transaction);
		
		return "/paymentconfirmation";
		
	}
	
	@RequestMapping("/reset")
	public String reset() {
		
		basketrepo.deleteAll();
		
		return "redirect:/products";
	}
	
	
	@RequestMapping("/orderreceipt")
	public void orderReceipt(Model model, HttpServletResponse response) throws DocumentException, IOException {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=OrderReceipt_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);
	
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		
		Font fontHeader = FontFactory.getFont(FontFactory.HELVETICA);
		fontHeader.setSize(12);
		
		Paragraph head = new Paragraph(currentDateTime, fontHeader);
        head.setAlignment(Paragraph.ALIGN_RIGHT);

        
        Path path = Paths.get("src/main/webapp/media/spicesrus.png");
        
        Image img = Image.getInstance(path.toAbsolutePath().toString());
        img.scaleAbsolute(520, 150);
        img.setAlignment(Paragraph.ALIGN_CENTER);
        		
		Font fontTitle = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		fontTitle.setSize(18);

        Paragraph title = new Paragraph("Payment Receipt", fontTitle);
        title.setAlignment(Paragraph.ALIGN_CENTER);

        Font fontParagraph = FontFactory.getFont(FontFactory.HELVETICA);
        fontParagraph.setSize(15);
        
        Table info = new Table(4);
        info.setBorderWidth(1);
        info.setPadding(5);
        
        Cell cell = new Cell("");
        cell.setBackgroundColor(new Color( 255, 165, 0));
        info.addCell(cell);
        
        cell = new Cell("Items");
        cell.setBackgroundColor(new Color( 255, 165, 0));
        info.addCell(cell);
        
        cell = new Cell("Quantity");
        cell.setBackgroundColor(new Color( 255, 165, 0));
        cell.setHorizontalAlignment("center");
        info.addCell(cell);
        
        cell = new Cell("Price");
        cell.setBackgroundColor(new Color( 255, 165, 0));
        cell.setHorizontalAlignment("center");
        info.addCell(cell);
        
        Iterable<BasketItem> i = itemrepo.findAll();
        
        for(BasketItem item: i) {
        	path = Paths.get("src/main/webapp/media/"+item.getProduct().getId()+".png");
        	Image spicepic = Image.getInstance(path.toAbsolutePath().toString());
            spicepic.scaleAbsolute(50, 50);
            cell = new Cell(spicepic);
            cell.setHorizontalAlignment("center");
        	info.addCell(cell);
            
        	cell = new Cell(item.getProduct().getName());
        	info.addCell(cell);
        	
        	cell = new Cell(String.valueOf(item.getQuantity()+"g"));
        	cell.setHorizontalAlignment("center");
        	info.addCell(cell);
        	
        	cell = new Cell("�"+String.valueOf(item.getTotal_price()));
        	cell.setHorizontalAlignment("center");
        	info.addCell(cell);
        }
        
        cell = new Cell("Subtotal");
        cell.setColspan(3);
        cell.setHorizontalAlignment("right");
        info.addCell(cell);
        
        Iterable<Basket> bask = basketrepo.findAll();
		Basket b = bask.iterator().next();
        
        cell = new Cell("�"+String.valueOf(b.getSubtotal()));
        cell.setHorizontalAlignment("center");
        info.addCell(cell);
        
        cell = new Cell("Delivery");
        cell.setColspan(3);
        cell.setHorizontalAlignment("right");
        info.addCell(cell);
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			  Customer customer = customerrepo.findByEmail(username);
			  int ordernum = trepo.countTransactionsForUser(customer.getId());
		        if(ordernum==1) {
		        	cell = new Cell("�"+String.valueOf(0));
		        }
		        else {
		        	cell = new Cell("�"+String.valueOf(3.50));
		        }
		        cell.setHorizontalAlignment("center");
		        info.addCell(cell);
			} else {
			  username = principal.toString();
			  cell = new Cell("�"+String.valueOf(3.50));
			  cell.setHorizontalAlignment("center");
		      info.addCell(cell);
			}

        
        cell = new Cell("Total");
        cell.setColspan(3);
        cell.setHorizontalAlignment("right");
        info.addCell(cell);
        
        cell = new Cell("�"+String.valueOf(b.getTotal()));
        cell.setHorizontalAlignment("center");
        info.addCell(cell);
        
        
        document.add(head);
        document.add(img);
        document.add(title);
        document.add(info);
        document.close();
		
	}
	
}
