package com.example.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.domain.Ingredient;
import com.example.domain.Product;
import com.example.domain.Recipe;


public interface IngredientRepository extends CrudRepository<Ingredient, Integer> {

	Iterable<Ingredient> findAll(Sort sort);

	
	@Query(value="SELECT DISTINCT recipe_id FROM ingredient i WHERE i.product_id = :productid", nativeQuery=true)
	List<Integer> findRecipesByProduct(@Param("productid") Integer spice);

}
