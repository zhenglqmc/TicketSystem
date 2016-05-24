package com.movbooking.dao;

import java.util.List;

import com.movbooking.entity.CinemaDistribution;

public interface CinemaDistributionDAO {
	public void addCinemaDistribution(CinemaDistribution cinemaDistribution);
	public void deleteCinemaDistribution(CinemaDistribution cinemaDistribution);
	public List<CinemaDistribution> getCinemaDistributions(String city, String area, Integer cinemaId);
	public void updateCinemaDistribution(CinemaDistribution cinemaDistribution);
}
