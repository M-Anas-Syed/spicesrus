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

import com.example.domain.Ingredient;
import com.example.domain.Product;
import com.example.domain.Recipe;
import com.example.repo.BasketItemRepository;
import com.example.repo.IngredientRepository;
import com.example.repo.ProductRepository;
import com.example.repo.RecipeRepository;

   
//controller to show the jsp pages
@Controller
public class MainController {
	
	@Autowired
	private ProductRepository productrepo;
	@Autowired
	private RecipeRepository reciperepo;
	@Autowired
	private BasketItemRepository itemrepo;
	@Autowired
	private IngredientRepository ingredientrepo;
	
	//redirects customer to site home page if not specified
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:/products";
	}
	
	//shows the home page (products page)
	@GetMapping("/products")
	public String homepage(Model model, String asia, String africa, String europe, String oceania, String northamerica, String southamerica, String PSearch) {
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
			model.addAttribute("totalitems", itemrepo.count());
			x = "browseprods";
		}
		else if(PSearch!=null) {
			model.addAttribute("spices", productrepo.findByName(PSearch));
			x = "browseprods";
		}
		else {
			model.addAttribute("spices", productrepo.findAll(Sort.by("name")));
			model.addAttribute("totalitems", itemrepo.count());
			x = "browseprods";
		}

		return x;
	}
	
	
	@RequestMapping("/descending")
	public String descending(Model model) {
		model.addAttribute("spices", productrepo.findAll(Sort.by("name").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		return "browseprods";
	}
	
	@RequestMapping("/hl")
	public String hightolow(Model model) {
		model.addAttribute("spices", productrepo.findAll(Sort.by("price").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		return "browseprods";
	}
	
	@RequestMapping("/lh")
	public String rlowtohigh(Model model) {
		model.addAttribute("spices", productrepo.findAll(Sort.by("price")));
		model.addAttribute("totalitems", itemrepo.count());
		return "browseprods";
	}
	
	@RequestMapping("/recipes/descending")
	public String rdescending(Model model) {
		model.addAttribute("dishes", reciperepo.findAll(Sort.by("name").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		return "browserecs";
	}
	
	@RequestMapping("/recipes/hl")
	public String rhightolow(Model model) {
		model.addAttribute("dishes", reciperepo.findAll(Sort.by("difficulty").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		return "browserecs";
	}
	
	@RequestMapping("/recipes/lh")
	public String lowtohigh(Model model) {
		model.addAttribute("dishes", reciperepo.findAll(Sort.by("difficulty")));
		model.addAttribute("totalitems", itemrepo.count());
		return "browserecs";
	}
	
	//show the recipes page
	@RequestMapping("/recipes")
	public String homepage(Model model, String indian, String italian, String RSearch) {
		String x;
		List<String> cuisine = new ArrayList<String>();

		if(indian != null) {
			cuisine.add("indian");
		}
		if(italian != null) {
			cuisine.add("italian");
		}
		if(!cuisine.isEmpty()) {
			model.addAttribute("dishes", reciperepo.findByCuisine(cuisine));
			model.addAttribute("totalitems", itemrepo.count());
			x = "browserecs";
		}
		else if(RSearch!=null) {
			model.addAttribute("dishes", reciperepo.findByName(RSearch));
			x = "browserecs";
		}
		else{
			model.addAttribute("dishes", reciperepo.findAll(Sort.by("name")));
			model.addAttribute("totalitems", itemrepo.count());
			x = "browserecs";
		}

		return x;
	}
	
	@RequestMapping("/product={spice}")
	public String individualproduct(Model model, @PathVariable int spice) {
		Optional<Product> product = productrepo.findById(spice);
		Iterable<Integer> linkrecipes = ingredientrepo.findRecipesByProduct(spice);
		Iterable<Recipe> recipes = reciperepo.findAllById(linkrecipes);
		model.addAttribute("spice", product.get());
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("recipes", recipes);
		return "productpg";
	}

	@RequestMapping("/recipe={rec}")
	public String individualrecipe(Model model, @PathVariable int rec) {
		Optional<Recipe> recipe = reciperepo.findById(rec);
		model.addAttribute("recipe", recipe.get());
		model.addAttribute("totalitems", itemrepo.count());
		return "recipepg";
	}



}
