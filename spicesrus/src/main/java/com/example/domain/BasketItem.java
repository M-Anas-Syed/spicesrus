package com.example.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class BasketItem {

	@Id
	@GeneratedValue
	private int item_id;
	@ManyToOne(fetch = FetchType.EAGER)
	private Product product;
	private int quantity;
	private int total_price;


	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getProduct_id() {
		return item_id;
	}

	@Override
	public String toString() {
		return "BasketItem [item_id=" + item_id + ", product=" + product + ", quantity=" + quantity + ", total_price="
				+ total_price + "]";
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
