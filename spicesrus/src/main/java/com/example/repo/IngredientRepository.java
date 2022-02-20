package com.example.repo;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import com.example.domain.Ingredient;


public interface IngredientRepository extends CrudRepository<Ingredient, Integer> {

	Iterable<Ingredient> findAll(Sort sort);
}
