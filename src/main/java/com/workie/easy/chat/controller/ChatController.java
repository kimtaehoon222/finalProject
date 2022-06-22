package com.workie.easy.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.workie.easy.chat.model.dto.Contect;
import com.workie.easy.chat.model.service.ChatService;
import com.workie.easy.mail.model.dto.Department;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("chat.do")
	public String Chat() {

	return "chat/chat"; 
	}
	
	
	
	@ResponseBody
	@RequestMapping(value= "chDeptList.do",produces="application/json; charset=utf-8")
	public String selectDeptList() {
		
		ArrayList<Department> list = chatService.selectDeptList(); 
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value= "contect.do",produces="application/json; charset=utf-8")
	public String selectEmpList(String deptName) {
		
		ArrayList<Contect> list = chatService.selectEmpList(deptName); 
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	}
}
