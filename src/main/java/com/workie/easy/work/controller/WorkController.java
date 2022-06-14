package com.workie.easy.work.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.work.model.dto.Work;
import com.workie.easy.work.model.dto.WorkSInfo;
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
	
	@RequestMapping("update.do")
	public String updateWork(HttpSession session, HttpServletRequest request) {
		
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		int empNo = loginUser.getEmpNo();
		
		int sNo = Integer.parseInt(request.getParameter("status"));
		String wNo = request.getParameter("workNo");
		if(sNo == 1) {//넘어온 상태값이 1이면 insert 출근
			workService.insertWork(empNo);
		}else if(sNo == 2) {//상태값이 2이면 update 퇴근
			workService.updateWork(wNo);
		}
		
		WorkSInfo wsi = new WorkSInfo(wNo, sNo);
		workService.insertWorkStatus(wsi);
		
		return "redirect:work.do"; 
		
		
	}
	
	
	
	@RequestMapping("vacation.do")
	public String vacation() {
		
		
	return "work/vacationView"; 
		
		
	}
}
