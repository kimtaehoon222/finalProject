package com.workie.easy.personnel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.common.CommException;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.personnel.model.service.PersonnelService;

@Controller
public class PersonnelController {
	
	@Autowired // 의존성 주입
	private PersonnelService personnelService;
	
	@Autowired//빈으로 등록했으니까 의존성 주입
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("myPage.do")//마이페이지로 화면 전환용
	public String myPage() {
        return "personnel/myPageView";
	  }
	
	@RequestMapping("updateEmp.do")//마이페이지 수정 페이지
	public String updateEmp(@ModelAttribute Employee e,
			                Model model) {
		
		Employee empInfo = personnelService.updateEmp(e);

		model.addAttribute("loginEmp", empInfo);
		
		 return "personnel/myPageView";//수정후 다시 마이페이지로
	}
	
	 @RequestMapping(value="updatePwd.do",method=RequestMethod.POST)//비번 수정 페이지
	 public String updatePwd(HttpSession session,
			  				 @RequestParam("originPwd") String originPwd,
			                 @RequestParam("updatePwd") String updatePwd, 
			                 Model model) {
		    
		    Employee e = (Employee) session.getAttribute("loginEmp");
		    System.out.println("비밀번호 변경 세선 확인 " + e );
		    System.out.println("비밀번호 변경 세선 확인 " + originPwd );
		    System.out.println("비밀번호 변경 세선 확인 " + updatePwd );
		    Employee emp = personnelService.updatePwd(bCryptPasswordEncoder,e,originPwd,updatePwd);
			
			model.addAttribute("loginEmp", emp);
		    return "personnel/myPageView";
		  	 }
	
	 @RequestMapping("empList.do")//재직중인 직원 목록
	 public String selectEmpList(Model model) {
		
		ArrayList<Employee> list = personnelService.selectEmpList();
		
		model.addAttribute("list", list);
		return "personnel/empListView";		
	}
	 
	 @RequestMapping("detailEmp.do") 
     public ModelAndView selectEmp(String eId , ModelAndView mv) {
		 
		 Employee e = personnelService.selectEmp(eId);
		 System.out.println("직원 상세 페이지 값"+ e);
		 mv.addObject("e",e).setViewName("personnel/empDetailView");

		 return mv;	
	 }

		  @RequestMapping("updateEmpform.do")//화면전환용
	   public ModelAndView updateForm(String eId , ModelAndView mv) {
		   
		   mv.addObject("e", personnelService.selectEmp(eId))
		   .setViewName("personnel/empUpdateForm");
		   
		   return mv;
	   }
	 @RequestMapping("updateEmpInfo.do")
	 public ModelAndView updateEmpInfo(Employee e, ModelAndView mv) {
		 
		 personnelService.updateEmpInfo(e);
		 return null;
		 
	 }
	 
	 @RequestMapping("retiredEmp.do")
	 public String deleteEmp(String eId) {
		 
		 personnelService.deleteEmp(eId);
		 
		 return "redirect:empList.do";
	 }
}
