package com.movbooking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="arrangement")
public class Arrangement {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="arrangement_id")
	private Integer arrangementId;
	
	private Integer movieId;
	
	private Integer cinemaId;
	
	private Integer showingId;
	
	public Arrangement(Integer movieId, Integer cinemaId, Integer showingId) {
		super();
		this.movieId = movieId;
		this.cinemaId = cinemaId;
		this.showingId = showingId;
	}

	
	
	public Integer getArrangementId() {
		return arrangementId;
	}



	public Integer getMovieId() {
		return movieId;
	}

	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

	public Integer getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(Integer cinemaId) {
		this.cinemaId = cinemaId;
	}

	public Integer getShowingId() {
		return showingId;
	}

	public void setShowingId(Integer showingId) {
		this.showingId = showingId;
	}

}
