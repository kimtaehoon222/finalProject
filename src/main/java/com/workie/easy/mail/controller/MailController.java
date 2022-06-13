package com.workie.easy.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.workie.easy.mail.model.service.MailService;

@Controller
public class MailController {

	//생성자 주입방식을 통한 의존성 주입으로 변경하기!
	@Autowired
	private MailService mailService;
	
}
