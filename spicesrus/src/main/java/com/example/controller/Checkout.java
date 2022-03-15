package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.Basket;
import com.example.repo.BasketItemRepository;
import com.example.repo.BasketRepository;
import com.example.repo.ProductRepository;

@Controller
public class Checkout {

	@Autowired
	private BasketRepository basketrepo;
	@Autowired
	private ProductRepository productrepo;
	@Autowired
	private BasketItemRepository itemrepo;
	
	@RequestMapping("/checkoutpage")
	public String checkout(Model model, String totalitems,String subtotal, String total) {
		
		Iterable<Basket> b = basketrepo.findAll();
		Basket basket3 = b.iterator().next();
		
		basket3.setSubtotal(Float.parseFloat(subtotal));
		basket3.setTotal(Float.parseFloat(total));
		basket3.setTotalitems(Integer.parseInt(totalitems));
		
		basketrepo.save(basket3);
		
		model.addAttribute("basket", basket3);
		
		return "/checkout";
	}
	
	@RequestMapping("/reset")
	public String reset() {
		
		basketrepo.deleteAll();
		
		return "redirect:/products";
	}
	
}
