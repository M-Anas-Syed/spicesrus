package com.example.repo;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import com.example.domain.Recipe;


public interface RecipeRepository extends CrudRepository<Recipe, Integer> {

	Iterable<Recipe> findAll(Sort sort);
}
