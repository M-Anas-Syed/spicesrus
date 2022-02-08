package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
}
