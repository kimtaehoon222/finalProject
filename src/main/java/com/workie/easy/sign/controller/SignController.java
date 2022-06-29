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
	
	/* 결재 함 화면 전환 
	@RequestMapping("signView.do")
	public String readSignView() {
		System.out.println("찍히는지 테스트");
		return "sign/signView";
	}
	*/
	
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
	public JSONObject selectAAList (int signNo, HttpSession session) { //품의 조회 
		
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
		jsonSign.put("firstApprover", s.getFirstApprover());
		jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("changeName", s.getChangeName());
		jsonSign.put("originName", s.getOriginName());
		
		
		
		return jsonSign;

	}
	
	
	@ResponseBody
	@RequestMapping(value="selectBBList.do",method=RequestMethod.POST)
	public JSONObject selectBBList (int signNo, HttpSession session) { //협조 조회
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름
		
		System.out.println("signNo 찍어보기 : " + signNo);
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectBBList(si);

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
		jsonSign.put("originName", s.getOriginName());
		
		
		return jsonSign;

	}
	
	@ResponseBody
	@RequestMapping(value="selectCCList.do",method=RequestMethod.POST)
	public JSONObject selectCCList (int signNo, HttpSession session) { //협조 조회
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름
		
		System.out.println("signNo 찍어보기 : " + signNo);
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectCCList(si);

		/* Json에 담기 */ 
		JSONObject jsonSign = new JSONObject();
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("vCode", s.getVCode());
		jsonSign.put("firstDate", s.getFirstDate());
		jsonSign.put("lastDate", s.getLastDate());
		jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());

		
	
		return jsonSign;

	}

	@RequestMapping("updateR.do")
	public String updateR( String signNo, HttpSession session ) { //요청대기함 -> 반려 

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();
		
		String empJob = ((Employee)session.getAttribute("loginEmp")).getJobName();
		
		String[] array = signNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
				signNo = array[0];
			}
		
		System.out.println(signNo + "잘 짤렸는지 체크");
		
		int sNo = Integer.parseInt(signNo); //detail 번호가 붕 떠있는 상황이며 ajax에서 넘어오기에 string으로 넘어오니 int로 형변환 해준다. 
		
		Sign si = new Sign();
		si.setSignNo(sNo);
		si.setEmpName(empName);
		si.setJobName(empJob);
		
		
		signService.updateR(si);
		
		String view = "redirect:signWaitingView.do";
		
		return view;
	}
	
	
	@RequestMapping("updateP.do")
	public String insertSign(String signNo, HttpSession session ) { // 품의 요청 대기함 -> 결재 진행함

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();
		
		String empJob = ((Employee)session.getAttribute("loginEmp")).getJobName();
		
		String[] array = signNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
				signNo = array[0];
			}
		
		int sNo = Integer.parseInt(signNo);
		
		Sign si = new Sign();
		si.setSignNo(sNo);
		si.setEmpName(empName);
		si.setJobName(empJob);
		
		signService.updateP(si);
		
		String view = "redirect:signView.do";
		
		return view;
		
		
	}

	/* 결재 진행함 List */
	@RequestMapping("signGoView.do")
	public String readSignGoView(@RequestParam(value="currentPage", required = false, defaultValue = "1")
									                int currentPage, Model model, HttpSession session) {
		

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();


		int listCount = signService.selectPListCount(empName);
		
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Sign> list = signService.selectGoList(pi, empName);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "sign/signGoView";
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectAAPList.do",method=RequestMethod.POST)
	public JSONObject selectAAPList (int signNo, HttpSession session) { //'P' 진행 품의 조회  
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름
		
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectAAPList(si);

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
		jsonSign.put("originName", s.getOriginName());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName() );
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		
		return jsonSign;

	}
	
	@ResponseBody
	@RequestMapping(value="selectBBPList.do",method=RequestMethod.POST)
	public JSONObject selectBBPList (int signNo, HttpSession session) { //'P' 진행 협조 조회  
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름

		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectBBPList(si);

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
		jsonSign.put("originName", s.getOriginName());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName() );
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		
		return jsonSign;

	}
	
	@ResponseBody
	@RequestMapping(value="selectCCPList.do",method=RequestMethod.POST)
	public JSONObject selectCCPList (int signNo, HttpSession session) { //'P' 진행 휴가 조회  
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름

		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectCCPList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("vCode", s.getVCode());
		jsonSign.put("firstDate", s.getFirstDate());
		jsonSign.put("lastDate", s.getLastDate());
		jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName() );
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		
		return jsonSign;

	}

	@RequestMapping("updateRR.do")
	public String updateRR( String signNo, HttpSession session ) { //결재대기함 -> 반려 
		
		System.out.println(signNo + "컨트롤러");
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();
		
		String empJob = ((Employee)session.getAttribute("loginEmp")).getJobName();
		
		String[] array = signNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
				signNo = array[0];
			}
		
		System.out.println(signNo + "잘 짤렸는지 체크");
		
		int sNo = Integer.parseInt(signNo); //detail 번호가 붕 떠있는 상황이며 ajax에서 넘어오기에 string으로 넘어오니 int로 형변환 해준다. 
		
		Sign si = new Sign();
		si.setSignNo(sNo);
		si.setEmpName(empName);
		si.setJobName(empJob);
		
		
		signService.updateRR(si);
				
		String view = "redirect:signView.do";
		
		return view;
	}
	
	@RequestMapping("updateA.do")
	public String insertEndSign(String signNo, HttpSession session ) { // 품의 결재 진행함 -> 완료 문서함

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();
		
		String empJob = ((Employee)session.getAttribute("loginEmp")).getJobName();
		
		String[] array = signNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
				signNo = array[0];
			}
		
		int sNo = Integer.parseInt(signNo);
		
		Sign si = new Sign();
		si.setSignNo(sNo);
		si.setEmpName(empName);
		si.setJobName(empJob);
		
		signService.updateA(si);
		
		String view = "redirect:signView.do";
		
		return view;
		
		
	}
	
	/* 반려 문서함 List */
	@RequestMapping("signBackView.do")
	public String readSignBackView(@RequestParam(value="currentPage", required = false, defaultValue = "1")
									                int currentPage, Model model, HttpSession session) {
		

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();


		int listCount = signService.selectRListCount(empName);
		
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Sign> list = signService.selectBackList(pi, empName);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "sign/signBackView";
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectAARList.do",method=RequestMethod.POST)
	public JSONObject selectAARList (int signNo, HttpSession session) { //'R' 반려 품의 조회  
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름
		
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectAARList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();	
		
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("expiryDate", s.getExpiryDate());
		jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("firstApprover", s.getFirstApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("changeName", s.getChangeName());
		jsonSign.put("originName", s.getOriginName());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName());
		jsonSign.put("finalSignDate", s.getFinalSignDate());
		jsonSign.put("finalSignName", s.getFinalSignDate());
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		jsonSign.put("finalSignJob", s.getFinalSignJob());
		jsonSign.put("rejectDate", s.getRejectDate());
		
		return jsonSign;

	}
	
	@ResponseBody
	@RequestMapping(value="selectBBRList.do",method=RequestMethod.POST)
	public JSONObject selectBBRList (int signNo, HttpSession session) { //'R' 반려 협조 조회  
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름
		
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectBBRList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();	
		
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("expiryDate", s.getExpiryDate());
		jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("firstApprover", s.getFirstApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("changeName", s.getChangeName());
		jsonSign.put("originName", s.getOriginName());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName());
		jsonSign.put("finalSignDate", s.getFinalSignDate());
		jsonSign.put("finalSignName", s.getFinalSignDate());
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		jsonSign.put("finalSignJob", s.getFinalSignJob());
		jsonSign.put("rejectDate", s.getRejectDate());
		
		return jsonSign;

	}
	
	@ResponseBody
	@RequestMapping(value="selectCCRList.do",method=RequestMethod.POST)
	public JSONObject selectCCRList (int signNo, HttpSession session) { //'R' 반려 휴가 조회  
		
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName(); //현재 접속한 사용자의 이름

		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setFirstApprover(empName);
		
		/* 서비스 연결  */
		Sign s = signService.selectCCRList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("vCode", s.getVCode());
		jsonSign.put("firstDate", s.getFirstDate());
		jsonSign.put("lastDate", s.getLastDate());
		jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName() );
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		jsonSign.put("firstApprover", s.getFirstApprover());
		jsonSign.put("rejectDate", s.getRejectDate());
		
		return jsonSign;

	}
	
	/* 완료 문서함 List */
	@RequestMapping("signEndView.do")
	public String readSignEndView(@RequestParam(value="currentPage", required = false, defaultValue = "1")
									                int currentPage, Model model, HttpSession session) {
		
			
		String deptCode = ((Employee)session.getAttribute("loginEmp")).getDeptCode();


		int listCount = signService.selectAListCount(deptCode); // view에서 완료문서함 글씨 옆에 ( 기획영업부 ) 이런식으로 부서이름 세션에서 가져와서 뿌려주기 까먹을까봐 적어놓음
		
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Sign> list = signService.selectEndList(pi, deptCode);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);


		return "sign/signEndView";
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectAAAList.do",method=RequestMethod.POST)
	public JSONObject selectAAAList (int signNo, HttpSession session) { //'A' 완료 품의 조회  
		
		String deptCode = ((Employee)session.getAttribute("loginEmp")).getDeptCode(); //현재 접속한 사용자의 이름
		
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setDeptCode(deptCode);
		
		/* 서비스 연결  */
		Sign s = signService.selectAAAList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();	
		
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("expiryDate", s.getExpiryDate());
		//jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("changeName", s.getChangeName());
		jsonSign.put("originName", s.getOriginName());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName());
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		jsonSign.put("finalSignDate", s.getFinalSignDate());
		jsonSign.put("finalSignName", s.getFinalSignName());
		jsonSign.put("finalSignJob", s.getFinalSignJob());
		
		return jsonSign;
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectBBAList.do",method=RequestMethod.POST)
	public JSONObject selectBBAList (int signNo, HttpSession session) { //'A' 완료 협조 조회  
		
		String deptCode = ((Employee)session.getAttribute("loginEmp")).getDeptCode(); //현재 접속한 사용자의 이름
		
		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setDeptCode(deptCode);
		
		/* 서비스 연결  */
		Sign s = signService.selectBBAList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();	
		
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("expiryDate", s.getExpiryDate());
		//jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("changeName", s.getChangeName());
		jsonSign.put("originName", s.getOriginName());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName());
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		jsonSign.put("finalSignDate", s.getFinalSignDate());
		jsonSign.put("finalSignName", s.getFinalSignName());
		jsonSign.put("finalSignJob", s.getFinalSignJob());
		
		return jsonSign;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectCCAList.do",method=RequestMethod.POST)
	public JSONObject selectCCAList (int signNo, HttpSession session) { //'A' 완료 휴가 조회  
		
		String deptCode = ((Employee)session.getAttribute("loginEmp")).getDeptCode(); //현재 접속한 사용자의 이름

		
		/* 파라미터값 set */
		Sign si = new Sign();
		si.setSignNo(signNo); //결재 번호 셋팅
		si.setDeptCode(deptCode);
		
		/* 서비스 연결  */
		Sign s = signService.selectCCAList(si);

		/* Json에 담기 */
		JSONObject jsonSign = new JSONObject();
		jsonSign.put("signNo", s.getSignNo());
		jsonSign.put("createName", s.getCreateName());
		jsonSign.put("createDate", s.getCreateDate());
		jsonSign.put("jobName", s.getJobName());
		jsonSign.put("vCode", s.getVCode());
		jsonSign.put("firstDate", s.getFirstDate());
		jsonSign.put("lastDate", s.getLastDate());
		//jsonSign.put("finalApprover", s.getFinalApprover());
		jsonSign.put("signTitle", s.getSignTitle());
		jsonSign.put("signContent", s.getSignContent());
		jsonSign.put("firstSignDate", s.getFirstSignDate());
		jsonSign.put("firstSignName", s.getFirstSignName() );
		jsonSign.put("firstSignJob", s.getFirstSignJob());
		jsonSign.put("finalSignDate", s.getFinalSignDate());
		jsonSign.put("finalSignName", s.getFinalSignName());
		jsonSign.put("finalSignJob", s.getFinalSignJob());
		
		return jsonSign;

	}
	
	/* 내 결재 대기함 List */
	@RequestMapping("mySignWaitingView.do")
	public String readMySignWaitingView(@RequestParam(value="currentPage", required = false, defaultValue = "1")
									                int currentPage, Model model, HttpSession session) {
		
			
		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();


		int listCount = signService.selectMywListCount(empName); // view에서 완료문서함 글씨 옆에 ( 기획영업부 ) 이런식으로 부서이름 세션에서 가져와서 뿌려주기 까먹을까봐 적어놓음
		
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Sign> list = signService.selectMySignWaitingList(pi, empName);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);


		return "sign/mySignWaitingView";

	}
	
	@RequestMapping("updateAASign.do")
	public String updateAAsign(@ModelAttribute Sign si , HttpServletRequest request ,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file, String signNo) { //내 결재 대기함 품의 수정

		
		String[] array = signNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
				signNo = array[0];
			}
		
		System.out.println("controller signNo :" + signNo);
		
		if(!file.getOriginalFilename().equals("")) { //file이 비어있으면 빈문자열로 넘어옴 빈문자열이 아니라면 파일이 들어있다.
			String changeName = saveFile(file, request, si);
			
			if(changeName != null) {
				si.setOriginName(file.getOriginalFilename());
				si.setChangeName(changeName);
			}
		}
		
		int sNo = Integer.parseInt(signNo);
		
		si.setSignNo(sNo); 
		
		signService.updateAAsign(si);
		
		String view = "redirect:mySignWaitingView.do";
		
		return view;
	}
	
	@RequestMapping("DeleteN.do")
	public String deleteN( String signNo, HttpSession session ) { //내 결재 대기함 -> 삭제

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();
		
		
		String[] array = signNo.split(",");
		
		for(int i=0; i<array.length; i++) {
			System.out.println(array[i]);
				signNo = array[0];
			}
		
		System.out.println(signNo + "잘 짤렸는지 체크");
		
		int sNo = Integer.parseInt(signNo); //detail 번호가 붕 떠있는 상황이며 ajax에서 넘어오기에 string으로 넘어오니 int로 형변환 해준다. 
		
		Sign si = new Sign();
		si.setSignNo(sNo);
		si.setEmpName(empName);
		
		
		signService.DeleteN(si);
		
		String view = "redirect:mySignWaitingView.do";
		
		return view;
	}
	
	
	@RequestMapping("signView.do")
	public String readSignViewW(Model model, HttpSession session) { //결재함 각 메뉴별 조회
		

		String empName = ((Employee)session.getAttribute("loginEmp")).getEmpName();

		
		ArrayList<Sign> listW = signService.selectViewW(empName); //대기
		
		ArrayList<Sign> listP = signService.selectViewP(empName); //진행
		
		ArrayList<Sign> listR = signService.selectViewR(empName); //반려
		
		ArrayList<Sign> listA = signService.selectViewA(empName); //완료
		
		
		
		model.addAttribute("listW", listW); 
		model.addAttribute("listP", listP);
		model.addAttribute("listR", listR);
		model.addAttribute("listA", listA);


		return "sign/signView";
	}
}
