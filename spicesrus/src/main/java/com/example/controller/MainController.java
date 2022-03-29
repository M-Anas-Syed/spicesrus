package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Customer;
import com.example.domain.Ingredient;
import com.example.domain.Product;
import com.example.domain.Recipe;
import com.example.repo.BasketItemRepository;
import com.example.repo.CustomerRepository;
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
	@Autowired 
	private CustomerRepository customerrepo;
	
	//redirects customer to site home page if not specified
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:/products";
	}
	
	//shows the home page (products page)
	@GetMapping("/products")
	public String homepage(Model model, String asia, String africa, String europe, String oceania, String northamerica, String southamerica, String PSearch) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
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
			model.addAttribute("customer", customer);
			x = "browseprods";
		}
		else if(PSearch!=null) {
			model.addAttribute("spices", productrepo.findByName(PSearch));
			model.addAttribute("totalitems", itemrepo.count());
			model.addAttribute("customer", customer);
			x = "browseprods";
		}
		else {
			model.addAttribute("spices", productrepo.findAll(Sort.by("name")));
			model.addAttribute("totalitems", itemrepo.count());
			model.addAttribute("customer", customer);
			x = "browseprods";
		}

		return x;
	}
	
	
	@RequestMapping("/descending")
	public String descending(Model model) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		model.addAttribute("spices", productrepo.findAll(Sort.by("name").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer", customer);
		return "browseprods";
	}
	
	@RequestMapping("/hl")
	public String hightolow(Model model) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		model.addAttribute("spices", productrepo.findAll(Sort.by("price").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer", customer);
		return "browseprods";
	}
	
	@RequestMapping("/lh")
	public String rlowtohigh(Model model) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		model.addAttribute("spices", productrepo.findAll(Sort.by("price")));
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer", customer);
		return "browseprods";
	}
	
	@RequestMapping("/recipes/descending")
	public String rdescending(Model model) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		model.addAttribute("dishes", reciperepo.findAll(Sort.by("name").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer", customer);
		return "browserecs";
	}
	
	@RequestMapping("/recipes/hl")
	public String rhightolow(Model model) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		model.addAttribute("dishes", reciperepo.findAll(Sort.by("difficulty").descending()));
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer", customer);
		return "browserecs";
	}
	
	@RequestMapping("/recipes/lh")
	public String lowtohigh(Model model) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		model.addAttribute("dishes", reciperepo.findAll(Sort.by("difficulty")));
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer", customer);
		return "browserecs";
	}
	
	//show the recipes page
	@RequestMapping("/recipes")
	public String homepage(Model model, String indian, String italian, String french, String RSearch) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		
		String x;
		List<String> cuisine = new ArrayList<String>();

		if(indian != null) {
			cuisine.add("indian");
		}
		if(italian != null) {
			cuisine.add("italian");
		}
		if(french != null) {
			cuisine.add("french");
		}
		if(!cuisine.isEmpty()) {
			model.addAttribute("dishes", reciperepo.findByCuisine(cuisine));
			model.addAttribute("totalitems", itemrepo.count());
			model.addAttribute("customer", customer);
			x = "browserecs";
		}
		else if(RSearch!=null) {
			model.addAttribute("dishes", reciperepo.findByName(RSearch));
			model.addAttribute("totalitems", itemrepo.count());
			model.addAttribute("customer", customer);
			x = "browserecs";
		}
		else{
			model.addAttribute("dishes", reciperepo.findAll(Sort.by("name")));
			model.addAttribute("totalitems", itemrepo.count());
			model.addAttribute("customer", customer);
			x = "browserecs";
		}

		return x;
	}
	
	@RequestMapping("/product={spice}")
	public String individualproduct(Model model, @PathVariable int spice) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		
		Optional<Product> product = productrepo.findById(spice);
		Iterable<Integer> linkrecipes = ingredientrepo.findRecipesByProduct(spice);
		Iterable<Recipe> recipes = reciperepo.findAllById(linkrecipes);
		model.addAttribute("spice", product.get());
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("recipes", recipes);
		model.addAttribute("customer", customer);
		return "productpg";
	}

	@RequestMapping("/recipe={rec}")
	public String individualrecipe(Model model, @PathVariable int rec) {
		String username;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			  username = ((UserDetails)principal).getUsername();
			} else {
			  username = principal.toString();
			}
		Customer customer = customerrepo.findByEmail(username);
		
		Optional<Recipe> recipe = reciperepo.findById(rec);
		model.addAttribute("recipe", recipe.get());
		model.addAttribute("totalitems", itemrepo.count());
		model.addAttribute("customer", customer);
		return "recipepg";
	}



}
