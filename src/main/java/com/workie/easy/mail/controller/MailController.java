package com.workie.easy.mail.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.common.CommException;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.mail.model.dto.Department;
import com.workie.easy.mail.model.dto.Mail;
import com.workie.easy.mail.model.dto.MailPageInfo;
import com.workie.easy.mail.model.dto.MailPagination;
import com.workie.easy.mail.model.dto.MailType;
import com.workie.easy.mail.model.service.MailService;

/*
* <pre>
* Class : MailController
* Comment : mail 관련 기능(C,R,U,D)을 처리하기 위해 view에서 데이터를 전달받고, view에게 데이터를 결과를 전달하는 클래스
* 
* History
* 2022/06/13 (김지수) insert 구현
* 2022/06/14~15 (김지수) selectList 구현
* 2022/06/15 (김지수) selectDetail 구현
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see views/mail 하위의 모든 jsp, MailService 인터페이스의 구현체인 MailServiceImpl
*
*/
@Controller
public class MailController {
	
	//생성자 주입방식을 통한 의존성 주입으로 변경하기!
	@Autowired
	private MailService mailService;

	/* 메일 홈 화면 전환 */ 
	@RequestMapping("mailHome.do")
	public String readMailHome(HttpSession session, Model model) {
		
		/* 로그인 회원의 회원번호 */
		int empNo = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		
		/* 읽지 않은 메일 조회 */
		ArrayList<Mail> mailList = mailService.selectMailListNoRead(empNo);
		
		/* 즐겨찾는 사람 조회 : Top 3*/
		ArrayList<Mail> empList = mailService.selectFavoriteEmpList(empNo);
		
		model.addAttribute("mailList", mailList);
		
		return "mail/mailHomeView"; 
	}
	
	/* 메일 작성 양식 화면 전환 */
	@RequestMapping("mailSendForm.do")
	public String insertMailForm() {
		return "mail/mailSendForm"; 
	}
	
	/* 메일 작성 양식(답장용) 화면 전환 */
	@RequestMapping("mailReplyForm.do")
	public String replyMailForm(int mailNo, Model model, HttpSession session) {
		
		/* 로그인 회원의 회원번호 */
		int fromMail = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		
		/* 원본 메일의 정보 */
		Mail mail = mailService.selectDetailMailForReply(mailNo);
		
		/* 원본 메일의 발신인(from)과 수신인(to). "이름" */
		String originFromName = mail.getFromName();
		String originToName = mail.getToName();
				
		/* 원본 메일의 발신인, 답장시 답장받을 수신인(to) "회원번호" */
		String toReply;
		
		/* 수신-발신 메일 여부에 따라 답장 수신인이 다르다 */
		if(fromMail == mail.getFromMail()) {
			
			/* 발신 메일 : "내가" 해당 메일을 보냈던 사람에게 답장 */
			toReply = mail.getToId();
		}else {
			
			/* 수신 메일 : "나에게" 해당 메일을 보냈던 사람에게 답장 */
			toReply = mail.getFromId();
		}
		
		/* 참조인과 제목은 동일 수신-발신 메일 상관없이 동일 */ 
		String ccMailList = mail.getCcMail();
		
		String ccMail = null;
		if(ccMailList != null) {
			ccMail = selectEmpId(ccMailList);
		}
		
		String originTitle = "[RE:]" + mail.getTitle();
		String originContent = "\n\n\n-----원본메일----\n" 
							+ "| 보낸사람 : " + originFromName + "<" + mail.getFromId() + ">" + "\n"
							+ "| 받는사람 : " + originToName + "<" + mail.getToId() + ">" + "\n"
							+ "| 날짜 : "	+ mail.getSendDate() + "\n"
							+ "| 제목 : "	+ mail.getTitle() + "\n"
							+ mail.getContent().replace("<br>", "\n");
							
		model.addAttribute("toReply", toReply);
		model.addAttribute("ccMail", ccMail);
		model.addAttribute("originTitle", originTitle);
		model.addAttribute("originContent", originContent);
		
		/* 작성하기 화면으로 전환하면서 model에 담겨있는 데이터까지 보내준다. */
		return "mail/mailSendForm"; 
	}
	
