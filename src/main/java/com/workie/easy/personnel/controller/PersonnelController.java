package com.workie.easy.personnel.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.personnel.model.service.PersonnelService;


@Controller
public class PersonnelController {
	
	@Autowired // 의존성 주입
	private PersonnelService personnelService;
	
	
	@RequestMapping("myPage.do")//화면 전환용
	public String myPage() {
        return "personnel/myPageView";
	  }
	
	@RequestMapping("updateEmp.do")
	public String updateEmp(@ModelAttribute Employee e,
			                Model model) {
		
		Employee empInfo = personnelService.updateEmp(e);
		
		model.addAttribute("loginUser", empInfo);
		
		 return "personnel/myPageView";//수정후 다시 마이페이지로
	}
	
	
	@RequestMapping("empList.do")
	public String selectListEmp(Model model) {
		
		ArrayList<Employee> list = personnelService.selectListEmp();
		
		model.addAttribute("list", list);
		return "personnel/empListView";		
	}
}
