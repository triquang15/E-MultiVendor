package com.aptech.common.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
<<<<<<< Updated upstream

@Entity
@Table(name = "contact")
public class Contact extends IdBasedEntity {
	
	@Column(length = 45)
	private String name;
	@Column(length = 15)
	private String phone;
	@Column(length = 45)
	private String email;
	@Column(length = 64)
	private String address;
	@Column(length = 4096)
	private String message;
	
	
	

	public Contact() {
		super();
	}

	public Contact(String name, String phone, String email, String address, String message) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.message = message;
	}

	public Contact(Integer id) {
		this.id = id;
=======
import javax.persistence.Transient;

@Entity
@Table(name = "banners")
public class Banner extends IdBasedEntity {

	@Column(nullable = false, length = 45, unique = true)
	private String name;

	@Column(nullable = false, length = 128)
	private String image;

	@Column(nullable = false, length = 256)
	private String title;

	@Transient
	public String getImagePath() {
		if (this.id == null)
			return "/images/image-thumbnail.png";

		return "/banner-images/" + this.id + "/" + this.image;
	}

	public Banner() {
		super();
	}

	public Banner(String name, String image, String title) {
		super();
		this.name = name;
		this.image = image;
		this.title = title;
>>>>>>> Stashed changes
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

<<<<<<< Updated upstream
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	

=======
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Banner(Integer id) {
		this.id = id;
	}
>>>>>>> Stashed changes
}
