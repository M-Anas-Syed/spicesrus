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
	@OneToMany(mappedBy="recipe") 
	private List<Step> steps;
	
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
	public List<Step> getSteps(){
		return steps;
	}
	public void setSteps(List<Step> steps) {
		this.steps = steps;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAccess(String access) {
		this.access = access;
	}
}