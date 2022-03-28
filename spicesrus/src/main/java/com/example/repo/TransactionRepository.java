package com.example.repo;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import com.example.domain.Transaction;


public interface TransactionRepository extends CrudRepository<Transaction, Integer> {

}
