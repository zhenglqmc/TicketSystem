package com.movbooking.entity;

import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.movbooking.dao.VideoHallDAO;
import com.movbooking.dao.impl.VideoHallDaoImpl;
import com.movbooking.util.JoinClassKeyOfVideoHall;

@Entity
@Table(name="showing_of_film")
public class ShowingOfFilm {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="showing_id")
	private Integer showingId;
	
	@ManyToOne(fetch=FetchType.EAGER, cascade=(CascadeType.ALL))
	@JoinColumn(name="movie_id")
	private Movie movie;
	
	@Column(name="cinema_id")
	private Integer cinemaId;
	
	@Column(name="screen_time")
	private Calendar screenTime;
	
	@Column(name="video_hall_no")
	private Integer videoHallNo;
	
	@Column(name="language")
	private String language;
	
	@Column(name="price")
	private float price;
	
	@Column(name="showing_type")
	private int showingType;  // 3:3d or 2:2d
	
	@Column(name="seat_matrix")
	private String seatMatrix;
	
	@Column(name="max_row")
	private int maxRow;
	
	@Column(name="max_col")
	private int maxCol;
	
	public ShowingOfFilm() {}
	
	public ShowingOfFilm(Movie movie, Integer cinemaId, Calendar screenTime, Integer videoHallNo, String language,
			float price, int showingType, String seatMatrix) {
		super();
		this.movie = movie;
		this.cinemaId = cinemaId;
		this.screenTime = screenTime;
		this.videoHallNo = videoHallNo;
		this.language = language;
		this.price = price;
		this.showingType = showingType;
		this.seatMatrix = seatMatrix;
		initMaxColAndRow();
	}

	public String getSeatMatrix() {
		return seatMatrix;
	}

	public void setSeatMatrix(String seatMatrix) {
		this.seatMatrix = seatMatrix;
	}
	

	public int getMaxRow() {
		return maxRow;
	}
	
	public int getMaxCol() {
		return maxCol;
	}


	public Integer getShowingId() {
		return showingId;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Integer getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(Integer cinemaId) {
		this.cinemaId = cinemaId;
	}

	public Calendar getScreenTime() {
		return screenTime;
	}

	public void setScreenTime(Calendar screenTime) {
		this.screenTime = screenTime;
	}

	public Integer getVideoHallNo() {
		return videoHallNo;
	}

	public void setVideoHallNo(Integer videoHallNo) {
		this.videoHallNo = videoHallNo;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getShowingType() {
		return showingType;
	}

	public void setShowingType(int showingType) {
		this.showingType = showingType;
	}
	
	private void initMaxColAndRow() {
		VideoHallDAO videoHallDAO = new VideoHallDaoImpl();
		JoinClassKeyOfVideoHall key = new JoinClassKeyOfVideoHall(cinemaId, videoHallNo);
		VideoHall videoHall = videoHallDAO.getVideoHall(key);
		this.maxRow = videoHall.getMaxRow();
		this.maxCol = videoHall.getMaxColumn();
	}
	
}
