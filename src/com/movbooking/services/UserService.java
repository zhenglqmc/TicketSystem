package com.movbooking.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movbooking.dao.UserDAO;
import com.movbooking.entity.User;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDAO userDAO;
	
	public boolean createNewUser(User user) {
		if (checkIsExit(user.getUserName())) {
			return false;
		}
		userDAO.addUser(user);
		return true;
	}
	
	public boolean userLogin(User loginUser) {
		User user= userDAO.getUser(loginUser.getUserName());
		if (user == null) {
			return false;
		} else {
			if (user.getPassword().equals(loginUser.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	private boolean checkIsExit(String userName) {
		User user= userDAO.getUser(userName);
		return (user != null);
	}
}