	/* 메일 작성 양식(전달용) 화면 전환 */
	@RequestMapping("mailForwardForm.do")
	public String forwardMailForm(int mailNo, Model model, HttpSession session) {
		
		/* 원본 메일의 정보 */
		Mail mail = mailService.selectDetailMailForReply(mailNo);
		
		/* 원본 메일의 발신인(from)과 수신인(to). "이름" */
		String originFromName = mail.getFromName();
		String originToName = mail.getToName();
		
		String originTitle = "[FW:]" + mail.getTitle();
		String originContent = "\n\n\n-----원본메일----\n" 
							+ "| 보낸사람 : " + originFromName + "<" + mail.getFromId() + ">" + "\n"
							+ "| 받는사람 : " + originToName + "<" + mail.getToId() + ">" + "\n"
							+ "| 날짜 : "	+ mail.getSendDate() + "\n"
							+ "| 제목 : "	+ mail.getTitle() + "\n"
							+ mail.getContent().replace("<br>", "\n");
		
		model.addAttribute("originTitle", originTitle);
		model.addAttribute("originContent", originContent);
		
		/* 작성하기 화면으로 전환하면서 model에 담겨있는 데이터까지 보내준다. */
		return "mail/mailSendForm"; 
	}
	
	/* empId를 조회해오는 메소드 : 참조인 */
	private String selectEmpId(String mailEmpNoList) {
		
		/* 번호를 골뱅이(,) 기준으로 자른 후 배열에 담는다. */ 
		/* 1,2,3 => [1,2,3] */
		String[] strArr = mailEmpNoList.split(","); 
		
		/* 위의 번호를 기준으로 Id를 받아올 배열 생성 */ 
		String[] newStrArr = new String[strArr.length];
		
		for(int i=0; i<strArr.length; i++) {
			
			String empId = mailService.selectEmpId(Integer.parseInt(strArr[i]));
			newStrArr[i] = empId + "@easy.co.kr";
		}
		
		/* 위의 새 배열에 담긴 요소들을 콤마(,)로 연결한다. */
		String empIdList = "";
		for(int i=0; i<newStrArr.length; i++) {
				
			if(i != newStrArr.length-1) {
				empIdList += newStrArr[i] + ",";
			}else {
				empIdList += newStrArr[i];
			}
			
		}
		
		return empIdList;
	}
	
	/* 메일 전송 */
	@RequestMapping("insertMail.do")
	public String insertMail(@ModelAttribute Mail mail, HttpServletRequest request, 
							 @RequestParam(name="uploadFile", required=false) MultipartFile file,
							 String toMailEmpId, String ccMailEmpId) {

		/* 파라미터로 넘어온 아이디 기준으로 수신인의 회원번호를 추출하여 set 해준다. */
		int toMail = selectEmpNo(toMailEmpId);
		mail.setToMail(toMail);
		
		/* 파라미터로 넘어온 아이디들을 수신인의 회원번호로 추출한 문자열을 반환받아 set 해준다. */
		
		if(ccMailEmpId.length() > 0) {
			
			String empIdCcList = selectEmpNoList(ccMailEmpId);
			mail.setCcMail(empIdCcList);
		}
		
		/* 기본 view : 아래에서 예약여부가 Y이면 view 경로 변경 */ 
		String view = "redirect:sendMailList.do";
		
		/* 내용 */
		String changeContent = mail.getContent().replace("\n", "<br>");
		mail.setContent(changeContent);
		
		/* 예약여부 확인 : 예약여부에 따른 stateCode 값 및 view 지정 */
		if(mail.getReserveYn().equals("Y")) {
			mail.setStateCode("EP");
			mail.setSendDate(mail.getSendDate()+"09:00:00");
			view = "redirect:reserveMailList.do";
		}else {
			mail.setStateCode("FN");
		}
		
		/* 파일 첨부여부 확인 */
		if(!file.getOriginalFilename().equals("")) {
			
			/* request 객체에서 session을 얻어 파일 저장 경로 설정시 사용 */
			String changeName = saveFile(file, request, mail); 
			
			if(changeName != null) {
				mail.setOriginName(file.getOriginalFilename());
				mail.setChangeName(changeName);
			}
		}
		
		mailService.insertMail(mail);
		
		return view; 
	}
	
