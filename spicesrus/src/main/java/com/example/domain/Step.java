package com.example.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Step {
	@Id
	@GeneratedValue
	private int id;
	@Column(length=1000) 
	private String step;
	@ManyToOne(fetch=FetchType.LAZY)  
	private Recipe recipe; 
	
	public int getId() {
		return id;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public Recipe getRecipe(){  
		return recipe;  
	}  
	public void setRecipe(Recipe recipe){  
		this.recipe = recipe;  
	}  

}
