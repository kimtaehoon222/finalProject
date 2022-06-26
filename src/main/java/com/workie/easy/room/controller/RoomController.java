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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String selectResListForm() {
		return "room/roomMain";
		
	}
	
	@ResponseBody
	@RequestMapping(value ="selectResList.do", method=RequestMethod.GET, produces="application/json; charset=utf-8")
	/*consumes는 클라이언트가 서버에게 보내는 데이터 타입을 명시한다.
	  produces는 서버가 클라이언트에게 반환하는 데이터 타입을 명시한다 response.setContentType
	  charset=utf-8 한글이 들어올 수 있으므로 인코딩*/
	public List<Map<String, Object>> selectResList(HttpSession session, HttpServletRequest request,int roomNo) {
		
		System.out.println("ggggggggggg");
       Room room = new Room();
       room.setRoomNo(roomNo);
	
		ArrayList<Room> resList = roomService.selectResList(room);

		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();

		System.out.println("회의실 예약 " + resList);
		HashMap<String, Object> hash = new HashMap<>();		

		for (Room r : resList) {
			hash.put("meetTitle", r.getMeetTitle());
			hash.put("meetGoal", r.getMeetGoal());
			hash.put("resNo", r.getResNo());
			hash.put("roomNo", r.getRoomNo());
			hash.put("empNo", r.getEmpNo());
			hash.put("empName", r.getEmpName());
			hash.put("roomName", r.getRoomName());
			hash.put("startDate", r.getStartDate());
			hash.put("endDate", r.getEndDate());
			hash.put("roomNo", r.getRoomNo());
			
			jsonObj = new JSONObject(hash); 						
            jsonArr.add(jsonObj);
		}
		return jsonArr;
		
	
		}

	
}
