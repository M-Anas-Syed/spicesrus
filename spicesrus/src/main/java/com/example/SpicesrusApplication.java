package com.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.domain.Sort;

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
		p.setPrice(4);
		p.setName("Tumeric");
		repo.save(p);
		
		p = new Product();
		p.setPrice(6);
		p.setName("Chilli Powder");
		repo.save(p);
		
		p = new Product();
		p.setPrice(3);
		p.setName("Ginger");
		repo.save(p);
		
		p = new Product();
		p.setPrice(2);
		p.setName("Cinnamon");
		repo.save(p);
		
		p = new Product();
		p.setPrice(8);
		p.setName("Paprika");
		repo.save(p);
		
		System.out.println("*************************");
		System.out.println(p);
		

	}

}