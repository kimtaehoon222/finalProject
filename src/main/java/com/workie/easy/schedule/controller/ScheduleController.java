package com.workie.easy.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.workie.easy.schedule.model.dto.Schedule;
import com.workie.easy.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {
	
//	private static final Logger log = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private ScheduleService scheduleService;
	
	/*일정 페이지 전환*/
	@RequestMapping("schedule.do")
	public String schedule(Model model) {
		
		return "schedule/schedule";
		
	}
	
	/*일정 전체 조회*/
	@RequestMapping("skedSelectList.do")
	@ResponseBody
	public List<Map<String, Object>> scheduleList(@RequestParam("empNo") int empNo 
												 ,@RequestParam(value="skedCode", required=false) String skedCode) {
		/*파라미터값 정리*/
		Schedule sked = new Schedule();
		sked.setEmpNo(empNo);
		sked.setSkedCode(skedCode);
		
		/*서비스 연결*/
		ArrayList<Schedule> skedlist = scheduleService.scheduleList(sked);
		
		/*ArrayList를 담을 JsonObject, Json을 배열로 변환시켜줄 JsonArray*/
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		/*HashMap에 값 담기(fullCalendar 형식으로 담기 위해서)*/
		HashMap<String, Object> hash = new HashMap<>();		
		
		for(int i=0; i < skedlist.size(); i++) {
			if(skedlist.get(i).getSkedStartTime() != null) {			//시작시간 있는 경우 추가
				String start = skedlist.get(i).getSkedStart();
				String startTime = skedlist.get(i).getSkedStartTime();
				skedlist.get(i).setSkedStart(start+"T"+startTime);
			}
			if(skedlist.get(i).getSkedEndTime() != null) {				//종료시간 있는 경우 추가
				String end = skedlist.get(i).getSkedEnd();
				String endTime = skedlist.get(i).getSkedEndTime();
				skedlist.get(i).setSkedEnd(end+"T"+endTime);
			}
			
			hash.put("id", skedlist.get(i).getSkedNo()); 				//ID
			hash.put("title", skedlist.get(i).getSkedTitle()); 			//제목
			hash.put("start", skedlist.get(i).getSkedStart()); 			//시작일자
			hash.put("end", skedlist.get(i).getSkedEnd()); 				//종료일자
			hash.put("color", "rgb("+skedlist.get(i).getRgbCode()+")");	//색상
			
			jsonObj = new JSONObject(hash); 							//중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); 										// 대괄호 안에 넣어주기[중괄호]
		}
		
		return jsonArr;
		
	}
	
	
	/*선택 일정 상세 조회*/
//	@RequestMapping(value="skedSelect.do", produces = "application/text; charset=utf8")		//text(String)타입 한글 인코딩
	@RequestMapping("skedSelect.do")
	@ResponseBody
	public JSONObject scheduleSelect(int empNo, int skedNo, @RequestParam(value="skedCode", required=false) String skedCode) {
		
		/*파라미터값 정리*/
		Schedule sked = new Schedule();
		sked.setSkedNo(skedNo);
		sked.setEmpNo(empNo);
		sked.setSkedCode(skedCode);
		
		/*서비스 연결*/
		Schedule s = scheduleService.scheduleSelect(sked);
		
		/*Json에 담기*/
		JSONObject jsonSked = new JSONObject();
		jsonSked.put("id", s.getSkedNo());
		jsonSked.put("skedCode", s.getSkedCode());
		jsonSked.put("colorCode", s.getColorCode());
		
		jsonSked.put("title", s.getSkedTitle());
		jsonSked.put("content", s.getSkedContent());
		jsonSked.put("memo", s.getSkedMemo());
		
		jsonSked.put("start", s.getSkedStart());
		jsonSked.put("startTime", s.getSkedStartTime());
		jsonSked.put("end", s.getSkedEnd());
		jsonSked.put("endTime", s.getSkedEndTime());
		
		return jsonSked;
		
	}

	
	/*일정 등록*/
	@RequestMapping("skedInsert.do")
	public String scheduleInsert() {
		
		return null;
		
	}
	
	
	/*일정 수정*/
	@RequestMapping("skedUpdate.do")
	public String scheduleUpdate() {
		
		return null;
		
	}
	
	
	/*일정 삭제*/
	@RequestMapping("skedDelete.do")
	public String scheduleDelete() {
		
		return null;
		
	}
}
