package com.example.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.domain.BasketItem;

public interface BasketItemRepository extends CrudRepository<BasketItem, Integer>{

	long count();
}
