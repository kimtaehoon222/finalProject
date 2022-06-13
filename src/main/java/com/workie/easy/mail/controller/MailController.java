package com.workie.easy.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workie.easy.mail.model.service.MailService;

@Controller
public class MailController {
	
	//생성자 주입방식을 통한 의존성 주입으로 변경하기!
	@Autowired
	private MailService mailService;

	/* 메뉴바에서 메일 클릭시 본 메소드로 도착 */ 
	@RequestMapping("mailHome.do")
	public String readMailHome() {
		return "mail/mailHomeView"; 
	}
	
	@RequestMapping("receiveMailList.do")
	public String selectReceiveMailList() {
		return "mail/mailReceiveListView";
	}
	
	@RequestMapping("sendMailList.do")
	public String selectSendMailList() {
		return "mail/mailSendListView"; 
	}

	@RequestMapping("reserveMailList.do")
	public String selectReserveMailList() {
		return "mail/mailReserveListView"; 
	}

	@RequestMapping("deleteMailList.do")
	public String selectDeleteMailList() {
		return "mail/mailDeleteListView"; 
	}
	
	
	
}
