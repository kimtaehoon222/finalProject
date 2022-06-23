package com.workie.easy.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.workie.easy.common.model.Pagination;
import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.schedule.model.dto.Schedule;
import com.workie.easy.schedule.model.service.ScheduleService;

/*
* <pre>
* Class : ScheduleController
* Comment : client가 보낸 데이터를 가공해서 service을 호출하고 결과를 view에 전달한다.
* History
* 2022/06/15 (전재은) 처음 작성, 일정전체조회 추가
* 2022/06/16 (전재은) 일정 화면 전환 추가, 일정전체조회 수정
* 2022/06/17 (전재은) 일정전체조회 수정
* 2022/06/18 (전재은) 일정상세조회 추가
* 2022/06/20 (전재은) 일정등록추가
* 2022/06/21 (전재은) 일정검색, 선택일자일정목록조회 추가
* 2022/06/22 (전재은) 일정검색 수정
* 2022/06/23 (전재은) 선택일자일정목록조회 수정
* </pre>
* @version 1
* @author 전재은
* @see ScheduleService, ScheduleServiceImpl
*/
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
	@RequestMapping("selectSkedList.do")
	@ResponseBody
	public List<Map<String, Object>> selectScheduleList(@RequestParam("empNo") int empNo 
												 ,@RequestParam(value="skedCode", required=false) String skedCode) {
		/*파라미터값 정리*/
		Schedule sked = new Schedule();
		sked.setEmpNo(empNo);
		sked.setSkedCode(skedCode);
		
		/*서비스 연결*/
		ArrayList<Schedule> skedlist = scheduleService.selectScheduleList(sked);
		
		/*ArrayList를 담을 JsonObject, Json을 배열로 변환시켜줄 JsonArray*/
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		/*HashMap에 값 담기(fullCalendar 형식으로 담기 위해서)*/
		HashMap<String, Object> hash = new HashMap<>();		
		
		/*반복문으로 시간값 정리, hashMap에 값 담고 json처리*/
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
	@RequestMapping("selectSked.do")
	@ResponseBody
	public JSONObject selectSchedule(int empNo, int skedNo, @RequestParam(value="skedCode", required=false) String skedCode) {
		
		/*파라미터값 정리*/
		Schedule sked = new Schedule();
		sked.setSkedNo(skedNo);
		sked.setEmpNo(empNo);
		sked.setSkedCode(skedCode);
		
		/*서비스 연결*/
		Schedule s = scheduleService.selectSchedule(sked);
		
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
	@RequestMapping("insertSked.do")
	public String insertSchedule(Schedule sked) {
		
		System.out.println(sked);
		
		scheduleService.insertSchedule(sked);
		
		return "schedule/schedule";
		
	}
	
	
	/*일정 수정*/
	@RequestMapping("updateSked.do")
	public String updateSchedule(Schedule sked) {
		
		System.out.println("scheduleUpdate : "+sked);
		
		scheduleService.updateSchedule(sked);
		
		return "schedule/schedule";
		
	}
	
	
	/*일정 삭제*/
	@RequestMapping("deleteSked.do")
	public String deleteSchedule(String skedNo) {
		
		System.out.println("scheduleDelete : "+skedNo);
		
		scheduleService.deleteSchedule(skedNo);
		
		return "schedule/schedule";
		
	}

	
	/*일정 검색*/
	@RequestMapping("searchSked.do")
	@ResponseBody
	public JSONArray searchScheduleList(String keyWord, int empNo,
				@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		/*파라미터 테스트*/
		System.out.println("검색 키워드 : "+keyWord);
		System.out.println("로그인 사원 : "+empNo);
		
		/*mapper에 parameter로 넘기기 위한 Map*/
		Map<String,Object> hash = new HashMap<String,Object>();
		
		hash.put("keyWord", "%"+keyWord+"%");
		hash.put("empNo", empNo);
		
		/*----페이지네이션----*/
		
		/*검색 일정 수*/
		int skedListCount = scheduleService.selectListCount(hash);
		System.out.println("일정 수 : "+skedListCount);
		
		/*페이지 정보*/
		PageInfo pi = Pagination.getPageInfo(skedListCount, currentPage, 10, 5);
		
		/*----페이지네이션----*/
		
		/*서비스 연결*/
		ArrayList<Schedule> skedlist = scheduleService.searchScheduleList(hash, pi);
		
		/*ArrayList를 담을 JsonObject, Json을 배열로 변환시켜줄 JsonArray*/
		JSONArray jsonArr = new JSONArray();
		
		/*반복문으로 시간값 정리, hashMap에 값 담고 json처리*/
		for(int i=0; i < skedlist.size(); i++) {
			if(skedlist.get(i).getSkedStartTime() != null) {				//시작시간 있는 경우 추가
				String start = skedlist.get(i).getSkedStart();
				String startTime = skedlist.get(i).getSkedStartTime();
				skedlist.get(i).setSkedStart(start+"T"+startTime);
			}
			if(skedlist.get(i).getSkedEndTime() != null) {					//종료시간 있는 경우 추가
				String end = skedlist.get(i).getSkedEnd();
				String endTime = skedlist.get(i).getSkedEndTime();
				skedlist.get(i).setSkedEnd(end+"T"+endTime);
			}
			
			JSONObject jsonSked = new JSONObject();
		
			jsonSked.put("id", skedlist.get(i).getSkedNo()); 				//ID
			
			jsonSked.put("start", skedlist.get(i).getSkedStart()); 			//시작일자
			jsonSked.put("end", skedlist.get(i).getSkedEnd()); 				//종료일자
			
			jsonSked.put("title", skedlist.get(i).getSkedTitle()); 			//제목
			jsonSked.put("content", skedlist.get(i).getSkedContent());		//색상

			jsonSked.put("cat", skedlist.get(i).getSkedCName());			//분류명
			
			jsonSked.put("pi", pi);											//pi
			
			jsonArr.add(jsonSked); 											// 대괄호 안에 넣어주기[중괄호]
		}
		
		return jsonArr;
		
	}
	
	/*선택일자 일정목록 조회*/
	@RequestMapping("selectDayList.do")
	@ResponseBody
	public JSONArray selectDayScheduleList(int empNo, String skedDay) {
		Schedule sked = new Schedule();
		sked.setEmpNo(empNo);
		sked.setSkedStart(skedDay);
		
		/*서비스 연결*/
		ArrayList<Schedule> skedlist = scheduleService.selectDayScheduleList(sked);
		
		/*ArrayList를 담을 JsonObject, Json을 배열로 변환시켜줄 JsonArray*/
		JSONArray jsonArr = new JSONArray();
		
		/*반복문으로 시간값 정리, hashMap에 값 담고 json처리*/
		for(int i=0; i < skedlist.size(); i++) {
			
			JSONObject jsonSked = new JSONObject();
			
			jsonSked.put("id", skedlist.get(i).getSkedNo()); 				//ID
			jsonSked.put("title", skedlist.get(i).getSkedTitle()); 			//제목
			jsonSked.put("content", skedlist.get(i).getSkedContent()); 		//내용
			jsonSked.put("startTime", skedlist.get(i).getSkedStartTime()); 	//시작시간
			jsonSked.put("endTime", skedlist.get(i).getSkedEndTime());		//종료시간
			jsonSked.put("color", "rgba("+skedlist.get(i).getRgbCode()+", 0.5)");		//종료시간
			
			jsonArr.add(jsonSked);
		}
		
		return jsonArr;
		
	}

}
