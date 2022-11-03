package com.aptech.category;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.aptech.common.entity.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer> {

	@Query("SELECT c FROM Category c WHERE c.enabled = true ORDER BY c.name ASC")
	public List<Category> findAllEnabled();
	

	/*
	 * @Query("SELECT c FROM Category c WHERE c.enabled = true AND c.parent_id is null ORDER BY c.name ASC"
	 * ) public List<Category> findAllNoParent();
	 */
	 

	@Query("SELECT c FROM Category c WHERE c.enabled = true AND c.alias = ?1")
	public Category findByAliasEnabled(String alias);
}

