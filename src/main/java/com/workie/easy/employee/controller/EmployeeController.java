package com.workie.easy.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.workie.easy.employee.model.service.EmployeeService;
import com.workie.easy.employee.model.dto.Employee;

@SessionAttributes("loginEmp")
@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	/*로그인 화면 연결*/
	@RequestMapping("loginForm.do")
	public String loginForm(){

		return "login/loginForm";
		
	}
	
	/*로그인*/
	@RequestMapping("login.do")
	public String loginEpm(Employee emp, Model model){
		
		Employee loginEmp = empService.loginEmp(bCryptPasswordEncoder, emp);
		model.addAttribute("loginEmp",loginEmp);

		return "redirect:/";
		
	}
	
	/*회원가입*/
	@RequestMapping("logout.do")
	public String logout(SessionStatus status){
		
		status.setComplete();

		return "login/loginForm";
		
	}
	
	/*회원가입 화면 연결*/
	@RequestMapping("joinForm.do")
	public String joinForm() {
		
		return "login/joinForm";
	}
	
	/*회원가입*/
	@RequestMapping("insertEmp.do")
	public String insertEmp(@ModelAttribute Employee emp, HttpSession session) {
		
		String reg = emp.getEmpReg().substring(6,7);
		if(reg.equals("1")) {
			emp.setGender("M");
		}else {
			emp.setGender("F");
		}
		
		System.out.println("암호화 전  비밀번호 : "+emp.getEmpPwd());
		
		String encPwd = bCryptPasswordEncoder.encode(emp.getEmpPwd());
		
		System.out.println("암호화 후  비밀번호 : "+encPwd);
		
		emp.setEmpPwd(encPwd);
		
		empService.insertEmp(emp);
		
		session.setAttribute("msg", "회원가입 성공");
		
		return "login/loginForm";
	}
}
