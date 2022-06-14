package com.workie.easy.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.workie.easy.employee.model.service.EmployeeService;
import com.workie.easy.employee.model.dto.Employee;

@SessionAttributes("loginEmp")
@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@RequestMapping(value="login.do")
	public String loginMember(Employee emp, Model model) throws Exception {
		
//		Employee loginEmp = empService.loginEmp(bCryptPasswordEncoder, emp);
//		model.addAttribute("loginEmp",loginEmp);
		throw new Exception();
		
	}
	
	@RequestMapping(value="insertEmp.do")
	public String insertEmp(@ModelAttribute Employee emp, HttpSession session) {
		
		System.out.println("암호화 전  비밀번호 : "+emp.getEmpPwd());
		
		String encPwd = bCryptPasswordEncoder.encode(emp.getEmpPwd());
		
		System.out.println("암호화 후  비밀번호 : "+encPwd);
		
		emp.setEmpPwd(encPwd);
		
		empService.insertEmp(emp);
		
		session.setAttribute("msg", "회원가입 성공");
		
		return "login/login";
		
	}
}
