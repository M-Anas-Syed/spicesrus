package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.domain.Sort;

import com.example.domain.Product;
import com.example.domain.Recipe;
import com.example.repo.ProductRepository;
import com.example.repo.RecipeRepository;



@SpringBootApplication
public class SpicesrusApplication implements ApplicationRunner {
	
	@Autowired
	private ProductRepository productrepo;
	@Autowired
	private RecipeRepository reciperepo;
	
	public static void main(String[] args) {
		SpringApplication.run(SpicesrusApplication.class, args);
	}

	@Override
	public void run(ApplicationArguments args) throws Exception {
		Product p = new Product();
		Recipe r = new Recipe();
		p.setPrice(4);
		p.setName("Tumeric");
		p.setRegion("Asia");
		p.setSpicelvl(0);
		p.setDescription("Tumeric is overwhelmingly earthy and bitter, almost musky, with a bit of peppery spice. A spoonful or two is enough to tinge an entire soup, pot of rice, or spice rub a vibrant shade of yellow-orange.");
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(2);
		p.setName("Cumin");
		p.setRegion("Asia");
		p.setSpicelvl(2);
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(6);
		p.setName("Corriander");
		p.setRegion("Asia");
		p.setSpicelvl(1);
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(10);
		p.setName("Piper guineense");
		p.setRegion("Africa");
		p.setSpicelvl(5);
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(10);
		p.setName("Caraway");
		p.setRegion("Europe");
		p.setSpicelvl(3);
		productrepo.save(p);
		
		p = new Product();
		p.setPrice(7);
		p.setName("Pink Pepper");
		p.setRegion("South America");
		p.setSpicelvl(2);
		productrepo.save(p);
		
		
		r = new Recipe();
		r.setName("Lasagne");
		r.setAccess("Accountless");
		reciperepo.save(r);
		
		
		System.out.println("*************************");
		System.out.println(p);
		

	}

}