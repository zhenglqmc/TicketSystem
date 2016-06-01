package com.movbooking.controller;

import java.util.concurrent.Callable;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movbooking.entity.User;
import com.movbooking.services.CinemaService;
import com.movbooking.util.ServletUtil;

@Controller
public class CinemaController {
	
	private static Logger logger = Logger.getLogger(UserController.class.getName());
	
	@Autowired
	private CinemaService cinemaService;
	
	@RequestMapping(value="/selectCinema", method=RequestMethod.GET)
	public String toCinema(HttpServletRequest request) {
			return "select";

	}
	
	
	
	@RequestMapping(value="/getArea", method=RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Callable<String> getArea(HttpServletRequest request, HttpServletResponse response) {
		return new Callable<String>() {
			@Override
			public String call() throws Exception {
				
				String city = request.getParameter("city").trim();
				System.out.println(city);
				String res = cinemaService.getAreaByCity(city);
				System.out.println(res);
				return res;
			}
		};
	}
	
	@RequestMapping(value="/getCinema", method=RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Callable<String> getCinema(HttpServletRequest request, HttpServletResponse response) {
		return new Callable<String>() {
			@Override
			public String call() throws Exception {
				
				String city = request.getParameter("city").trim();
				String area = request.getParameter("zone").trim();
				System.out.println("in back end: city=" + city + " area=" + area);
				String movieIdString = request.getParameter("movieId").trim();
				Integer movieId;
				if(movieIdString.equals("")){
					return "";
				}
				else{
					movieId = Integer.parseInt(movieIdString);
				}
				
				return cinemaService.getCinemaByLocation(city, area, movieId);
			}
		};
	}
	
	@RequestMapping(value="/getSession", method=RequestMethod.GET,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Callable<String> getSession(HttpServletRequest request, HttpServletResponse response) {
		return new Callable<String>() {
			@Override
			public String call() throws Exception {
				
				String cinemaIdStr= request.getParameter("cinemaId").trim();
				String movieIdStr = request.getParameter("movieId").trim();
				Integer cinemaId; 
				Integer movieId;
				
				if(cinemaIdStr == null || movieIdStr == null||cinemaIdStr.equals("") || movieIdStr.equals("")){
					return "";
				}
				else{
					cinemaId = Integer.parseInt(cinemaIdStr);
					movieId = Integer.parseInt(movieIdStr);
				}

				String time = request.getParameter("time").trim();
				//System.out.println(time);
				return cinemaService.getSession(cinemaId, movieId, time);
			}
		};
	}
	
}
