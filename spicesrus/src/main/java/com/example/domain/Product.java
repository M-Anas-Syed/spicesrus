
package com.example.domain;


import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;


//Product entity with necessary getters and setters
@Entity
public class Product {
	@Id
	@GeneratedValue
	private int product_id;
	private String name;
	private int price;
	private String region;
	private int spicelvl;
	private String description;
	private String flavours;
	@Column(length=1000)
	private String history;
	
	public int getId() {
		return product_id;
	}
	
	public String getName() {
		return name;
	}
	
	public int getPrice() {
		return price;
	}
	
	public String getDescription() {
		return description;
	}
	
	public int getSpicelvl() {
		return spicelvl;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setHistory(String history) {
		this.history = history;
	}

	public String getHistory() {
		return history;
	}
	
	public String getRegion() {
		return region;
	}
	
	public String getFlavours() {
		return flavours;
	}

	public void setFlavours(String flav) {
		flavours = flav;
	}

	public void setDescription(String desc) {
		description = desc;
	}
	
	public void setRegion(String region) {
		this.region = region;
	}
	public void setSpicelvl(int lvl) {
		spicelvl = lvl;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", name=" + name + ", price=" + price + ", region=" + region + "]";
	}
	
	
	

}
