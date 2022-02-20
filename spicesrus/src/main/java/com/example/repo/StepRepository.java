package com.example.repo;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import com.example.domain.Step;


public interface StepRepository extends CrudRepository<Step, Integer> {

	Iterable<Step> findAll(Sort sort);
}
