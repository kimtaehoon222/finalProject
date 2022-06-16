package com.workie.easy.work.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		int empNo = loginEmp.getEmpNo();
		
		Work w = workService.selectWork(empNo);
		
		mv.addObject("w", w);
		mv.setViewName("work/workMainView2");

		return mv;
		
		
	}
	
	@RequestMapping("update.do")
	public String updateWork(HttpSession session, HttpServletRequest request) {
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		int empNo = loginEmp.getEmpNo();
		
		int sNo = Integer.parseInt(request.getParameter("status"));
		String wNo = request.getParameter("workNo");
		if(sNo == 1) {//넘어온 상태값이 1이면 insert 출근
			workService.insertWork(empNo);
		}else if(sNo == 2) {//상태값이 2이면 update 퇴근
			workService.updateWork(wNo);
		}
		
		/*WorkSInfo wsi = new WorkSInfo(wNo, sNo);
		workService.insertWorkStatus(wsi);*/
		
		return "redirect:work.do"; 
		
		
	}
	

	@RequestMapping("selectWorkList.do")
	public ModelAndView selectWorkList2(HttpSession session, ModelAndView mv
										, @RequestParam("year") int year
										, @RequestParam("month") int month
										, @RequestParam("empNo") int empNo) {
		
		String strYear = Integer.toString(year).substring(2);
		String strMonth = null;
		if(month < 10) {
			strMonth = "0" + month;
		}
		else {
			strMonth = Integer.toString(month);
		}
		
		String strDate = strYear + strMonth + "01";
		System.out.println("===================================================" +strYear);
		System.out.println("===================================================" +strMonth);
		System.out.println("===================================================" +strDate);
		Work work = new Work(empNo, strDate);
		
		System.out.println("===================================================" +work);
		//사원의 이번달 근무정보 가져오기
		ArrayList<Work> wlist = workService.selectWorkList(work);
		System.out.println("===================================================" +wlist);
		mv.addObject("wlist", wlist);
		
		mv.addObject("year", year);
		mv.addObject("month", month);
		
		mv.setViewName("work/workListView2");
		
		return mv;
	}
	
	
	
	@RequestMapping("vacation.do")
	public String vacation(Model model, HttpSession session, HttpServletRequest request) {
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		int empNo = loginEmp.getEmpNo();
		
		return "work/vacationView"; 
		
		
	}
}
