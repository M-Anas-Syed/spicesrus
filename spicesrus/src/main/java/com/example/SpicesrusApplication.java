package com.example;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.domain.Sort;

import com.example.domain.Ingredient;
import com.example.domain.Product;
import com.example.domain.Recipe;
import com.example.domain.Step;
import com.example.repo.IngredientRepository;
import com.example.repo.ProductRepository;
import com.example.repo.RecipeRepository;
import com.example.repo.StepRepository;



@SpringBootApplication
public class SpicesrusApplication implements ApplicationRunner {
	
	@Autowired
	private ProductRepository productrepo;
	@Autowired
	private RecipeRepository reciperepo;
	@Autowired
	private StepRepository steprepo;
	@Autowired
	private IngredientRepository ingredientrepo;
	
	public static void main(String[] args) {
		SpringApplication.run(SpicesrusApplication.class, args);
	}

	@Override
	public void run(ApplicationArguments args) throws Exception {
		List<Step> steps=new ArrayList<Step>();
		Product p = new Product();
		Recipe r = new Recipe();
		Step s = new Step();
		Ingredient i = new Ingredient();
		p.setPrice(4);
		p.setName("Tumeric");
		p.setRegion("Asia");
		p.setSpicelvl(0);
		p.setDescription("Tumeric is overwhelmingly earthy and bitter, almost musky, with a bit of peppery spice. A spoonful or two is enough to tinge an entire soup, pot of rice, or spice rub a vibrant shade of yellow-orange.");
		p.setFlavours("warm, bitter, pepper-like");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(2);
		p.setName("Cumin");
		p.setRegion("Asia");
		p.setSpicelvl(0);
		p.setFlavours("slightly sweet, warming flavour with a nutty element");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(6);
		p.setName("Corriander");
		p.setRegion("Asia");
		p.setSpicelvl(0);
		p.setFlavours("refreshing, tart, and citrusy");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(10);
		p.setName("Piper guineense");
		p.setRegion("Africa");
		p.setSpicelvl(0);
		p.setFlavours("peppery taste");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(10);
		p.setName("Caraway");
		p.setRegion("Europe");
		p.setSpicelvl(0);
		p.setFlavours("nutty, bittersweet sharpness with a hint of citrus, pepper, and anise (mild liquorice)");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(7);
		p.setName("Pink Pepper");
		p.setRegion("South America");
		p.setSpicelvl(1);
		p.setFlavours("sweet fruity flavour with added heat");
		productrepo.save(p);
		
		
		r = new Recipe();
		r.setName("Lasagne");
		r.setAccess("Accountless");
		r.setTime("1 hour and 40 minutes");
		r.setServing(6);
		reciperepo.save(r);
		
		s = new Step();
		s.setStep("1. In a large pan, heat the olive oil over a low heat. Fry the onion, carrot, celery and garlic for 5 mins, or until softened. Add the mince and fry on a medium heat until golden. Turn up the heat, pour in the wine and bubble until reduced. Stir in the tomato purée, chopped tomatoes and stock. Add in the Worcestershire sauce and simmer for 15 mins, or until the liquid has reduced. Season.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("2. Meanwhile, make the white sauce. Melt the butter in a small saucepan over a low heat and add the flour. Whisk until combined and cook on low for 1-2 mins. Remove from the heat and gradually whisk in the milk until you have a loose sauce. Season. Return to a gentle heat and whisk constantly until the sauce thickens.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("3. Preheat the oven to gas 6, 200°C, fan 180°C. Layer up the lasagne in a baking dish, starting with a third each of the ragu, then the pasta, then the white sauce. Repeat twice. Top with the Parmesan and mozzarella then bake in the oven for 40-45 mins, until piping hot and crisp and bubbling on top. Serve immediately.");
		s.setRecipe(r);
		steprepo.save(s);
		
		i = new Ingredient();
		i.setIngredient("1 tbsp olive oil");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 onion, diced");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 carrot, diced");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 celery stalk, diced");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("2 garlic cloves, finely sliced");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("250g beef mince");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("250g pork mince");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tbsp tomato purée");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("400g tin chopped tomatoes");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("200ml beef stock");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("200ml red wine");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tsp Worcestershire sauce");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("9-12 lasagne sheets (depending on the size of your baking dish");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("50g Parmesan, grated");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("150g pack mozzarella, shredded");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("50g butter");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("50g plain flour");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("550ml semi-skimmed milk");
		i.setRecipe(r);
		ingredientrepo.save(i);
	}

}