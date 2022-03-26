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
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn
	private List<BasketItem> items = new ArrayList<>();
	private float subtotal;
	private float total;
	private Integer totalitems;
	

	public int getTotalitems() {
		return totalitems;
	}

	public void setTotalitems(int totalitems) {
		this.totalitems = totalitems;
	}

	public float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public void setTotal(int total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return "Basket [basketId=" + basketId + ", items=" + items + ", subtotal=" + subtotal + ", total=" + total
				+ ", totalitems=" + totalitems + "]";
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
