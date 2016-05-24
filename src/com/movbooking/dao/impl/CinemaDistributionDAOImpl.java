package com.movbooking.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.movbooking.dao.CinemaDistributionDAO;
import com.movbooking.entity.CinemaDistribution;

public class CinemaDistributionDAOImpl implements CinemaDistributionDAO {
	
	@Autowired
	private SessionFactory sessionfactory;
	
	private Session getCurrentSession() {
		return sessionfactory.getCurrentSession();
	}

	@Override
	public void addCinemaDistribution(CinemaDistribution cinemaDistribution) {
		getCurrentSession().save(cinemaDistribution);

	}

	@Override
	public void deleteCinemaDistribution(CinemaDistribution cinemaDistribution) {
		getCurrentSession().delete(cinemaDistribution);

	}

	@Override
	public List<CinemaDistribution> getCinemaDistributions(String city, String area, Integer cinemaId) {
		String hql = "FROM CinemaDistribution C WHERE C.city = :city and C.area = :area and C.cinemaId = :cinemaId";
		Query query = getCurrentSession().createQuery(hql);
		query.setParameter("city", city);
		query.setParameter("area", area);
		query.setParameter("cinemaId", cinemaId);
		@SuppressWarnings("unchecked")
		List<CinemaDistribution> result = query.list();
		return result;
	}

	@Override
	public void updateCinemaDistribution(CinemaDistribution cinemaDistribution) {
		getCurrentSession().update(cinemaDistribution);

	}

}
