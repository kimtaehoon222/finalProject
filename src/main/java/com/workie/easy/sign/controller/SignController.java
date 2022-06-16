package com.workie.easy.sign.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println("찍히는지 테스트");
		return "sign/signView";
	}
	
	/* 결재선 지정 조회 */
	
	@RequestMapping(value = "selectList.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView selectSign(Locale locale, ModelAndView mv) {
		System.out.println("찍히는지 테스트222");
		
		/*
		Employee semp = signService.sEmp(sEmp);
		*/
		
		ArrayList<Employee> list = signService.selectList();
		
		mv.addObject("list", list).setViewName("sign/signView");
		
		System.out.println("list에 담긴 값" + list);
		
		return mv;
	}

}
