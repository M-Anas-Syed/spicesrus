package com.example.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Transaction {
	@Id
	@GeneratedValue
	private int transaction_id;
	private LocalDate date = LocalDate.now();
	private LocalTime time = LocalTime.now();
	private int user_id;
	
	
	public LocalDate getDate() {
		return date;
	}

	public LocalTime getTime() {
		return time;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	
}
