package com.example.domain;

import java.util.Optional;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Ingredient {
	@Id
	@GeneratedValue
	private int id;
	private String ingredient;
	@ManyToOne(fetch=FetchType.LAZY)  
	@JoinColumn(name="recipe_id")
	private Recipe recipe; 
	private String ingredientURL;
	@OneToOne(optional=true)
	@JoinColumn(name="product_id")
	private Product product;
	
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
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product spice) {
		this.product = spice;
	}
}
