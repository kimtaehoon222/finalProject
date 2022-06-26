package com.workie.easy.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.workie.easy.chat.model.dto.Chat;
import com.workie.easy.chat.model.dto.Contect;
import com.workie.easy.chat.model.service.ChatService;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.mail.model.dto.Department;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("chat.do")
	public ModelAndView Chat(HttpSession session, ModelAndView mv, @RequestParam(value="empNo",required = false, defaultValue="0") int empNo) {
		
		Chat chat = new Chat();
		int fromChat = ((Employee) session.getAttribute("loginEmp")).getEmpNo();
		chat.setToChat(empNo);
		chat.setFromChat(fromChat);

		Contect toChat = chatService.selectEmployee(empNo);
		ArrayList<Chat> chatList = chatService.selectChatList(chat);
		
		System.out.println("==============tochat===========" + toChat);
		System.out.println("==========empNo===========" + empNo);
		
		mv.addObject("toChat", toChat);
		mv.addObject("chatList", chatList);
		mv.setViewName("chat/chat");

		return mv; 
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
	
	@ResponseBody
	@RequestMapping("sendMessage.do")
	public String insertMessage(Chat chat) {
		int result = chatService.insertMessage(chat);
		
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("updateStatus.do")
	public String updateStatus(Contect contect) {
		int result = chatService.updateStatus(contect);
		System.out.println("result : "  + result);
		
		return String.valueOf(result);
		
	}
	
	
}
