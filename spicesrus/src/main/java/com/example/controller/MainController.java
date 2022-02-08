package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping("/products")
	public String homepage(Model model) {
		model.addAttribute("spices", productrepo.findAll(Sort.by("name")));
		return "browseprods";
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
