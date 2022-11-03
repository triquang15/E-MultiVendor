package com.aptech.common.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "shops")
public class Shop extends IdBasedEntity {
	@Column(unique = true, length = 255, nullable = false)
	private String name;

	@Column(length = 255, nullable = false)
	private String alias;

	@Column(name = "created_time")
	private Date createdTime;

	@Column(name = "delivery_address", nullable = false, length = 64)
	private String deliveryAddress;

	private boolean enabled;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	public Shop() {
		super();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
		
	}

	
	
	

}
