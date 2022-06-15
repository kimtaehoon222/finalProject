package com.workie.easy.personnel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.workie.easy.common.CommException;
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
	 public String updatePwd(@RequestParam("originPwd") String originPwd,
			                 @RequestParam("updatePwd") String updatePwd, 
			                 HttpSession session, Model model) {
		  
		 Employee e = (Employee)session.getAttribute("loginEmp");
		 	System.out.println("jaehojaeho"+ e);
		    //e.getEmpPwd(): db에 저장되어있는 현재 암호화된 비밀번호  originPwd : 입력한 비밀번호 
			if(!bCryptPasswordEncoder.matches(originPwd, e.getEmpPwd())) {
				//일치하지 않는 경우 
				throw new CommException("비밀번호가 불일치 했습니다.");
			}
			
			//originPwd 와 m.getUserPwd()가 일치한다면(위의 if문 pass시)
			//새로운 비밀번호(updatePwd)를 암호화해준다. 
			String updateEncPwd = bCryptPasswordEncoder.encode(updatePwd);
		    
			e.setEmpPwd(updateEncPwd);
			
			Employee emp = personnelService.updatePwd(e);
			
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
     public ModelAndView selectEmp(int eId , ModelAndView mv) {
		
		 Employee e = personnelService.selectEmp(eId);
		 System.out.println("직원 상세 페이지 값"+ e);
		 mv.addObject("e",e).setViewName("personnel/empDetailView");

		 return mv;	
	 }
}
