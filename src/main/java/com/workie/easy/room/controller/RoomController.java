package com.workie.easy.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workie.easy.room.model.service.RoomService;

@Controller
public class RoomController {
 
	@Autowired
	RoomService roomService;
	
	@RequestMapping("roomList.do")
	public String selectResList() {
		return "room/";
		
	}
	
}
