package com.ggh.bbs.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ggh.bbs.dto.LoginInfoDTO;
import com.ggh.bbs.dto.UserDTO;
import com.ggh.bbs.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(UserDTO user) {
	
		userService.join(user);
		/*
		 * ModelAndView mav = new ModelAndView(); mav.setViewName("test");
		 */	

		return "redirect:/";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(LoginInfoDTO loginInfo, HttpSession session) {

		UserDTO loginUser = userService.login(loginInfo);

		session.setAttribute("loginUser", loginUser);	
		
		return "redirect:/";				
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";				

	}
	
	@RequestMapping(value = "delete")
	public ModelAndView delete(@RequestParam(value="u_no") int u_no, HttpSession session) {
		
		userService.delete(u_no);
		
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;				

	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(UserDTO updateUser, HttpSession session) {
		
		userService.update(updateUser);
				
		UserDTO loginUser = userService.login(new LoginInfoDTO(updateUser.getU_id(), updateUser.getU_pass()));
		
		session.invalidate();
		session.setAttribute("loginUser", loginUser);

		return "redirect:/";				

	}
	
	@RequestMapping(value = "updatepass", method = RequestMethod.POST)
	public String updatePass(LoginInfoDTO userPass, HttpSession session) {		
		
		userService.updatePass(userPass);
		
		UserDTO loginUser = userService.login(userPass);
		session.invalidate();
		session.setAttribute("loginUser", loginUser);

		return "redirect:/";			

	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String user_id) {

		return userService.userIdCheck(user_id);
	}

}
