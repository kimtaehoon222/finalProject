package com.workie.easy.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

	
	
	@RequestMapping(value="login.do")
	public String loginMember() {
		
		return "";
		
	}
}
