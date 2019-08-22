package com.ggh.bbs.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "delete")
	public ModelAndView delete(@RequestParam(value="u_no") int u_no) {
		
		userService.delete(u_no);
		
		ModelAndView mav = new ModelAndView();
		mav.clear();
		mav.setViewName("test");
		return mav;				

	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(UserDTO updateUser) {
		
		userService.update(updateUser);
		
		ModelAndView mav = new ModelAndView();
		
		UserDTO loginUser = userService.login(new LoginInfoDTO(updateUser.getU_id(), updateUser.getU_pass()));
		mav.addObject("loginUser", loginUser);
		mav.setViewName("test");
		return mav;				

	}
	
	@RequestMapping(value = "updatepass", method = RequestMethod.POST)
	public ModelAndView updatePass(LoginInfoDTO userPass) {
		
		ModelAndView mav = new ModelAndView();
		
		userService.updatePass(userPass);
		
		mav.clear();
		UserDTO loginUser = userService.login(userPass);
		mav.addObject("loginUser", loginUser);
		mav.setViewName("test");
		return mav;				

	}
}
