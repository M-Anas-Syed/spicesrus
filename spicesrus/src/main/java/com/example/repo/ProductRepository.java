package com.example.repo;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.domain.Product;


public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {

	Iterable<Product> findAll(Sort sort);
}
