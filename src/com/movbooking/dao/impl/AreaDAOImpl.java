package com.movbooking.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movbooking.dao.AreaDAO;
import com.movbooking.entity.Area;

@Repository
public class AreaDAOImpl implements AreaDAO {

	@Autowired
	private SessionFactory sessionfactory;
	
	private Session getCurrentSession() {
		return sessionfactory.getCurrentSession();
	}
	
	@Override
	public void addArea(Area area) {
		getCurrentSession().save(area);

	}

	@Override
	public void deleteArea(Area area) {
		getCurrentSession().delete(area);

	}

	@Override
	public List<Area> getAreas(String city) {
		String hql = "FROM Area A WHERE A.city = :city";
		Query query = getCurrentSession().createQuery(hql);
		query.setParameter("city", city);
		@SuppressWarnings("unchecked")
		List<Area> result = query.list();
		return result;
	}

	@Override
	public void updateArea(Area area) {
		getCurrentSession().update(area);
	}

}
