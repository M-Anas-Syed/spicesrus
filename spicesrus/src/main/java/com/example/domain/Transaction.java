package com.example.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Transaction {
	
	@Id
	@GeneratedValue
	private int transaction_id;
	private LocalDate date = LocalDate.now();
	private LocalTime time = LocalTime.now();

	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn
	private List<TransactionItems> transactionItems = new ArrayList<>();;
	private String firstname;
	private String lastname;
	private String email;
	private long phone;
	private String address1;
	private String address2;
	private String city;
	private String country;
	private String postcode;
	private long cardnumber;
	private String cardHolderName;
	private String cardExpiry;
	private int cvv;
	private float transactionTotal;
	
	
	
	
	@Override
	public String toString() {
		return "Transaction [transaction_id=" + transaction_id + ", date=" + date + ", time=" + time
				+ ", transactionItems=" + transactionItems + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", email=" + email + ", phone=" + phone + ", address1=" + address1 + ", address2=" + address2
				+ ", city=" + city + ", country=" + country + ", postcode=" + postcode + ", cardnumber=" + cardnumber
				+ ", cardHolderName=" + cardHolderName + ", cardExpiry=" + cardExpiry + ", cvv=" + cvv
				+ ", transactionTotal=" + transactionTotal + "]";
	}
	
	
	public float getTransactionTotal() {
		return transactionTotal;
	}


	public void setTransactionTotal(float transactionTotal) {
		this.transactionTotal = transactionTotal;
	}


	public List<TransactionItems> getTransactionItems() {
		return transactionItems;
	}
	public void setTransactionItems(List<TransactionItems> transactionItems) {
		this.transactionItems = transactionItems;
	}
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public LocalTime getTime() {
		return time;
	}
	public void setTime(LocalTime time) {
		this.time = time;
	}
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public long getCardnumber() {
		return cardnumber;
	}
	public void setCardnumber(long cardnumber) {
		this.cardnumber = cardnumber;
	}
	public String getCardHolderName() {
		return cardHolderName;
	}
	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
	public String getCardExpiry() {
		return cardExpiry;
	}
	public void setCardExpiry(String cardExpiry) {
		this.cardExpiry = cardExpiry;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
	
}
