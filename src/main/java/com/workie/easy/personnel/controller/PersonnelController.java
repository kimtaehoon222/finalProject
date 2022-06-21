package com.workie.easy.personnel.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.common.CommException;
import com.workie.easy.common.model.dto.Attachment;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.personnel.model.service.PersonnelService;

@Controller
public class PersonnelController {
	
	@Autowired // 의존성 주입
	private PersonnelService personnelService;
	
	@Autowired//빈으로 등록했으니까 의존성 주입
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("myPage.do")//마이페이지로 화면 전환용
	public String myPage() {
        return "personnel/myPageView";
	  }
	
	@RequestMapping("updateEmp.do")//마이페이지 수정 페이지
	public String updateEmp(@ModelAttribute Employee e,
			                Model model) {
		
		Employee empInfo = personnelService.updateEmp(e);
        
		model.addAttribute("loginEmp", empInfo);
		
		 return "personnel/myPageView";//수정후 다시 마이페이지로
	}
	
	 @RequestMapping(value="updatePwd.do",method=RequestMethod.POST)//비번 수정 페이지
	 public String updatePwd(HttpSession session,
			  				 @RequestParam("originPwd") String originPwd,
			                 @RequestParam("updatePwd") String updatePwd, 
			                 Model model) {
		    
		    Employee e = (Employee) session.getAttribute("loginEmp");
		    Employee emp = personnelService.updatePwd(bCryptPasswordEncoder,e,originPwd,updatePwd);
			
			model.addAttribute("loginEmp", emp);
		    return "personnel/myPageView";
		  	 }
	
	 @RequestMapping("empList.do")//재직중인 직원 목록
	 public String selectEmpList(Model model) {
		
		ArrayList<Employee> list = personnelService.selectEmpList();
		
		model.addAttribute("list", list);
		return "personnel/empListView";		
	}
	 
	 @RequestMapping("detailEmp.do") 
     public ModelAndView selectEmp(String eId , ModelAndView mv) {
		 
		 Employee e = personnelService.selectEmp(eId);
		 
		 String reg = e.getEmpReg().substring(0, 6);
		 e.setEmpReg(reg);
		 mv.addObject("e",e).setViewName("personnel/empDetailView");

		 return mv;	
	 }

	   @RequestMapping("updateEmpform.do")//화면전환용
	   public ModelAndView updateForm(String eId , ModelAndView mv) {
		   
		
		   mv.addObject("e", personnelService.selectEmp(eId))
		   .setViewName("personnel/empUpdateForm");
		   
		   return mv;
	   }
	 @RequestMapping("updateEmpInfo.do")
	 public ModelAndView updateEmpInfo(Employee emp, ModelAndView mv, HttpServletRequest request,
			                           @RequestParam (name = "reUploadFile", required = false) 
	                                   MultipartFile file) { 
		 
		    Attachment at = new Attachment();
		    at.setRefNo(emp.getEmpNo());
		    String orgChangeName = at.getChangeName();
		   //기존첨부파일을 orgChangeName변수에 담아주고
		   
		   if(!file.getOriginalFilename().equals("")) {
			   //reUploadFile에 파일이 있으면 원본파일명 
			   
		      String changeName = saveFile(file, request, at);
			   //경로와 바뀐첨부파일명
			  at.setOriginName(file.getOriginalFilename());
			  at.setChangeName(changeName);
		   }
		   System.out.println("직원 수정ㅂㅈㄷㅂㅈㄷㅂㅈㄷ" + emp);
		   System.out.println("직원 수정ㅂㅈㄷㅂㅈㄷㅂㅈㄷ" + at);
		   personnelService.updateEmpInfo(emp,at);
		   System.out.println("직원 수정ㅂㅈㄷㅂㅈㄷㅂㅈㄷ" + emp);
		   if(orgChangeName != null) {
			   deleteFile(orgChangeName, request);
			   //기존에 첨부파일이 있으면  deleteFile메소드로 삭제
		   }
		   mv.addObject("eId", emp.getEmpId()).setViewName("redirect:detailEmp.do");
		   return mv;
		 
	 }
	 
	 private void deleteFile(String orgChangeName, HttpServletRequest request) {
		 String resources = request.getSession().getServletContext().getRealPath("resources");
	      //getRealPath로 웹컨테이너 안에 있는 리소스 경로 가져오기
	      String savePath = resources + "\\emp_files\\";            
	      //webapp -> resources + upload_files 파일
	      
	      File deleteFile = new File(savePath + orgChangeName);
	      
	      deleteFile.delete();
	}
	//전달 받은 파일을 업로드 시키고, 수정된 파일명을 리턴하는 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request,Attachment at) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		//resources 폴더까지의 경로 추출 
		
