package com.aptech.brand;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aptech.common.entity.Brand;

public interface BrandRepository extends JpaRepository<Brand, Integer> {

}
