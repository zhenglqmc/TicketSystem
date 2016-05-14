package com.movbooking.controller;

import java.util.concurrent.Callable;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movbooking.entity.User;
import com.movbooking.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/testUser.html", method=RequestMethod.GET)
	public String toLoginPage(@CookieValue(value="username", required=false) String username) {
		if (username == null) {
			return "testUser";
		} else {
			return "welcome";
		}
		
	}
	
	@RequestMapping(value="/testUser/checkLogin", method=RequestMethod.POST)
	@ResponseBody
	public Callable<String> checkLogin(HttpServletRequest request, HttpServletResponse response) {
		return new Callable<String>() {
			@Override
			public String call() throws Exception {
				String username = request.getParameter("username").trim();
				String password = request.getParameter("password").trim();
				User user = new User(username, password);
				boolean loginSuccess = userService.userLogin(user);
				String ans=null;
				if (loginSuccess) {
					ans = "1";
					Cookie cookie = new Cookie("username", username);
					cookie.setPath("/");
					response.addCookie(cookie);
				} else {
					ans = "0";
				}
				return ans;
			}
		};
	}
	
	@RequestMapping(value="/testUser/register", method=RequestMethod.POST)
	@ResponseBody
	public Callable<String> register(HttpServletRequest request) {
		return new Callable<String>() {
			@Override
			public String call() throws Exception {
				String username = request.getParameter("username").trim();
				String password = request.getParameter("password").trim();
				User user = new User(username, password);
				boolean registerSuccess = userService.createNewUser(user);
				String ans=null;
				if (registerSuccess) {
					ans = "1";
				} else {
					ans = "0";
				}
				return ans;
			}
		};
	}
	
	
}
