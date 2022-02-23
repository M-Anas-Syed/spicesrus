package com.example.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Ingredient {
	@Id
	@GeneratedValue
	private int id;
	private String ingredient;
	@ManyToOne(fetch=FetchType.LAZY)  
	private Recipe recipe; 
	private String ingredientURL;
	
	public int getId() {
		return id;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public Recipe getRecipe(){  
		return recipe;  
	}  
	public void setRecipe(Recipe recipe){  
		this.recipe = recipe;  
	}
	public String getIngredientURL() {
		return ingredientURL;
	}
	public void setIngredientURL(String ingredientURL) {
		this.ingredientURL = ingredientURL;
	}  
}
