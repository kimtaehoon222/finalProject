package com.workie.easy.sign.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.service.SignService;

@Controller
public class SignController {
/* 결재선 지정에서 select  체크 된 박스들 form에 insert 수신처도 똑같이 제목 내용 파일 insert root 요청결재함으로*/
	
	@Autowired
	public SignService signService;
	
	/* 결재 함 화면 전환 */
	@RequestMapping("signView.do")
	public String readSignView() {
		return "sign/signView";
	}
	
	/* 결재선 지정 조회 */
	public String selectSign(Model model) {
		/*
		Employee semp = signService.sEmp(sEmp);
		*/
		ArrayList<Employee> list = signService.selectList();
		
		model.addAttribute("list", list);
		
		return "sign/signView";
	}

}
