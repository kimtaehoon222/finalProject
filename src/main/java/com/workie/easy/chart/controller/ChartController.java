package com.workie.easy.chart.controller;

import java.util.ArrayList;

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
	public JSONArray selectChartList(@ModelAttribute Chart chart) {
		
		System.out.println("category" + chart.getCategory());
		System.out.println("year" + chart.getYear());
		System.out.println("month" + chart.getMonth());
		System.out.println("type" + chart.getType());
		
		JSONArray list = null; 
		
		/* 사용자가 선택한 */
		switch (chart.getCategory()) {
		case "mail" : 
			list = selectChartListForMail(chart);
			break;
		default:
			break;
		}
		System.out.println(list.get(0));
		System.out.println(list.get(5));
		return list;
	}
	
	/* 메일 관련 통계를 추출하는 메소드 */
	private JSONArray selectChartListForMail(Chart chart) {
		
		System.out.println("메일용 파라미터 확인 " + chart);

		ChartForMail chartForMail = new ChartForMail();
		
		ArrayList<ChartForMail> chartList = new ArrayList<ChartForMail>();
		
		if(chart.getMonth().equals("allMonth")) { /* 연도만 선택하고 해당 연도의 전체 월 조회시  */
			chartForMail.setStartDate(chart.getYear()+"/01/01");
			chartForMail.setEndDate(chart.getYear()+"/12/31");

			chartList = chartService.selectChartListForMail(chartForMail);
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
