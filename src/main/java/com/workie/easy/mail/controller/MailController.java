package com.workie.easy.mail.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.workie.easy.mail.model.dto.Mail;
import com.workie.easy.mail.model.service.MailService;

/*
* <pre>
* Class : MailController
* Comment : mail 관련 기능(C,R,U,D)을 처리하기 위해 view에서 데이터를 전달받고, view에게 데이터를 결과를 전달하는 클래스
* 
* History
* 2022/06/13 (김지수) insert 구현
* 2022/06/
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see views/mail 하위의 모든 jsp, MailService 인터페이스의 구현체인 MailServiceImpl
*
*/
@Controller
public class MailController {
	
	//생성자 주입방식을 통한 의존성 주입으로 변경하기!
	@Autowired
	private MailService mailService;

	/* 메일 홈 화면 전환 */ 
	@RequestMapping("mailHome.do")
	public String readMailHome() {
		return "mail/mailHomeView"; 
	}
	
	/* 메일 작성 양식 화면 전환 */
	@RequestMapping("mailSendForm.do")
	public String insertMailForm() {
		return "mail/mailSendForm"; 
	}
	
	/* 메일 전송 */
	@RequestMapping("insertMail.do")
	public String insertMail(@ModelAttribute Mail mail, HttpServletRequest request, 
							 @RequestParam(name="uploadFile", required=false) MultipartFile file) {
			
		/* */
		System.out.println(mail);
		System.out.println(file.getOriginalFilename());
		
		return "";
		//return "mail/mailSendListView"; 
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
