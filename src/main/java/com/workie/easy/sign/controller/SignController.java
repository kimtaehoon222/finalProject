package com.workie.easy.sign.controller;

import java.util.ArrayList;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.service.SignService;

@Controller
public class SignController {
/* 결재선 지정에서 select  체크 된 박스들 form에 insert 수신처도 똑같이 제목 내용 파일 insert root 요청결재함으로*/
	
	@Autowired
	public SignService signService;
	
	/* 결재 함 화면 전환 */
	@RequestMapping("signView.do")
	public String readSignView() {
		System.out.println("찍히는지 테스트");
		return "sign/signView";
	}
	
	/* 결재선 지정 조회 */
/*	
	@RequestMapping("selectList.do")
	@ResponseBody
	public ModelAndView selectSign(Locale locale, ModelAndView mv) {
		System.out.println("찍히는지 테스트222");
		
		
		//Employee semp = signService.sEmp(sEmp);
		
		
		ArrayList<Employee> list = signService.selectList();
		
		mv.addObject("list", list).setViewName("sign/signView");
		
		System.out.println("list에 담긴 값" + list);
		
		return mv;
	}
*/
	
	@ResponseBody
	@RequestMapping(value="selectList.do",method=RequestMethod.POST)
	public JSONArray selectSign() {
		System.out.println("찍히는지 테스트222");
		
		
		//Employee semp = signService.sEmp(sEmp);

		ArrayList<Employee> list = signService.selectList();
		
		JSONArray jArr = new JSONArray();
		JSONObject jsonList = null;
		
		
		System.out.println("list에 담긴 값 :" + list);
		
		System.out.println("jsonList 에 담긴 값"  + jsonList);
		
		
	for(Employee emp : list) { //추가한거
		
		jsonList = new JSONObject();	
		
		jsonList.put("deptName", emp.getDeptName()); //부서이름
		jsonList.put("empName", emp.getEmpName()); //이름
		jsonList.put("jobName", emp.getJobName()); //직급

		jArr.add(jsonList); 
		}//향상된 for문 닫기 
	
	System.out.println("jArr에 담긴 값 " + jArr);
	return jArr;

	}
}
