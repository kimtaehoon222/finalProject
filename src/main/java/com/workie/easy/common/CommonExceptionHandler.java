package com.workie.easy.common;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.employee.LoginException;

@ControllerAdvice("com.workie.easy")
public class CommonExceptionHandler {
	
	
	@ExceptionHandler(value = Exception.class)
	public ModelAndView controllerExceptionHandler (Exception e) {
		
		e.printStackTrace();
		return new ModelAndView("common/errorPage").addObject("msg",e.getMessage());
	
	}
	
	@ExceptionHandler(LoginException.class)
	public ModelAndView loginExceptionHandler(LoginException e) {
		
		e.printStackTrace();
		return new ModelAndView("login/loginForm").addObject("msg",e.getMessage());
		
	}
	
	@ExceptionHandler(DataIntegrityViolationException.class)
	public ModelAndView sqlExceptionHandler(DataIntegrityViolationException e) {
		
		e.printStackTrace();
		return new ModelAndView("login/joinForm").addObject("msg","회원가입에 실패하였습니다.");
		
	}
}
