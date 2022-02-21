package com.example.repo;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.example.domain.Recipe;


public interface RecipeRepository extends CrudRepository<Recipe, Integer> {

	Iterable<Recipe> findAll(Sort sort);
	
	
	@Query(value="select * from recipe r where r.cuisine in :cuisine", nativeQuery=true)
	List<Recipe> findByCuisine(@Param("cuisine") List<String> cuisine);
}
