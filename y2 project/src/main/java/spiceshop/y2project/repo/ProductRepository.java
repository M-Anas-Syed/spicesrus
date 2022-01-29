package spiceshop.y2project.repo;

import org.springframework.data.repository.CrudRepository;

import spiceshop.y2project.domain.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {

}
