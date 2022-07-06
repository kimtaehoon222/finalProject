package com.workie.easy.room.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.jdi.Value;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.room.model.dto.Room;
import com.workie.easy.room.model.service.RoomService;
import com.workie.easy.schedule.model.dto.Schedule;

@Controller
public class RoomController {
 
	@Autowired
	RoomService roomService;
	
	@RequestMapping("roomList.do")
	public String selectResListForm(HttpSession session, Model model) {
		
		return "room/roomMainView";
		
	}
	

	@ResponseBody
	@RequestMapping(value ="selectResList.do", produces="application/json; charset=utf-8")

	public List<Map<String, Object>> selectResList(int roomNo) {
		
        Room room = new Room();
        room.setRoomNo(roomNo);
	
		ArrayList<Room> resList = roomService.selectResList(room);

		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();

		HashMap<String, Object> hash = new HashMap<>();		

		for (Room r : resList) {
			hash.put("meetTitle", r.getMeetTitle());
			hash.put("meetGoal", r.getMeetGoal());
			hash.put("resNo", r.getResNo());
			hash.put("roomNo", r.getRoomNo());
			hash.put("empNo", r.getEmpNo());
			hash.put("empName", r.getEmpName());
			hash.put("startDate", r.getStartDate());
			hash.put("endDate", r.getEndDate());
			hash.put("deptCode", r.getDeptCode());
			
			jsonObj = new JSONObject(hash); 						
            jsonArr.add(jsonObj);
		}
		return jsonArr;
		
	
		}
	@ResponseBody
	@RequestMapping(value ="detailRes.do", produces="application/json; charset=utf-8")
	public JSONObject selectRes(int resNo) {
		
		System.out.println("회의실 회의실 " + resNo);
	
		Room room = new Room();
	    room.setResNo(resNo);
	  
	    
	    Room r = roomService.selectRes(room);
	    
		/*Json에 담기*/
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("resNo", r.getResNo());
		jsonObj.put("roomNo", r.getRoomNo());
		jsonObj.put("empNo", r.getEmpNo());
		jsonObj.put("meetTitle", r.getMeetTitle());
		jsonObj.put("meetGoal", r.getMeetGoal());		
		jsonObj.put("empName", r.getEmpName());
		jsonObj.put("roomName", r.getRoomName());
		jsonObj.put("startDate", r.getStartDate());
		jsonObj.put("endDate", r.getEndDate());
		jsonObj.put("deptName", r.getDeptName());
		return jsonObj;
		
	}
		
	@ResponseBody
	@RequestMapping(value ="selectRoomList.do" ,produces="application/json; charset=utf-8")
	public List<Map<String, Object>> selectRoomList() {
		
	     
	     JSONArray jsonArr = new JSONArray();
		 JSONObject jsonObj = new JSONObject();
	     
	     ArrayList<Room> rList = roomService.selectRoomList();
	     HashMap<String, Object> hash = new HashMap<>();		

		for (Room r : rList) {
			hash.put("roomName", r.getRoomName());
			hash.put("roomNo", r.getRoomNo());
			jsonObj = new JSONObject(hash); 						
            jsonArr.add(jsonObj);
		}
		return jsonArr;
	
	}
	
	@ResponseBody
	@RequestMapping("insertRes.do")
	public String insertRes(String startDate, String endDate, int roomNo,
			                String meetTitle, String meetGoal, HttpSession session) {
		
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		
		Room room = new Room();
        room.setStartDate(startDate);
        room.setEndDate(endDate);
        room.setRoomNo(roomNo);
        room.setMeetTitle(meetTitle);
        room.setMeetGoal(meetGoal);
        room.setEmpNo(loginEmp.getEmpNo());
        
        int checkDate = roomService.selectCheckDate(room);       
       
        JSONObject jsonObj = new JSONObject();
        if (checkDate != 0) {
			
			jsonObj.put("n", -1);
			
			return jsonObj.toString();
			
		}else {
			
			int newRes = roomService.insertRes(room);
			jsonObj.put("n", newRes);
			
			return jsonObj.toString();
		}
		
	
	}
	
	@ResponseBody
	@RequestMapping(value="deleteRes.do", produces="application/json; charset=utf-8")
	public String deleteRes(int resNo) {
		
		System.out.println("회의실 삭제 " + resNo);
		Room room = new Room();
	    room.setResNo(resNo);
	    
	    int n = roomService.deleteRes(room);
	    
	    JSONObject jsonObj = new JSONObject();
	    jsonObj.put("n", n);
	    
	    return jsonObj.toString();
		}
	
	@RequestMapping("myResList.do")
	public String selectMyResListForm() {
		
		return "room/myResListView";
		
	}
	
	@ResponseBody
	@RequestMapping(value ="selectMyResList.do", produces="application/json; charset=utf-8")
	public List<Map<String, Object>> selectMyResList(HttpSession session) {
		    
		    Employee loginEmp = (Employee)session.getAttribute("loginEmp");
			
		    Room room = new Room();
		    room.setEmpNo(loginEmp.getEmpNo());
	        ArrayList<Room> list = roomService.selectMyResList(room);
	        
	        
	        JSONArray jsonArr = new JSONArray();
			JSONObject jsonObj = new JSONObject();

			HashMap<String, Object> hash = new HashMap<>();
	        for (Room r : list) {
	        	hash.put("roomName", r.getRoomName());
				hash.put("meetTitle", r.getMeetTitle());	
				hash.put("startDate", r.getStartDate());
				hash.put("endDate", r.getEndDate());
				hash.put("resNo", r.getResNo());
				
				jsonObj = new JSONObject(hash); 						
	            jsonArr.add(jsonObj);
			}
	        return jsonArr;
			
	}
}
