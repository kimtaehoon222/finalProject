package com.workie.easy.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.schedule.model.dto.Schedule;
import com.workie.easy.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {
	
//	private static final Logger log = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private ScheduleService scheduleService;
	
	
	/*일정 전체 조회 test*/
	/*@GetMapping("skedSelectList.do")
    @ResponseBody
	public List<Map<String, Schedule>> scheduleList() {
		List<Map<String, Schedule>> list = scheduleService.scheduleList();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Schedule> hash = new HashMap<>();		
		
		for(int i=0; i < list.size(); i++) {			
			hash.put("id", list.get(i).get("skedNo")); 			//ID
			hash.put("title", list.get(i).get("skedTitle")); 	//제목
			hash.put("start", list.get(i).get("skedStart")); 	//시작일자
			hash.put("end", list.get(i).get("skedEnd")); 		//종료일자
			
			jsonObj = new JSONObject(hash); //중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
		}
		
		return jsonArr;
	}*/
	
	/*@RequestMapping(value = "skedSelectList.do", method = RequestMethod.GET)
	public ModelAndView scheduleList2(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "schedule";
		List<Schedule> schedule = null;
		try {
			schedule = scheduleService.scheduleList2();
			request.setAttribute("scheduleList", schedule);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}*/


	
	/*일정 전체 조회*/
//	@RequestMapping(value="skedSelectList.do", method=RequestMethod.GET)
/*	@RequestMapping("skedSelectList.do")
	@ResponseBody //Json방식
	public String scheduleSelectList() {
		
		return null;
		
	}*/
	
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
