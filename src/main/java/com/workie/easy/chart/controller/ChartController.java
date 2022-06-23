package com.workie.easy.chart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workie.easy.chart.model.dto.Chart;
import com.workie.easy.chart.model.dto.ChartForMail;
import com.workie.easy.chart.model.service.ChartService;
import com.workie.easy.employee.model.dto.Employee;

/*
* <pre>
* Class : ChartController
* Comment : 통계 관련 기능(R)을 처리하기 위해 view에서 데이터를 전달받고, view에게 데이터를 결과를 전달하는 클래스
* 
* History
* 2022/06/22 (김지수) 
* 
* 
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see views/chart 하위의 모든 jsp, ChartService 인터페이스의 구현체인 ChartServiceImpl
*
*/
@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;
	
	@RequestMapping("chartHome.do")
	public String readChartHome() {
		
		return "chart/chartListView";
	}

	/* 화면에서 통계 항목에 따라 호출되는 메소드를 분류해주기 위한 메소드 : type에 따라 호출되는 내부 메소드가 다르다.*/
	@ResponseBody
	@RequestMapping(value="chartList.do", method=RequestMethod.POST)
	public JSONArray selectChartList(@ModelAttribute Chart chart, HttpServletResponse response) {
		
		System.out.println("category" + chart.getCategory());
		System.out.println("year" + chart.getYear());
		System.out.println("month" + chart.getMonth());
		System.out.println("type" + chart.getType());
		
		Gson gson = new Gson();
		JSONArray list = null; 
		
		/* 사용자가 선택한 */
		switch (chart.getCategory()) {
		case "mail" : 
			list = selectChartListForMail(chart);
			break;
		case "person" : 
			list = selectChartListForPerson(chart);
			break;
		default:
			break;
		}
		
		/*String json = "";
		json = gson.toJson(list);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		try {
			response.getWriter().print(json);
		}catch(IOException e) {
			e.printStackTrace();
		}*/
		
		return list;
	}
	
	/* 인사 관련 통계를 추출하는 메소드 */
	private JSONArray selectChartListForPerson(Chart chart) {
		return null;
	}

	/* 메일 관련 통계를 추출하는 메소드 */
	private JSONArray selectChartListForMail(Chart chart) {
		
		ChartForMail chartForMail = new ChartForMail();
		
		ArrayList<ChartForMail> chartList = new ArrayList<ChartForMail>();
		
		if(chart.getMonth().equals("allMonth")) { /* 연도만 선택하고 해당 연도의 전체 월 조회시  */
			chartForMail.setStartDate(chart.getYear()+"/01/01");
			chartForMail.setEndDate(chart.getYear()+"/12/31");

			if(chart.getType().contentEquals("toMails")) { 
				
				/* list 조회  : 수신 */
				chartList = chartService.selectChartListForMail(chartForMail);
			}else {
				
				/* list 조회  : 발신 */
				chartList = chartService.selectChartListForMailFrom(chartForMail);
			}
			
		}else { /* 연도도 선택하고 해당 연도의 특정 월 조회시  */
			
			/* 시작일 셋팅 : 모든 월의 시작은 01일 */
			chartForMail.setStartDate(chart.getYear() + "/" + chart.getMonth() + "/01");
			
			/* 해당 월의 마지막 날 구하기 */
			Calendar calendar = Calendar.getInstance();
			
			/* Calendar에서 월은 0~11이므로 1을 반드시 빼주어야 한다. */ 
			calendar.set(Integer.parseInt(chart.getYear()), Integer.parseInt(chart.getMonth())-1, 1);
			
			/* 위에서 파라미터로 넣은 해당 월의 마지막 날짜를 구해온다. */
			int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH); 
			
			/* 마지막일 셋팅 : 월마다 마지막일이 다르므로 위에서 얻은 해당 월의 마지막 날을 넣는다. */
			chartForMail.setEndDate(chart.getYear() + "/" + chart.getMonth() + "/" + lastDay);
			
			if(chart.getType().contentEquals("toMails")) { 
				
				/* list 조회  : 수신 */
				chartList = chartService.selectChartListForMailByMonth(chartForMail);
			}else {
				
				/* list 조회  : 발신 */
				chartList = chartService.selectChartListForMailByMonthFrom(chartForMail);
			}
		}
		
		JSONArray jsonChartList = new JSONArray();
		JSONObject jsonObject = null;
		
		if(!chartList.isEmpty()) {
			for(ChartForMail chartMail : chartList) {
				
				/* JSON 객체 생성 */
				jsonObject = new JSONObject();
				
				/* 생성된 JSON 객체에 list의 자바 데이터 를 put*/
				jsonObject.put("groupBy", chartMail.getGroupBy());
				jsonObject.put("departD1", chartMail.getDepartD1());
				jsonObject.put("departD2", chartMail.getDepartD2());
				jsonObject.put("departD3", chartMail.getDepartD3());
				jsonObject.put("departD4", chartMail.getDepartD4());
				jsonObject.put("departD5", chartMail.getDepartD5());
				jsonObject.put("departD6", chartMail.getDepartD6());
				jsonObject.put("departD7", chartMail.getDepartD7());
				
				/* 데이터가 담긴 JSON 객체를 JSON배열에 추가 */
				jsonChartList.add(jsonObject);
			}
		}
		
		return jsonChartList;
	}
}
