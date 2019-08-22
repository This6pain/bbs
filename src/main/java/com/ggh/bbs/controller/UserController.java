package com.ggh.bbs.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ggh.bbs.dto.LoginInfoDTO;
import com.ggh.bbs.dto.UserDTO;
import com.ggh.bbs.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public ModelAndView join(UserDTO user) {
	
		userService.join(user);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");	

		return mav;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(LoginInfoDTO loginInfo) {

		UserDTO loginUser = userService.login(loginInfo);

		ModelAndView mav = new ModelAndView();

		mav.addObject("loginUser", loginUser);
		mav.setViewName("test");	
		
		return mav;				
	}
	
	@RequestMapping(value = "logout")
	public ModelAndView logout() {
		
		ModelAndView mav = new ModelAndView();
		mav.clear();
		mav.setViewName("test");
		return mav;				

	}
}
