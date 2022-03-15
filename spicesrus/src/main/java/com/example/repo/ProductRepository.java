package com.example.repo;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.domain.Product;


public interface ProductRepository extends CrudRepository<Product, Integer> {

	Iterable<Product> findAll(Sort sort);
	
	
	@Query(value="select * from product p where p.region in :region", nativeQuery=true)
	List<Product> findByRegion(@Param("region") List<String> region);
	
	@Query(value="select * from product n where n.name like %:%", nativeQuery=true)
	 List<Product> findByName(@Param("name") String name);
}
