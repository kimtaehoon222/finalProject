package com.workie.easy.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.workie.easy.common.CommException;
import com.workie.easy.common.model.dto.Attachment;
import com.workie.easy.mail.model.dto.Mail;
import com.workie.easy.mail.model.service.MailService;

/*
* <pre>
* Class : MailController
* Comment : mail 관련 기능(C,R,U,D)을 처리하기 위해 view에서 데이터를 전달받고, view에게 데이터를 결과를 전달하는 클래스
* 
* History
* 2022/06/13 (김지수) insert 구현
* 2022/06/
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
	
	/* 메일 전송 */
	@RequestMapping("insertMail.do")
	public String insertMail(@ModelAttribute Mail mail, HttpServletRequest request, 
							 @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		System.out.println("컨트롤러 mail 확인" + mail);
		
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
		
		return "mail/mailSendListView"; 
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
			throw new CommException("file Upload Error");
		}
		
		return changeName; 
	}
	
	@RequestMapping("receiveMailList.do")
	public String selectReceiveMailList() {
		return "mail/mailReceiveListView";
	}
	
	@RequestMapping("sendMailList.do")
	public String selectSendMailList() {
		return "mail/mailSendListView"; 
	}

	@RequestMapping("reserveMailList.do")
	public String selectReserveMailList() {
		return "mail/mailReserveListView"; 
	}

	@RequestMapping("deleteMailList.do")
	public String selectDeleteMailList() {
		return "mail/mailDeleteListView"; 
	}
	
	
	
}
