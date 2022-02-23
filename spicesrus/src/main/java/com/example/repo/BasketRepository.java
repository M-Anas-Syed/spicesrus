package com.example.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.domain.Basket;

public interface BasketRepository extends CrudRepository<Basket, Integer>{

}
