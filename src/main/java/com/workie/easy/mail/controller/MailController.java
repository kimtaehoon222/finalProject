package com.workie.easy.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.common.CommException;
import com.workie.easy.employee.model.dto.Employee;
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
	public String readMailHome() {
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
		int toReply;
		
		/* 수신-발신 메일 여부에 따라 답장 수신인이 다르다 */
		if(fromMail == mail.getFromMail()) {
			
			/* 발신 메일 : "내가" 해당 메일을 보냈던 사람에게 답장 */
			toReply = mail.getToMail();
		}else {
			
			/* 수신 메일 : "나에게" 해당 메일을 보냈던 사람에게 답장 */
			toReply = mail.getFromMail();
		}
		
		/* 참조인과 제목은 동일 수신-발신 메일 상관없이 동일 */ 
		String ccMail = mail.getCcMail();
		
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
	
	/* 메일 전송 */
	@RequestMapping("insertMail.do")
	public String insertMail(@ModelAttribute Mail mail, HttpServletRequest request, 
							 @RequestParam(name="uploadFile", required=false) MultipartFile file) {

		
		/* 기본 view : 아래에서 예약여부가 Y이면 view 경로 변경 */ 
		String view = "redirect:sendMailList.do";
		
		/* 내용 */
		String changeContent = mail.getContent().replace("\n", "<br>");
		mail.setContent(changeContent);
		
		/* 예약여부 확인 : 예약여부에 따른 stateCode 값 및 view 지정 */
		if(mail.getReserveYn().equals("Y")) {
			mail.setStateCode("EP");
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
		
		/* 해다 요청의 타입을 결정할 dto */
		MailType mailType = new MailType();
		mailType.setReceive(receive);
		mailType.setMailEmpNo(toMail);

		/* 페이징 처리를 위한 받은 메일함 개수 조회 */
		int listCount = mailService.selectMailListCount(mailType);

		int mailLimit = 5;
		MailPageInfo mpi = MailPagination.getPageInfo(listCount, currentPage, mailLimit);
		
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
		
		int mailLimit = 5;
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
		
		int mailLimit = 5;
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
		
		int mailLimit = 5;
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
}
