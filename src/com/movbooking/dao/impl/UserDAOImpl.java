package com.movbooking.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movbooking.dao.UserDAO;
import com.movbooking.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionfactory;
	
	private Session getCurrentSession() {
		return sessionfactory.getCurrentSession();
	}

	@Override
	public void addUser(User user) {
		getCurrentSession().save(user);
	}

	@Override
	public void deleteUser(String userName) {
		User user = getUser(userName);
		if (user != null) {
			getCurrentSession().delete(user);
		}
	}

	@Override
	public User getUser(String userName) {
		// TODO Auto-generated method stub
		User user = null;
		user = (User)getCurrentSession().get(User.class, userName);
		return user;
	}

	@Override
	public void updateUser(String originUserName, User user) {
		User userToUpdate = getUser(originUserName);
		if (userToUpdate != null) {
			userToUpdate.setUserName(user.getUserName());
			userToUpdate.setPassword(user.getPassword());
			getCurrentSession().update(userToUpdate);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsers() {
		return getCurrentSession().createQuery("from user").list();
	}

}
