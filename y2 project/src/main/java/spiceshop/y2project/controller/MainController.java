package spiceshop.y2project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spiceshop.y2project.repo.ProductRepository;
   
//controller to show the jsp pages
@Controller
public class MainController {
	
	@Autowired
	private ProductRepository repo;
	
	//redirects customer to site home page if not specified
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:/products";
	}
	
	//shows the home page (products page)
	@RequestMapping("/products")
	public String homepage(Model model) {
		model.addAttribute("spices", repo.findAll());
		return "browse";
	}
	
	//show the recipes page
	@RequestMapping("/recipes")
	public String recipes() {
		return "recipes";
	}
	
	
}
