package com.ggh.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class jspTest {

	@RequestMapping("test")
	 public String jspTest(){
	        return "test";
	    }

}
