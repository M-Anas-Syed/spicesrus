package com.example.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

//Product entity with necessary getters and setters
@Entity
public class Recipe {
	@Id
	@GeneratedValue
	private int recipe_id;
	private String name;
	private String access;
	private String time;
	private int serving;
	private int difficulty;
	private String cuisine;
	@OneToMany(mappedBy="recipe") 
	private List<Step> steps;
	@OneToMany(mappedBy="recipe") 
	private List<Ingredient> ingredients;
	
	public int getId(){
		return recipe_id;
	}
	
	public String getName(){
		return name;
	}
	public String getAccess(){
		return access;
	}
	public String getTime(){
		return time;
	}
	public int getServing(){
		return serving;
	}
	public int getDifficulty(){
		return difficulty;
	}
	public String getCuisine(){
		return cuisine;
	}
	public List<Step> getSteps(){
		return steps;
	}
	public List<Ingredient> getIngredients(){
		return ingredients;
	}
	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}
	public void setSteps(List<Step> steps) {
		this.steps = steps;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setServing(int serving) {
		this.serving = serving;
	}
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}
}