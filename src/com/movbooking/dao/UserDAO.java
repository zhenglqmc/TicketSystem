package com.movbooking.dao;

import java.util.List;

import com.movbooking.entity.User;

public interface UserDAO {
	public void addUser(User user);
	public void deleteUser(String userName);
	public User getUser(String userName);
	public void updateUser(String originUserName, User user);
	public List<User> getUsers();
}
