package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class TransactionItem {
	@Id
	@GeneratedValue
	private int transactionitem_id;
	@OneToOne(fetch=FetchType.LAZY)  
	private Product product; 
	@ManyToOne(fetch=FetchType.LAZY)  
	private Transaction transaction;
	private int quantity;

	public int getId() {
		return transactionitem_id;
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public Transaction getTransaction() {
		return transaction;
	}
	
	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