	/* empNo를 조회해오는 메소드 : 수신인 */
	private int selectEmpNo(String mailEmpId) {
		
		/* 아이디를 골뱅이(@) 기준으로 자른다. 
		 * ex. kjs@easy.co.kr 이면 index 0번째에는 kjs가 들어가고 
		 *     1번째에는 easy.co.kr가 들어가게 된다. */
		String[] strArr = mailEmpId.split("@"); 
		
		/* 위의 배열에 담긴 0번째 인덱스를 기준으로 회원번호를 조회해온다. */
		return mailService.selectEmpNo(strArr[0]);
	}
	
	/* empNo를 조회해오는 메소드  : 참조인 */
	private String selectEmpNoList(String mailEmpIdList) {
		
		/* 여러개의 이메일을 콤마(,) 기준으로 배열에 담는다. */
		String[] strArr = mailEmpIdList.split(","); 
		
		/* 여러개의 참조인의 회원번호를 담을 배열 생성 */
		int[] newStrArr = new int[strArr.length];
		
		/* 배열에 담긴 각 요소(ex.kjs@easy.co.kr)에서 골뱅이 뒤 메일주소(easy.co.kr)를 제거해준다. */
		for(int i=0; i<strArr.length; i++) {
			
			/* empId만 추출된 문자열을 새 배열에 담는다. */	
			String mailEmpId = (String) strArr[i].subSequence(0, strArr[i].indexOf("@"));
			newStrArr[i] = mailService.selectEmpNo(mailEmpId);
		}
		
		/* 위의 새 배열에 담긴 요소들을 콤마(,)로 연결한다. */
		String empIdList = "";
		for(int i=0; i<newStrArr.length; i++) {
				
			if(i != newStrArr.length-1) {
				empIdList += newStrArr[i] + ",";
			}else {
				empIdList += newStrArr[i];
			}
			
		}
		
		return empIdList;
	}
	
	/* 파일을 업로드(저장) 하고, 수정된 파일명을 반환 */
	private String saveFile(MultipartFile file, HttpServletRequest request, Mail mail) {

		System.out.println("확인 : " + request.getSession().getServletContext()); 
		System.out.println("확인 : " + request.getSession().getServletContext().getRealPath("resources"));
		
		/* resources 폴더까지의 경로 추출 */
		String resources = request.getSession().getServletContext().getRealPath("resources");
		
		/* 파일을 저장할 최종(마지막 하위) 폴더 경로 설정(위에서 얻은 resources까지의 경로에 최하위 폴더명 연결) */
		String savePath = resources + "\\mail_files\\";
		
		mail.setFilePath(savePath);
		
		String originName = file.getOriginalFilename(); 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
		
		/* 첨부된 파일의 확장자 추출 */
		String ext = originName.substring(originName.lastIndexOf(".")); 
		
		String changeName = currentTime + ext;
		System.out.println("changeName : " + changeName); 
		
		try {
			
			/* 저장경로와 변경된 파일명을 연결한 문자열 pathname으로 File 객체를 생성하고, 생성된 그 객체를 업로드하기 위한 메소드 */
			file.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) { 
			e.printStackTrace();
			throw new CommException("파일 업로드에 실패 하였습니다.관리자에게 문의 바랍니다.");
		}
		
		return changeName; 
	}
	
