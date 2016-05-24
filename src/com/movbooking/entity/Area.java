package com.movbooking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="area")
public class Area {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="area_id")
	private Integer areaId;
	
	private String city;
	
	private String area;
	
	
	
	public Integer getAreaid() {
		return areaId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	
}
