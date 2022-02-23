package com.example.domain;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Basket {
	
	@Id
	@GeneratedValue
	private int basketId;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true )
	@JoinColumn
	private List<BasketItem> items = new ArrayList<>();
	
	@Override
	public String toString() {
		return "Basket [basketId=" + basketId + ", items=" + items + "]";
	}

	public int getBasketId() {
		return basketId;
	}

	public List<BasketItem> getItems() {
		return items;
	}

	public void setItems(List<BasketItem> items) {
		this.items = items;
	}


	
}
