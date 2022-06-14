package com.workie.easy.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workie.easy.sign.model.service.SignService;

@Controller
public class SignController {

	
	@Autowired
	public SignService signService;
	
	/* 결재 함 화면 전환 */
	@RequestMapping("signView.do")
	public String readSignView() {
		return "sign/signView";
	}
	
	
}
