package com.example;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.domain.Ingredient;
import com.example.domain.Product;
import com.example.domain.Recipe;
import com.example.domain.Step;
import com.example.repo.IngredientRepository;
import com.example.domain.Basket;
import com.example.domain.BasketItem;
import com.example.domain.Customer;
import com.example.domain.Product;
import com.example.domain.Recipe;
import com.example.domain.Basket;
import com.example.domain.BasketItem;
import com.example.domain.Product;
import com.example.domain.Recipe;
import com.example.repo.BasketItemRepository;
import com.example.repo.BasketRepository;
import com.example.repo.CustomerRepository;
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
	@Autowired
	private BasketItemRepository itemrepo;
	@Autowired
	private BasketRepository basketrepo;
	@Autowired
	private CustomerRepository custrepo;
	
	public static void main(String[] args) {
		SpringApplication.run(SpicesrusApplication.class, args);
	}

	@Autowired
	private PasswordEncoder passe;
	
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
		p.setHistory("The use of turmeric dates back nearly 4000 years to the Vedic culture in India, where it was used as a culinary spice and had some religious significance.");
		p.setFlavours("warm, bitter, pepper-like");
		
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(2);
		p.setName("Cumin");
		p.setRegion("Asia");
		p.setSpicelvl(0);
		p.setFlavours("slightly sweet, warming flavour with a nutty element");
		p.setHistory("Likely originating in Central Asia, Southwestern Asia, or the Eastern Mediterranean, cumin has been in use as a spice for thousands of years. Cumin was a significant spice for the Minoans in ancient Crete. The ancient Greeks kept cumin at the dining table in its own container (much as pepper is frequently kept today), and this practice continues in Morocco. In India, it has been used for millennia as a traditional ingredient in innumerable recipes and forms the basis of many other spice blends.");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(6);
		p.setName("Coriander");
		p.setRegion("Asia");
		p.setSpicelvl(0);
		p.setFlavours("refreshing, tart, and citrusy");
		p.setHistory("Coriander was mentioned in the Bible, and the seeds have been found in ruins dating back to 5000 B.C. Its name comes from the Greek word koris, meaning a stink bug. This is likely a reference to the strong aroma given off by the cilantro plant leaves when they are bruised.");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(10);
		p.setName("Piper guineense");
		p.setRegion("Africa");
		p.setSpicelvl(0);
		p.setFlavours("peppery taste");
		p.setHistory("It is used in West African cuisine where it imparts spiciness and a pungent aroma to stews.");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(10);
		p.setName("Caraway");
		p.setRegion("Europe");
		p.setSpicelvl(0);
		p.setFlavours("nutty, bittersweet sharpness with a hint of citrus, pepper, and anise (mild liquorice)");
		p.setHistory("Caraway was mentioned by the early Greek botanist Pedanius Dioscorides as a herb and tonic. It was later mentioned in the Roman Apicius as an ingredient in recipes. Caraway was known in the Arab world as karauya, and cultivated in Morocco");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(7);
		p.setName("Pink Pepper");
		p.setRegion("South America");
		p.setSpicelvl(1);
		p.setFlavours("sweet fruity flavour with added heat");
		p.setHistory("Unrelated to actual peppercorns, pink peppercorns originated in Peru, where they had a heavy influence on the local cuisine and culture.");
		productrepo.save(p);
		
		
		p = new Product();
		p.setPrice(2);
		p.setName("Garlic");
		p.setRegion("Asia");
		p.setSpicelvl(1);
		p.setFlavours("spicy in a way, though not like chili peppers or peppercorns");
		p.setHistory("Garlic has been used in cooking for thousands of years, however, was rare in traditional English cuisine.");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(2);
		p.setName("Garam Masala");
		p.setRegion("Asia");
		p.setSpicelvl(1);
		p.setFlavours("A spice blend with hints of cinnamon, cloves or peppercorns");
		p.setHistory("Garam Masala is believed to have originated in Northern Indian cuisine, where it is especially found in traditional Mughal dishes.");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(3);
		p.setName("Paprika");
		p.setRegion("North America");
		p.setSpicelvl(2);
		p.setFlavours("fruity, slightly sweet notes and vivid red color");
		p.setHistory("Originated from North America, where they grow in the wild in Central Mexico and have for centuries been cultivated by the peoples of Mexico. The peppers were later introduced to the Old World, to Spain in the 16th century, as part of the Columbian Exchange.");
		productrepo.save(p);
		
		
		Optional<Product> product;
		r = new Recipe();
		r.setName("Lasagne");
		r.setAccess("Accountless");
		r.setTime("1 hour and 40 minutes");
		r.setServing(6);
		r.setDifficulty(1);
		r.setCuisine("Italian");
		reciperepo.save(r);
		
		s = new Step();
		s.setStep("1. In a large pan, heat the olive oil over a low heat. Fry the onion, carrot, celery and garlic for 5 mins, or until softened. Add the mince and fry on a medium heat until golden. Turn up the heat, pour in the wine and bubble until reduced. Stir in the tomato puree, chopped tomatoes and stock. Add in the Worcestershire sauce and simmer for 15 mins, or until the liquid has reduced. Season.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("2. Meanwhile, make the white sauce. Melt the butter in a small saucepan over a low heat and add the flour. Whisk until combined and cook on low for 1-2 mins. Remove from the heat and gradually whisk in the milk until you have a loose sauce. Season. Return to a gentle heat and whisk constantly until the sauce thickens.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("3. Preheat the oven to gas 6, 200C, fan 180C. Layer up the lasagne in a baking dish, starting with a third each of the ragu, then the pasta, then the white sauce. Repeat twice. Top with the Parmesan and mozzarella then bake in the oven for 40-45 mins, until piping hot and crisp and bubbling on top. Serve immediately.");
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
		product = productrepo.findById(7);
		i.setProduct(product.get());
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
		i.setIngredient("1 tbsp tomato puree");
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

		r = new Recipe();
		r.setName("Murgh Kari");
		r.setAccess("Accountless");
		r.setServing(6);
		r.setTime("1 hour");
		r.setCuisine("Indian");
		r.setDifficulty(2);
		reciperepo.save(r);
		
		s = new Step();
		s.setStep("1. Sprinkle the chicken breasts with 2 teaspoons salt.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("2. Heat the oil in a large skillet over high heat; partially cook the chicken in the hot oil in batches until completely browned. Transfer the browned chicken breasts to a plate and set aside.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("3. Reduce the heat under the skillet to medium-high; add the onion, garlic, and ginger to the oil remaining in the skillet and cook and stir until the onion turns translucent, about 8 minutes. Stir the curry powder, cumin, turmeric, coriander, cayenne, and 1 tablespoon of water into the onion mixture; allow to heat together for about 1 minute while stirring. Mix the tomatoes, yogurt, 1 tablespoon chopped cilantro, and 1 teaspoon salt into the mixture. Return the chicken breast to the skillet along with any juices on the plate. Pour 1/2 cup water into the mixture; bring to a boil, turning the chicken to coat with the sauce. Sprinkle the garam masala and 1 tablespoon cilantro over the chicken.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("4. Cover the skillet and simmer until the chicken breasts are no longer pink in the center and the juices run clear, about 20 minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C). Sprinkle with lemon juice to serve.");
		s.setRecipe(r);
		steprepo.save(s);
		
		
		i = new Ingredient();
		i.setIngredient("2 pounds skinless, boneless chicken breast halves");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("2 teaspoons salt");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1/2 cup cooking oil");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 1/2 cups chopped onion");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon minced garlic");
		i.setRecipe(r);
		product = productrepo.findById(7);
		i.setProduct(product.get());
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 1/2 teaspoons minced fresh ginger root");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon curry powder");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 teaspoon ground cumin");
		product = productrepo.findById(2);
		i.setProduct(product.get());
		i.setRecipe(r);
		ingredientrepo.save(i);
		product = productrepo.findById(1);
		i = new Ingredient();
		i.setIngredient("1 teaspoon ground turmeric");
		i.setProduct(product.get());
		i.setRecipe(r);
		ingredientrepo.save(i);
		product = productrepo.findById(3);
		i = new Ingredient();
		i.setIngredient("1 teaspoon ground coriander");
		i.setProduct(product.get());
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 teaspoon cayenne pepper");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon water");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 (15 ounce) can crushed tomatoes");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 cup plain yogurt");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon chopped fresh cilantro");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 teaspoon salt");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1/2 cup water");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 teaspoon garam masala");
		i.setRecipe(r);
		product = productrepo.findById(8);
		i.setProduct(product.get());
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon chopped fresh cilantro");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon fresh lemon juice");
		i.setRecipe(r);
		ingredientrepo.save(i);
		
		r = new Recipe();
		r.setName("Mac and Cheese");
		r.setAccess("Account");
		r.setServing(4);
		r.setTime("50 Minutes");
		r.setCuisine("Italian");
		r.setDifficulty(1);
		reciperepo.save(r);
		
		s = new Step();
		s.setStep("1. Heat the oven to 200C/180C fan/gas 6. Spread the baguette chunks over a baking sheet, drizzle with the melted butter and season. Bake for 6 mins until crisp, then set aside.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("2. Boil the pasta for 2 mins less than stated on the pack, then drain. Meanwhile, melt the butter in a saucepan. Add the garlic and English mustard powder, cook for 1 min, then stir in the plain flour.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("3. Cook for 1 min more, then gradually whisk in the milk until you have a lump-free sauce. Simmer for 5 mins, whisking all the time until thickened. Take off the heat, then stir in the cheddar and half the parmesan.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("4. Stir the pasta and some seasoning into the cheesy sauce. Tip into a large ovenproof dish, or four individual dishes.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("5. Scatter over the bread and the remaining parmesan, then bake for 20 mins until crisp and golden.");
		s.setRecipe(r);
		steprepo.save(s);
		
		i = new Ingredient();
		i.setIngredient("50g baguette, cut into small chunks");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("2 tbsp butter, plus 1 tbsp melted");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("350g spiral or other short pasta");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 garlic clove, finely chopped");
		i.setRecipe(r);
		product = productrepo.findById(7);
		i.setProduct(product.get());
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tsp English mustard powder");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("3 tbsp plain flour");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("500ml whole milk");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("250g mature cheddar, grated");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("50g parmesan, grated");
		i.setRecipe(r);
		ingredientrepo.save(i);
		
		r = new Recipe();
		r.setName("Bacon and Paprika Potato Wedges");
		r.setAccess("Account");
		r.setServing(6);
		r.setTime("1 Hour and 15 Minutes");
		r.setCuisine("French");
		r.setDifficulty(1);
		reciperepo.save(r);
		
		s = new Step();
		s.setStep("1. Pre-heat oven to 200C.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("2. Cut potatoes in wedges. Place them into a large bowl, add olive oil and toss well. Then add paprika and toss until well coated.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("3. Place wedges into an aluminium foil barbeque tray and bake for 40 minutes.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("4. Sprinkle chopped bacon over wedges and cook for another 10 minutes.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("5. Sprinkle grated cheese over wedges and cook for a further 10 minutes until cheese has melted.");
		s.setRecipe(r);
		steprepo.save(s);
		
		
		i = new Ingredient();
		i.setIngredient("1 1/2 kg baby potatoes");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tbs olive oil");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tbs paprika");
		i.setRecipe(r);
		product = productrepo.findById(9);
		i.setProduct(product.get());
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("6 bacon rashers chopped");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1/2 cup cheddar cheese grated");
		i.setRecipe(r);
		ingredientrepo.save(i);
		
				
		r = new Recipe();
		r.setName("Paprika Chicken");
		r.setAccess("Accountless");
		r.setServing(6);
		r.setTime("3 Hours and 20 Minutes");
		r.setCuisine("American");
		r.setDifficulty(3);
		reciperepo.save(r);
		
		s = new Step();
		s.setStep("1. Whisk together yogurt, garlic, 3 tablespoons paprika, 2 tablespoons olive oil, 1 tablespoon hot chile paste, and cayenne pepper in a large bowl.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("2. Mix in chicken pieces and toss to evenly coat. Cover the bowl with plastic wrap and marinate in the refrigerator for 3 hours.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("3. Preheat an outdoor grill for medium-high heat, and lightly oil the grate.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("4. Remove chicken from the bag and transfer to a plate or baking sheet lined with paper towels. Pat chicken pieces dry with more paper towels. Season with salt.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("5. Combine 1/4 cup olive oil, sherry vinegar, ketchup, 1/8 teaspoon hot chile paste, pinch paprika, salt, and pepper in a small bowl. Set aside.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("6. Grill chicken, skin-side down, on the preheated grill for 4 minutes with grill lid closed.");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("7. Turn chicken and grill with lid closed until well-browned and meat is no longer pink in the center, about 6 minutes. An instant-read thermometer inserted into the thickest part of the thigh should read 180 degrees F (82 degrees C).");
		s.setRecipe(r);
		steprepo.save(s);
		s = new Step();
		s.setStep("8. Spoon sherry vinegar mixture over cooked chicken and serve.");
		s.setRecipe(r);
		steprepo.save(s);
		
		
		i = new Ingredient();
		i.setIngredient("6 tablespoons plain yogurt");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("3 cloves garlic, crushed");
		i.setRecipe(r);
		product = productrepo.findById(7);
		i.setProduct(product.get());
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("3 tablespoons ground paprika");
		i.setRecipe(r);
		product = productrepo.findById(9);
		i.setProduct(product.get());
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("2 tablespoons olive oil");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon hot chile paste (such as sambal oelek)");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 pinch cayenne pepper");
		i.setRecipe(r);
		//product = productrepo.findById(9);
		//i.setProduct(product.get());
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 (5 pound) whole chicken, cut into 8 pieces");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1/4 cup olive oil");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("2 tablespoons sherry vinegar");
		i.setRecipe(r);
		ingredientrepo.save(i);
		i = new Ingredient();
		i.setIngredient("1 tablespoon ketchup");
		i.setRecipe(r);
		ingredientrepo.save(i);
		
		Customer cust1 = new Customer();
		cust1.setEmail("blank@gmail.com");
		cust1.setFirstname("John");
		cust1.setLastname("test");
		cust1.setPassword(passe.encode("password1"));
		custrepo.save(cust1);
		
		Customer cust2 = new Customer();
		cust2.setEmail("testemail@gmail.com");
		cust2.setFirstname("test1");
		cust2.setLastname("test2");
		cust2.setPassword(passe.encode("abc123"));
		
		custrepo.save(cust2);
		
		System.out.println(cust1);		
		System.out.println(cust2);


	}

}