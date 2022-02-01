package com.example.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.domain.Product;


public interface ProductRepository extends CrudRepository<Product, Integer> {

}
