package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Product;
import com.example.repo.ProductRepository;
import com.example.repo.RecipeRepository;

   
//controller to show the jsp pages
@Controller
public class MainController {
	
	@Autowired
	private ProductRepository productrepo;
	@Autowired
	private RecipeRepository reciperepo;
	
	//redirects customer to site home page if not specified
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:/products";
	}
	
	//shows the home page (products page)
	@GetMapping("/products")
	public String homepage(Model model, String asia, String africa, String europe, String oceania, String northamerica, String southamerica) {
		String x;
		List<String> region = new ArrayList<String>();

		if(asia != null) {
			region.add("asia");
		}
		if(africa != null) {
			region.add("africa");
		}
		if(europe != null) {
			region.add("europe");
		}
		if(oceania != null) {
			region.add("oceania");
		}
		if(northamerica != null) {
			region.add("north america");
		}
		if(southamerica !=null) {
			region.add("south america");
		}
		
		if(!region.isEmpty()) {
			model.addAttribute("spices", productrepo.findByRegion(region));
			x = "browseprods";
		}
		else {
			model.addAttribute("spices", productrepo.findAll(Sort.by("name")));
			x = "browseprods";
		}

		return x;
	}
	
	
	@RequestMapping("/products/descending")
	public String descending(Model model) {
		model.addAttribute("spices", productrepo.findAll(Sort.by("name").descending()));
		return "browseprods";
	}
	
	@RequestMapping("/products/hl")
	public String hightolow(Model model) {
		model.addAttribute("spices", productrepo.findAll(Sort.by("price").descending()));
		return "browseprods";
	}
	
	@RequestMapping("/products/lh")
	public String lowtohigh(Model model) {
		model.addAttribute("spices", productrepo.findAll(Sort.by("price")));
		return "browseprods";
	}
	
	//show the recipes page
	@RequestMapping("/recipes")
	public String recipes(Model model) {
		model.addAttribute("dishes", reciperepo.findAll());
		return "browserecs";
	}
	
	@RequestMapping("/product={spice}")
	public String individualproduct(Model model, @PathVariable int spice) {
		Optional<Product> product = productrepo.findById(spice);
		model.addAttribute("spice", product.get());
		return "productpg";
	}
	
	//Return search result for products
	@RequestMapping("/products?PSearch={NAME}")
	public String PsearchResult(Model model, @PathVariable String NAME) {
		model.addAttribute("spices", productrepo.findByName(NAME));
		return "browseprods";
	}
	//Return search result for recipes
	@RequestMapping("/recipe?RSearch={NAME}")
	public String RsearchResult(Model model, @PathVariable String NAME) {
		model.addAttribute("spices", productrepo.findByName(NAME));
		return "browserecs";
	}
	
}
