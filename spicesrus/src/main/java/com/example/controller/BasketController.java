package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.Basket;
import com.example.domain.BasketItem;
import com.example.domain.Product;
import com.example.repo.BasketItemRepository;
import com.example.repo.BasketRepository;
import com.example.repo.ProductRepository;

@Controller
public class BasketController {
	
	@Autowired
	private BasketRepository basketrepo;
	@Autowired
	private ProductRepository productrepo;
	@Autowired
	private BasketItemRepository itemrepo;
	
	
	
	@RequestMapping("/basket")
	public String basket(Model model) {
		model.addAttribute("basket", basketrepo.findAll());
		return "/basket";
	}
	
	
	@PostMapping("/addToBasket")
	public String addBasket(@RequestParam("id") String id, @RequestParam("quantity") int quantity) {
		
		if(basketrepo.count() == 0) {
			Basket basket1 = new Basket();
			
			BasketItem items = new BasketItem();
			items.setQuantity(quantity);
			items.setProduct(productrepo.findById(Integer.parseInt(id)).get());
			
			int tPrice = (productrepo.findById(Integer.parseInt(id)).get().getPrice() * quantity)/100; 
			items.setTotal_price(tPrice);
			itemrepo.save(items);
			
			basket1.getItems().add(items);
			basketrepo.save(basket1);
		}else {
			Iterable<Basket> b = basketrepo.findAll();
			Basket basket2 = b.iterator().next();
			
			BasketItem items = new BasketItem();
			items.setQuantity(quantity);
			items.setProduct(productrepo.findById(Integer.parseInt(id)).get());
			
			int tPrice = (productrepo.findById(Integer.parseInt(id)).get().getPrice() * quantity)/100; 
			items.setTotal_price(tPrice);
			itemrepo.save(items);
			
			basket2.getItems().add(items);
			basketrepo.save(basket2);
		}
		
		
		return "redirect:/products";
	}
	
	@PostMapping("/quickBuy")
	public String quickBuy(String id, int quantity) {
		
		if(basketrepo.count() == 0) {
			Basket basket1 = new Basket();
			
			BasketItem items = new BasketItem();
			items.setQuantity(quantity);
			items.setProduct(productrepo.findById(Integer.parseInt(id)).get());
			
			int tPrice = (productrepo.findById(Integer.parseInt(id)).get().getPrice() * quantity)/100; 
			items.setTotal_price(tPrice);
			itemrepo.save(items);
			
			basket1.getItems().add(items);
			basketrepo.save(basket1);
		}else {
			Iterable<Basket> b = basketrepo.findAll();
			Basket basket2 = b.iterator().next();
			
			BasketItem items = new BasketItem();
			items.setQuantity(quantity);
			items.setProduct(productrepo.findById(Integer.parseInt(id)).get());
			
			int tPrice = (productrepo.findById(Integer.parseInt(id)).get().getPrice() * quantity)/100; 
			items.setTotal_price(tPrice);
			itemrepo.save(items);
			
			basket2.getItems().add(items);
			basketrepo.save(basket2);
		}
		
		return "redirect:/products";
	}
	
	@RequestMapping("deleteitem")
	public String deleteItem(@RequestParam int id) {
		itemrepo.delete(itemrepo.findById(id).get());
		return "redirect:/basket";
	}
	
}
