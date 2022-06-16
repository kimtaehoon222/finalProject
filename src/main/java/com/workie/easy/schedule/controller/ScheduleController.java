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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.workie.easy.employee.model.dto.Employee;
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
	public List<Map<String, Object>> scheduleList(@RequestParam("empNo") int empNo) {
		
		/*서비스 연결*/
		ArrayList<Schedule> skedlist = scheduleService.scheduleList(empNo);
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
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
			
			for(Entry<String,Object> e : hash.entrySet()) {
				System.out.println("테스트 출력 = "+e.getKey()+" : "+e.getValue());
			}
			
			jsonObj = new JSONObject(hash); 							//중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); 										// 대괄호 안에 넣어주기[중괄호]
		}
		
		return jsonArr;
		
	}
	
	/* model에 넣어서 출력하는 방법
	@RequestMapping(value = "skedSelectList.do", method = RequestMethod.GET)
	public String scheduleList2(Schedule s, Model model) {

		try {
			ArrayList<Schedule> schedule = scheduleService.scheduleList2();
			model.addAttribute("scheduleList", schedule);
			
			if (!schedule.isEmpty()) {
				for (Schedule ss : schedule) {
					System.out.println("title:"+ss.getSkedTitle());
					System.out.println("start:"+ss.getSkedStart());
					System.out.println("end:"+ss.getSkedEnd());
					System.out.println("rgb:"+ss.getRgbCode());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "일정 목록 조회에 실패했습니다.");
		}
		
		System.out.println("+++++++++++++++++++++++++++++++++++++++++");
		
		return "schedule/schedule";
		
	}
	*/
	
	
	/*선택 일정 조회*/
	@RequestMapping("skedSelect.do")
	public String scheduleSelect() {
		
		return null;
		
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
