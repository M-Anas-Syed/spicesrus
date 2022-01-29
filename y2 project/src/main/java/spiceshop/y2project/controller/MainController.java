package spiceshop.y2project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spiceshop.y2project.repo.ProductRepository;
   

@Controller
public class MainController {
	
	@Autowired
	private ProductRepository repo;
	
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:/products";
	}
	
	@RequestMapping("/products")
	public String homepage(Model model) {
		model.addAttribute("spices", repo.findAll());
		return "browse";
	}
	
	
	@RequestMapping("/recipes")
	public String recipes() {
		return "recipes";
	}
	
	
}
