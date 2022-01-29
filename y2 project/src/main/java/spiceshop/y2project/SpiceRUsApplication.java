package spiceshop.y2project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import spiceshop.y2project.domain.Product;
import spiceshop.y2project.repo.ProductRepository;



@SpringBootApplication
public class SpiceRUsApplication implements ApplicationRunner {
	
	@Autowired
	private ProductRepository repo;
	
	public static void main(String[] args) {
		SpringApplication.run(SpiceRUsApplication.class, args);
	}

	@Override
	public void run(ApplicationArguments args) throws Exception {
		Product p = new Product();
		p.setPrice(2);
		p.setName("Tumeric");
		repo.save(p);
		
		p = new Product();
		p.setPrice(2);
		p.setName("Cumin");
		repo.save(p);
		
		p = new Product();
		p.setPrice(2);
		p.setName("Corriander");
		repo.save(p);

	}

}