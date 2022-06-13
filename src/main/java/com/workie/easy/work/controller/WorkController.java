package com.workie.easy.work.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.work.model.dto.Work;
import com.workie.easy.work.model.service.WorkService;

@Controller
public class WorkController {

	@Autowired
	private WorkService workService;
	
	@RequestMapping("work.do")
	public ModelAndView selectWork(HttpSession session, ModelAndView mv) {
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		
		int empNo = loginUser.getEmpNo();
		
		Work w = workService.selectWork(empNo);
		
		mv.addObject("w", w);
		mv.setViewName("work/workMaintest");

		return mv;
		
		
	}
	
	@RequestMapping("vacation.do")
	public String vacation() {
		return "work/vacationTest"; 
	}
}
