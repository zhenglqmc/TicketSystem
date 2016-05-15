package com.movbooking.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.movbooking.util.JoinClassKeyOfVideoHall;

@Entity
@Table(name="video_hall")
public class VideoHall {
	
	@EmbeddedId
	private JoinClassKeyOfVideoHall videoHallKey;
	
	@Column(name="max_column")
	private Integer maxColumn;
	
	@Column(name="max_row")
	private Integer maxRow;
	
	public VideoHall() {}
	
	public VideoHall(Integer cinemaId, Integer hallNo, Integer maxColumn, Integer maxRow) {
		super();
		this.videoHallKey = new JoinClassKeyOfVideoHall(cinemaId, hallNo);
		this.maxColumn = maxColumn;
		this.maxRow = maxRow;
	}

	public Integer getCinemaId() {
		return videoHallKey.getCinemaId();
	}
	public void setCinemaId(Integer cinemaId) {
		videoHallKey.setCinemaId(cinemaId);
	}
	public Integer getHallNo() {
		return videoHallKey.getHallNo();
	}
	public void setHallNo(Integer hallNo) {
		videoHallKey.setHallNo(hallNo);
	}
	public Integer getMaxColumn() {
		return maxColumn;
	}
	public void setMaxColumn(Integer maxColumn) {
		this.maxColumn = maxColumn;
	}
	public Integer getMaxRow() {
		return maxRow;
	}
	public void setMaxRow(Integer maxRow) {
		this.maxRow = maxRow;
	}

}

