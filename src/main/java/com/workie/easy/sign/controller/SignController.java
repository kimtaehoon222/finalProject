package com.workie.easy.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.workie.easy.sign.model.service.SignService;

@Controller
public class SignController {

	
	@Autowired
	public SignService signService;
}
