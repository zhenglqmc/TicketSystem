package com.movbooking.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movbooking.dao.ShowingOfFilmDAO;
import com.movbooking.entity.ShowingOfFilm;

@Repository
public class ShowingOfFilmDAOImpl implements ShowingOfFilmDAO{
	
	@Autowired
	private SessionFactory sessionfactory;
	
	private Session getCurrentSession() {
		return sessionfactory.getCurrentSession();
	}

	@Override
	public void addShowing(ShowingOfFilm showingOfFilm) {
		getCurrentSession().save(showingOfFilm);
		
	}

	@Override
	public void deleteShowing(Integer showingId) {
		ShowingOfFilm showingOfFilm = getShowing(showingId);
		if (showingOfFilm != null) {
			getCurrentSession().delete(showingOfFilm);
		}
		
	}

	@Override
	public ShowingOfFilm getShowing(Integer showingId) {
		return (ShowingOfFilm)getCurrentSession().get(ShowingOfFilm.class, showingId);
	}

	@Override
	public void updateShowing(ShowingOfFilm showingOfFilm) {
		getCurrentSession().update(showingOfFilm);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShowingOfFilm> getShowings() {
		return getCurrentSession().createQuery("from showing_of_film").list();
	}

}
