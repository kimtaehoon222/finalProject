package com.workie.easy.sign.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.workie.easy.common.CommException;
import com.workie.easy.common.model.Pagination;
import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dto.Sign;
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
	
	
	@ResponseBody
	@RequestMapping(value="selectList.do",method=RequestMethod.POST)
	public JSONArray selectSign() { //결재선 지정 select
		System.out.println("찍히는지 테스트222");
		
		
		//Employee semp = signService.sEmp(sEmp);

		ArrayList<Employee> list = signService.selectList();
		
		JSONArray jArr = new JSONArray();
		JSONObject jsonList = null;
		
		
	for(Employee emp : list) { //추가한거
		
		jsonList = new JSONObject();	
		
		jsonList.put("deptName", emp.getDeptName()); //부서이름
		jsonList.put("empName", emp.getEmpName()); //이름
		jsonList.put("jobName", emp.getJobName()); //직급
		jsonList.put("empNo", emp.getEmpNo()); //사번

		jArr.add(jsonList); 
		}//향상된 for문 닫기 

	return jArr;

	}
	
	@RequestMapping("insertSign.do")
	public String insertSign(@ModelAttribute Sign si , HttpServletRequest request ,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) { //품의 insert

	
		if(!file.getOriginalFilename().equals("")) { //file이 비어있으면 빈문자열로 넘어옴 빈문자열이 아니라면 파일이 들어있다.
			String changeName = saveFile(file, request, si);
			
			if(changeName != null) {
				si.setOriginName(file.getOriginalFilename());
				si.setChangeName(changeName);
			}
		}

		signService.insertSign(si);
		
		String view = "redirect:signView.do";
		
		return view;
	}


	private String saveFile(MultipartFile file, HttpServletRequest request, Sign si) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		//  \\ : 파일 경로를 구분하고 \ 1개 사용시 특수문자이기에 \\를쓰어 읽어들일 수 있도록 한다.
		String savePath = resources + "\\sign_files\\";
		si.setFilePath(savePath);
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //util Date 임폴트
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		System.out.println("changeName : " + changeName);
		
		
		try {
			file.transferTo(new File(savePath + changeName)); //io FIle 임폴트 후 트라이 캐치
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file Upload Error");
		} 
		return changeName;
	}
	
	@RequestMapping("insertHelp.do")
	public String insertHelp(@ModelAttribute Sign si , HttpServletRequest request ,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) { //협조 insert

	
		if(!file.getOriginalFilename().equals("")) { //file이 비어있으면 빈문자열로 넘어옴 빈문자열이 아니라면 파일이 들어있다.
			String changeName = saveFile(file, request, si);
			
			if(changeName != null) {
				si.setOriginName(file.getOriginalFilename());
				si.setChangeName(changeName);
			}
		}
		
		signService.insertHelp(si);
		
		String view = "redirect:signView.do";
		
		return view;
	}
	
	@RequestMapping("insertDay.do")
	public String insertDay(@ModelAttribute Sign si , HttpServletRequest request) { //휴가원 insert
		
		System.out.println("controller에 들고 왔는지 체크 : " + si.getVCode());
		
		signService.insertDay(si);
		
		String view = "redirect:signView.do";
		
		return view;
	}
	
	/* 요청대기 함 List */
	@RequestMapping("signWaitingView.do")
	public String readSignWaitingView(@RequestParam(value="currentPage", required = false, defaultValue = "1")
									                int currentPage, Model model, HttpSession session) {
		

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();

		
		int listCount = signService.selectListCount(empName);
		
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Sign> list = signService.selectWaitingList(pi, empName);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "sign/signWaitingView";
		
		
	}


	@ResponseBody
	@RequestMapping(value="selectAAList.do",method=RequestMethod.POST)
	public JSONObject selectAAList (int signNo, HttpSession session) {
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름
		
		System.out.println("signNo 찍어보기 : " + signNo);
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectAAList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("expiryDate", s.getExpiryDate());
		jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("changeName", s.getChangeName());
		
		
		return jsonSign;

	}
	
}
