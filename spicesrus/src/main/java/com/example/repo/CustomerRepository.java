package com.example.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.domain.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer>{
	
	public Customer findByEmail(String email);
	

}