		String savePath = resources + "\\emp_files\\";            
	      /* "\\upload_files\\" \ 인식을 위한 \하위폴더로 가주게 하는
		 webapp -> resources + upload_files 파일*/
		  
		  at.setFilePath(savePath);
	      String originName = file.getOriginalFilename();
	      //date 포맷
	      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	      //SimpleDateFormat 파일명을 년월일시분초로 바꿔주고
	      //SimpleDateFormat 형식지정
	      //확장자(jpg,png)
	      String ext = originName.substring(originName.lastIndexOf("."));
	      //substring() 메소드는 string 객체의 시작 인덱스로 부터 종료 인덱스 전 까지 문자열의 부분 문자열을 반환합니다.
	      /*originName.substring(originName.lastIndexOf(".")); 
	       * 마지막 글자를 시작으로 제일 먼저 .이 있는 부분까지 잘라준다 즉 .jsp를 잘라준다, 확장자를 가져온*/
	      
	      //파일 이름 변경 날짜시간 + 확장자 
	      String changeName = currentTime + ext;
	      System.out.println("changeName : " + changeName);
	   
	      try {
	         //해당하는 경로에 파일명이 생김
	         file.transferTo(new File(savePath+changeName));
	         //MultipartFile에서 transferTo는 업로드한 파일 데이터를 지정한 파일에 저장해주는 메소드
	      } catch (IllegalStateException | IOException e) {
	         e.printStackTrace();
	         throw new CommException("사진 업로드에 실패하였습니다. 관리자에게 문의 바랍니다.");
	      }
	      
	      return changeName;
	   }
	

	@RequestMapping("retiredEmp.do")
	 public String deleteEmp(String eId) {
		 
		 personnelService.deleteEmp(eId);
		 
		 return "redirect:empList.do";
	 }
	
	@RequestMapping("retiredEmpList.do") 
	public String selectRetiredEmpList(Model model) {
        ArrayList<Employee> list = personnelService.selectRetiredEmpList();
		
		model.addAttribute("list", list);
		return "personnel/retiredEmpListView";	
	}
	 @RequestMapping("detailRetiredEmp.do") 
     public ModelAndView selectRetiredEmp(String eId , ModelAndView mv) {
		 
		 Employee e = personnelService.selectRetiredEmp(eId);
		 
		 String reg = e.getEmpReg().substring(0, 6);
		 e.setEmpReg(reg);
		 mv.addObject("e",e).setViewName("personnel/retiredEmpDetailView");

		 return mv;	
	 }
	 @RequestMapping("returnEmp.do")
	   public String updateReturnEmp(String eId ,Model model) {
		   //String eId jsp에서 히든값 emp_id로 받아온 거
		 
		 Employee e = personnelService.updateReturnEmp(eId);  
		 
		 model.addAttribute("e", e);
		    
		 return "personnel/empUpdateForm";
		  
	   }
	 
	 @RequestMapping("noApvList.do")
	 public String selectApvList(Model model) {
		
		 ArrayList<Employee> list = personnelService.selectApvList();
			
			model.addAttribute("list", list);
			return "personnel/noApvListView";		
	 }
	 @RequestMapping("insertEmpForm.do")
	 public ModelAndView updateNoApvEmpForm(String eId , ModelAndView mv ) {
		  
		 Employee e = personnelService.selectEmp(eId);  
		 
		 
		 mv.addObject("e", e).setViewName("personnel/empInsertView");
		  
		 return mv;
	 }
	 @RequestMapping("insertUpdateEmp.do")
	 public String insertEmp(Employee e, HttpServletRequest request, 
			                 @RequestParam(name="uploadFile", required = false)MultipartFile file) {
    
		 Attachment at = new Attachment();
		 at.setRefNo(e.getEmpNo());
		 System.out.println("미승인 직원" + at);
		 if(!file.getOriginalFilename().equals("")) {
				String changeName = saveFile(file , request, at);
				//saveFile 메소드를 만들어서 폴더를 지정해주고 수정된 파일명 리턴
				///saveFile(file의 오리지날네임 , request)
				//인설트랑 업데이트 둘다 쓰니까 메소드를 하나 만들어서 사용
				
				
				if(changeName != null) {
					at.setOriginName(file.getOriginalFilename());
					at.setChangeName(changeName);
					//받아온 changeName 담아주기
				}
			}
		    personnelService.insertEmp(e, at);
			return "redirect:empList.do";//재직자 리스트로
	 }
	   
}
