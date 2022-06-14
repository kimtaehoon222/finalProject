package com.workie.easy.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.workie.easy")
public class CommonExceptionHandler {
	
	
	@ExceptionHandler(value = Exception.class)
	public ModelAndView controllerExceptionHandler (Exception e) {
		
		if(e.getMessage().contains("로그인에 실패했습니다.")){
			return new ModelAndView("login/loginForm").addObject("msg",e.getMessage());
		}
		if(e.getMessage().contains("회원가입에 실패하였습니다.")) {
			return new ModelAndView("login/joinForm").addObject("msg",e.getMessage());
		}
		
		e.printStackTrace();
		return new ModelAndView("common/errorPage").addObject("msg",e.getMessage());
	
	}
}