	/* 받은 메일함 조회*/ 
	@RequestMapping("receiveMailList.do")
	public String selectReceiveMailList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, 
										@RequestParam(value="receive", defaultValue="r") String receive, Model model, HttpSession session) {

		/* 쿼리에서 받는사람 기준이 될 변수 */
		int toMail = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		
		/* 해당 요청의 타입을 결정할 dto */
		MailType mailType = new MailType();
		mailType.setReceive(receive);
		mailType.setMailEmpNo(toMail);

		/* 페이징 처리를 위한 받은 메일함 개수 조회 */
		int listCount = mailService.selectMailListCount(mailType);

		int mailLimit = 10;
		MailPageInfo mpi = MailPagination.getPageInfo(listCount, currentPage, mailLimit);
		
		/* 나에게 들어온 예약메일 중 예약상태를 처리해야 할 메일이 있는지 조회 => 갯수 조회에서 갯수가 0 이상이면 true 넘어올 것. */
		boolean reserveMailList = mailService.checkReserveMail(toMail);
		
		/* 처리해야 할 메일이 있는 경우 (true) */
		if(reserveMailList) {
			
			/* 예약 메일 update => 발송처리상태를 발송예정에서 발송완료로 변경 해야한다. */
			mailService.updateReserveMail(toMail);
		}
		
		/* 화면에 뿌려줄 리스트 조회 */
		ArrayList<Mail> list = mailService.selectReceiveMailList(toMail, mpi); 
		
		model.addAttribute("mpi", mpi);
		model.addAttribute("list", list);
		
		return "mail/mailReceiveListView";
	}
	
	/* 보낸 메일함 조회*/ 
	@RequestMapping("sendMailList.do")
	public String selectSendMailList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, 
									 @RequestParam(value="send", defaultValue="s") String send, Model model, HttpSession session) {
		
		/* 쿼리에서 보낸사람 기준이 될 변수 */
		int fromMail = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		
		MailType mailType = new MailType();
		mailType.setSend(send);
		mailType.setMailEmpNo(fromMail);
		
		int listCount = mailService.selectMailListCount(mailType);
		
		int mailLimit = 10;
		MailPageInfo mpi = MailPagination.getPageInfo(listCount, currentPage, mailLimit);

		/* 화면에 뿌려줄 리스트 조회 */
		ArrayList<Mail> list = mailService.selectSendMailList(fromMail, mpi); 
		
		model.addAttribute("mpi", mpi);
		model.addAttribute("list", list);
		
		return "mail/mailSendListView"; 
	}

	/* 예약 메일함 조회*/
	@RequestMapping("reserveMailList.do")
	public String selectReserveMailList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, 
			 							@RequestParam(value="reserve", defaultValue="re") String reserve, Model model, HttpSession session) {
		
		int fromMail = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		
		MailType mailType = new MailType();
		mailType.setReserve(reserve);
		mailType.setMailEmpNo(fromMail);
		
		int listCount = mailService.selectMailListCount(mailType);
		
		int mailLimit = 10;
		MailPageInfo mpi = MailPagination.getPageInfo(listCount, currentPage, mailLimit);

		ArrayList<Mail> list = mailService.selectReserveMailList(fromMail, mpi); 
		
		model.addAttribute("mpi", mpi);
		model.addAttribute("list", list);
		
		return "mail/mailReserveListView"; 
	}

	/* 삭제 메일함(휴지통) 조회*/
	@RequestMapping("deleteMailList.do")
	public String selectDeleteMailList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, 
									   @RequestParam(value="delete", defaultValue="d") String delete, Model model, HttpSession session) {
		
		int toFromMail = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		
		MailType mailType = new MailType();
		mailType.setDelete(delete);
		mailType.setMailEmpNo(toFromMail);
		
		int listCount = mailService.selectMailListCount(mailType);
		
		int mailLimit = 10;
		MailPageInfo mpi = MailPagination.getPageInfo(listCount, currentPage, mailLimit);

		ArrayList<Mail> list = mailService.selectDeleteMailList(toFromMail, mpi); 
		
		model.addAttribute("mpi", mpi);
		model.addAttribute("list", list);
		
		return "mail/mailDeleteListView"; 
	}
	
	/* 메일 상세 조회 : 받은, 보낸, 예약 */
	@RequestMapping("detailMail.do")
	public ModelAndView selectDetailMail(int mailNo, ModelAndView mv, HttpSession session) {
		
		int loginEmpNo = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		int toMail = selectToMail(mailNo);
		
		Mail mail = mailService.selectDetailMail(mailNo, loginEmpNo, toMail);

		/* 참조인 list 조회 */
		ArrayList<Mail> ccList = mailService.selectCcMembers(mail.getCcMail()); 
		
		if(!ccList.isEmpty()) {
			
			/* 참조인 list가 있는 경우 */ 
			mv.addObject("mail", mail).addObject("ccList", ccList);
		}else {
		
			/* 참조인 list가 없는 경우 */ 
			mv.addObject("mail", mail);
		}
		
		mv.setViewName("mail/mailDetailView");
		
		return mv; 
	}
	
	/* 내부 메소드 : 받는사람조회 */
	private int selectToMail(int mailNo) {
		
		int toMail = 0;
		toMail = mailService.selectToMail(mailNo);
				
		return toMail; 
	}
	
	/* 메일 상세 조회 : 휴지통 */
	@RequestMapping("detailDeleteMail.do")
	public ModelAndView selectDetailDeleteMail(int mailNo, ModelAndView mv, HttpSession session) {
		
		int loginEmpNo = ((Employee)session.getAttribute("loginEmp")).getEmpNo();
		int toMail = selectToMail(mailNo);
		
		Mail mail = mailService.selectDetailDeleteMail(mailNo, loginEmpNo, toMail);

		/* 참조인 list 조회 */
		ArrayList<Mail> ccList = mailService.selectCcMembers(mail.getCcMail()); 

		if(!ccList.isEmpty()) {
			
			/* 참조인 list가 있는 경우 */ 
			mv.addObject("mail", mail).addObject("ccList", ccList);
		}else {
			
			/* 참조인 list가 없는 경우 */ 
			mv.addObject("mail", mail);
		}
		
		mv.setViewName("mail/mailDetailView");
		
		return mv; 
	}
	
	/* 메일 발송 취소  : 예약 메일에서만 가능 */
	@RequestMapping(value="cancelMail.do", method=RequestMethod.POST) 
	public String cancelMail(String mailNoList) {
		
		/* 파라미터로 전달받은 mailNo를 구분자로 분리하여 배열에 담는다. */
		String[] mailNoArr = mailNoList.split(",");
		
		/* 방법을 모르겠어서 반복문으로 처리 */
		for(String mailNo : mailNoArr) {
			
			/* 배열에 문자열로 담겨있으므로 int로 형 변환 : 조건절의 MAIL_NO가 NUMBER 타입이다. */
			mailService.cancelMail(Integer.parseInt(mailNo));
		}
		
		return "redirect:reserveMailList.do"; 
	}
	
	/* 메일 삭제  : 보낸, 받은, 예약 메일 리스트에서 호출 */
	@RequestMapping(value="deleteMailList.do", method=RequestMethod.POST) 
	public String deleteMailList(String mailNoList, String listType) {
		
		String view = "";

		if(listType.equals("r")) { /* 받은 메일에서 요청 */
			view = "redirect:receiveMailList.do";
		}else if(listType.equals("re")) { /* 예약 메일에서 요청 */
			view = "redirect:reserveMailList.do";
		}else{ /* 보낸 메일에서 요청 */
			view = "redirect:sendMailList.do";
		}
		
		String[] mailNoArr = mailNoList.split(",");
		
		/* 호출하는 deleteMail 메소드는 상세조회에서의 삭제와 공통이다. 즉, service 계층부터 동일하다. */
		for(String mailNo : mailNoArr) {
			mailService.deleteMail(Integer.parseInt(mailNo));
		}
		
		return view; 
	}
	
	/* 메일 복원  : 휴지통 리스트에서 호출 */
	@RequestMapping(value="restoreMail.do", method=RequestMethod.POST) 
	public String restoreMail(String mailNoList) {
		
		String[] mailNoArr = mailNoList.split(",");
		
		for(String mailNo : mailNoArr) {
			mailService.restoreMail(Integer.parseInt(mailNo));
		}
		
		return "redirect:deleteMailList.do"; 
	}
	
	/* 메일 완전삭제  : 휴지통 리스트에서 호출 */
	@RequestMapping(value="permanentDeleteMailList.do", method=RequestMethod.POST) 
	public String permanentDeleteMailList(String mailNoList) {
		
		String[] mailNoArr = mailNoList.split(",");
		
		/* 호출하는 permanentDeleteMail 메소드는 상세조회에서의 완전삭제와 공통이다. 즉, service 계층부터 동일하다. */
		for(String mailNo : mailNoArr) {
			mailService.permanentDeleteMail(Integer.parseInt(mailNo));
		}
		
		return "redirect:deleteMailList.do"; 
	}
	
	/* 메일 삭제  : 상세조회에서만 호출 */
	@RequestMapping("deleteMail.do") 
	public String deleteMail(int mailNo) {
		
		mailService.deleteMail(mailNo);
		
		return "redirect:deleteMailList.do"; 
	}
	
	/* 메일 완전삭제 : 휴지통 상세에서만 호출 */
	@RequestMapping("permanentDeleteMail.do") 
	public String permanentDeleteMailOne(int mailNo) {
		
		mailService.permanentDeleteMail(mailNo);
		
		return "redirect:deleteMailList.do"; 
	}
	
	
	/* 부서 조회 : 주소록에서 호출 */
	@ResponseBody
	@RequestMapping(value="deptList.do", method=RequestMethod.POST) 
	public JSONArray seletDeptList() {
		
		/* 부서의 정보를 담을 list */
		ArrayList<Department> list = mailService.seletDeptList();
		
		/* JSON 배열로 반환하기 위한 배열 */
		JSONArray deptList = new JSONArray();
		
		/* JSON 배열에 담을 JSOn 객체  "선언" -> 생성은 반복문 안에서 한다. */
		JSONObject jsonObject = null;
		
		for(Department dept : list) {
			
			/* JSON 객체 생성 */
			jsonObject = new JSONObject();
			
			/* 생성된 JSON 객체에 list의 자바 데이터 를 put 해준다. */
			jsonObject.put("deptCode", dept.getDeptCode());
			jsonObject.put("deptName", dept.getDeptName());
			jsonObject.put("deptPwd", dept.getDeptPwd());
			
			/* 데이터가 담긴 JSON 객체를 JSON배열에 추가해준다. */
			deptList.add(jsonObject);
		}
		
		return deptList; 
	}
	
	/* 직원 조회 : 주소록에서 호출 */
	@ResponseBody
	@RequestMapping(value="employeeList.do", method=RequestMethod.POST) 
	public JSONArray seletEmployeeList(@RequestParam String selectDept) {
		
		System.out.println("직원 조회 컨트롤러 도착");
		
		/* 직원의 정보를 담을 list */
		ArrayList<Employee> list = mailService.seletEmployeeList(selectDept);
		
		/* JSON 배열로 반환하기 위한 배열 */
		JSONArray empList = new JSONArray();
		
		/* JSON 배열에 담을 JSOn 객체  "선언" -> 생성은 반복문 안에서 한다. */
		JSONObject jsonObject = null;
		
		if(!list.isEmpty()) {
			for(Employee emp : list) {
				
				/* JSON 객체 생성 */
				jsonObject = new JSONObject();
				
				/* 생성된 JSON 객체에 list의 자바 데이터 를 put 해준다. */
				jsonObject.put("empName", emp.getEmpName());
				jsonObject.put("empId", emp.getEmpId()+"@easy.co.kr");
				
				/* 데이터가 담긴 JSON 객체를 JSON배열에 추가해준다. */
				empList.add(jsonObject);
			}
		}
		
		return empList; 
	}
	
	
	
}
