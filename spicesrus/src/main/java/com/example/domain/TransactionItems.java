package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class TransactionItems {

	@Id
	@GeneratedValue
	public int transactionItem_id;
	public String itemName;
	public int itemQuantity;
	public int itemPrice;
	
	@Override
	public String toString() {
		return "TransactionItems [transactionItem_id=" + transactionItem_id + ", itemName=" + itemName
				+ ", itemQuantity=" + itemQuantity + ", itemPrice=" + itemPrice + "]";
	}
	public int getTransactionItem_id() {
		return transactionItem_id;
	}
	public void setTransactionItem_id(int transactionItem_id) {
		this.transactionItem_id = transactionItem_id;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemQuantity() {
		return itemQuantity;
	}
	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
}
