package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

//Product entity with necessary getters and setters
@Entity
public class Recipe {
	@Id
	@GeneratedValue
	private int recipe_id;
	private String name;
	private String access;
	
	public int getId(){
		return recipe_id;
	}
	
	public String getName(){
		return name;
	}
	public String getAccess(){
		return access;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAccess(String access) {
		this.access = access;
	}
}