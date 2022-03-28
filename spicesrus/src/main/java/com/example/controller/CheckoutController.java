package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.Basket;
import com.example.domain.Customer;
import com.example.repo.BasketItemRepository;
import com.example.repo.BasketRepository;
import com.example.repo.CustomerRepository;
import com.example.repo.ProductRepository;

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
	
	@RequestMapping("/checkoutpage")
	public String checkout(Model model, String totalitems,Float subtotal, Float total) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		
		Iterable<Basket> b = basketrepo.findAll();
		Basket basket3 = b.iterator().next();
		
		basket3.setSubtotal(subtotal);
		basket3.setTotal(total);
		basket3.setTotalitems(Integer.parseInt(totalitems));
		
		basketrepo.save(basket3);
		
		model.addAttribute("basket", basket3);
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer",customer);

		return "/checkout";
	}
	
	@RequestMapping("/reset")
	public String reset() {
		
		basketrepo.deleteAll();
		
		return "redirect:/products";
	}
	
}
