package com.movbooking.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cinema")
public class Cinema {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer cinemaId;
	
	private String name;
	
	private String address;
	
	private String description;
	
	private String cinemaImg;

	public Integer getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(Integer cinemaId) {
		this.cinemaId = cinemaId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCinemaImg() {
		return cinemaImg;
	}

	public void setCinemaImg(String cinemaImg) {
		this.cinemaImg = cinemaImg;
	}
	
	
}

