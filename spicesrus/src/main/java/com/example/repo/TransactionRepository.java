package com.example.repo;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.domain.Transaction;


public interface TransactionRepository extends CrudRepository<Transaction, Integer> {
	@Query(value="SELECT COUNT(customer_id) FROM transaction t WHERE t.customer_id", nativeQuery=true)
	public int countTransactionsForUser(int customerId);

}
