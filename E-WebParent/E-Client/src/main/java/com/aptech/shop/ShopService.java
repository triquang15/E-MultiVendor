package com.aptech.shop;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.aptech.common.entity.Customer;
import com.aptech.common.entity.Shop;

@Service
public class ShopService {
	public static final int SHOPS_PER_PAGE = 5;
	
	@Autowired private ShopRepository shopRepository;
	
	
	public Page<Shop> listForCustomerByPage(Customer customer, int pageNum, String sortField, String sortDir,
			String keyword) {
		Sort sort = Sort.by(sortField);
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		
		Pageable pageable = PageRequest.of(pageNum - 1, SHOPS_PER_PAGE, sort);
		
		if (keyword != null) {
			return shopRepository.findAll(keyword, customer.getId(), pageable);
		}
		
		return shopRepository.findAll(customer.getId(), pageable);
	}

	public boolean isNameUnique(Integer id, String name) {
		Shop shop = shopRepository.findByName(name);
		return shop == null;
	}
}
