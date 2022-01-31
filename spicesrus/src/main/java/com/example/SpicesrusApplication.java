package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.domain.Product;
import com.example.repo.ProductRepository;



@SpringBootApplication
public class SpicesrusApplication implements ApplicationRunner {
	
	@Autowired
	private ProductRepository repo;
	
	public static void main(String[] args) {
		SpringApplication.run(SpicesrusApplication.class, args);
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