package com.movbooking.services;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movbooking.dao.MovieDAO;
import com.movbooking.entity.Movie;

@Service
@Transactional
public class MovieService {
	@Autowired
	private MovieDAO movieDAO;
	
	public List<Movie> getCurrentMovie(){
		List<Movie> movies = movieDAO.getMovies();
		
		List<Movie> currentMovies = null;
		
		Calendar today = Calendar.getInstance();
		
		for(Movie movie : movies){
			Calendar date = movie.getReleaseDate();
			if(date.compareTo(today) <= 0){
				currentMovies.add(movie);
			}
		}
		
		return currentMovies;
	}
	
	public List<Movie> getLaterMovie(){
		List<Movie> movies = movieDAO.getMovies();
		
		List<Movie> laterMovies = null;
		
		Calendar today = Calendar.getInstance();
		
		for(Movie movie : movies){
			Calendar date = movie.getReleaseDate();
			if(date.compareTo(today) <= 0){
				laterMovies.add(movie);
			}
		}
		
		return laterMovies;
	}
}
