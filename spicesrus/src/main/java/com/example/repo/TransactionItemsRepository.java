package com.example.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.domain.TransactionItems;

public interface TransactionItemsRepository extends CrudRepository<TransactionItems,Integer>{

}
