package com.workie.easy.employee.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.workie.easy.employee.model.service.EmployeeService;
import com.workie.easy.mail.model.dto.Mail;
import com.workie.easy.mail.model.service.MailService;
import com.workie.easy.schedule.model.dto.Schedule;
import com.workie.easy.schedule.model.service.ScheduleService;
import com.workie.easy.employee.model.dto.Employee;

/*
* <pre>
* Class : EmployeeController
* Comment : client가 보낸 데이터를 가공해서 service을 호출하고 결과를 view에 전달한다.
* History
* 2022/06/13 (전재은) 처음 작성
* 2022/06/14 (전재은) 로그인, 회원가입, 로그아웃 추가
* </pre>
* @version 1
* @author 전재은
* @see EmployeeService, EmployeeServiceImpl
*/
@SessionAttributes("loginEmp")
@Controller
public class EmployeeController {
	
	/*Service 연결을 위한 Autowired*/
	@Autowired
	private EmployeeService empService;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	/*암호화를 위한 Autowired*/
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	/*메인 화면 연결*/
	@RequestMapping("main.do")
	public String mainRead(HttpSession session, Model model){
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		model.addAttribute("loginEmp", loginEmp);
		
		/* 김지수 : 읽지 않은 메일 개수 조회 */
		int unReadmailListCount = mailService.selectMailListNoRead(loginEmp.getEmpNo()).size();
		model.addAttribute("mailCount", unReadmailListCount);
		
		/* 김재호 : */
		
		
		/* 임현빈 : */
		
		
		/* 전재은 : */
		/*조회 조건*/
		Schedule sked = new Schedule();
		String formatDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));	//오늘날짜
		sked.setEmpNo(loginEmp.getEmpNo());														//로그인 사원번호
		sked.setSkedStart(formatDate);															//시작일 : 오늘 날짜	
		
		ArrayList<Schedule> skedList = scheduleService.selectDayScheduleList(sked);				//결과 목록
		
		for(int i=0; i < skedList.size(); i++) {												//for문으로 rgbCode설정(반투명)
			skedList.get(i).setRgbCode("rgba("+skedList.get(i).getRgbCode()+", 0.5)");
		}
		model.addAttribute("skedList", skedList);												//세션에 올리기
		
		return "main";
		
	}
	
	/*로그인 화면 연결*/
	@RequestMapping("loginForm.do")
	public String loginForm(){

		return "login/loginForm";
		
	}
	
	/*로그인*/
	@RequestMapping("login.do")
	public String loginEpm(Employee emp, Model model, RedirectAttributes redirectAttributes){
		
		Employee loginEmp = empService.loginEmp(bCryptPasswordEncoder, emp);
		model.addAttribute("loginEmp",loginEmp);
		
		/* 로그인시에만 보여지는 메세지(메인 로고 클릭시엔 보여지면 안됨) */
		String topMsg = loginEmp.getEmpName() + "님 반갑습니다.";
		redirectAttributes.addFlashAttribute("topMsg", topMsg);
		
		return "redirect:main.do";
		
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
