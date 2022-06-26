package com.workie.easy.acct.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.workie.easy.acct.model.dto.Card;
import com.workie.easy.acct.model.service.CardService;
import com.workie.easy.common.CommException;
import com.workie.easy.common.model.Pagination;
import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.employee.model.dto.Employee;

/*
* <pre>
* Class : CardController
* Comment : client가 보낸 데이터를 가공해서 service을 호출하고 결과를 view에 전달한다.
* History
* 2022/06/24 (전재은) 처음 작성, 카드사용내역조회 추가
* 2022/06/25 (전재은) 카드사용내역조회 수정
* 2022/06/26 (전재은) 카드사용내역등록, 파일업로드, 상세조회 추가
* </pre>
* @version 1
* @author 전재은
* @see CardService, CardServiceImpl
*/
@Controller
public class CardController {
	
	@Autowired
	private CardService cardService;
	
	/*회계관리 페이지 전환*/
	/*카드사용내역조회*/
	@RequestMapping("acct.do")
	private String selectCardStatList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage 
									, String deptCode,  Model model, HttpSession session) {
		
//		System.out.println("deptCode 비어있나요?"+deptCode);
		
		if(deptCode == null) {
			deptCode=((Employee)session.getAttribute("loginEmp")).getDeptCode();
		}
		
		/*카드 목록 갯수조회*/
		int cardListCount = cardService.cardStatListCount(deptCode);
		
		/*페이지 정보*/
		PageInfo pi = Pagination.getPageInfo(cardListCount, currentPage, 10, 5);
		
		/*카드목록 조회*/
		ArrayList<Card> cardList = cardService.selectCardStatList(deptCode, pi);
		
		/*세션에 올리기*/
		model.addAttribute("cardList", cardList);
		model.addAttribute("pi", pi);
		
		return "acct/acct";
		
	}

	/*카드사용내역등록*/
	@RequestMapping("insertStat.do")
	private String insertCardStat(Card c , HttpServletRequest request,
								  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		/*출력테스트*/
		System.out.println("empName : "+c.getEmpName());
		System.out.println("empNo : "+c.getEmpNo());
		System.out.println("storeName : "+c.getStoreName());
		System.out.println("paymentStatus : "+c.getPaymentStatus());
		System.out.println("amount : "+c.getAmount());
		System.out.println("transactionDate : "+c.getTransactionDate());
		System.out.println("originName : "+file.getOriginalFilename());
		System.out.println("statMemo : "+c.getStatMemo());
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request, c);
			
			if(changeName != null) {
				c.setOriginName(file.getOriginalFilename());
				c.setChangeName(changeName);
			}
			
		}
		cardService.insertCardStat(c);
		
		return "redirect:acct.do";
		
	}
	
	/*카드사용내역상세조회*/
	@RequestMapping("statDetail.do")
	private JSONObject selectCardStat(int statNo, Model model) {
		
		System.out.println("statNo 테스트 : "+statNo);
		
		//model.addAttribute("c", cardService.selectCardStat(stat_no));
		
		/*서비스연결*/
		Card c = cardService.selectCardStat(statNo);
		
		/*Json에 담기*/
		JSONObject jsonStat = new JSONObject();
		jsonStat.put("statNo", c.getStatNo());
		jsonStat.put("empName", c.getStatNo());
		jsonStat.put("paymentStatus", c.getStatNo());
		jsonStat.put("amount", c.getStatNo());
		jsonStat.put("transactionDate", c.getStatNo());
		jsonStat.put("storeName", c.getStatNo());
		jsonStat.put("statMemo", c.getStatNo());
		jsonStat.put("statNo", c.getStatNo());
		
		return jsonStat;
		
	}
	

	/*첨부파일 설정*/
	private String saveFile(MultipartFile file, HttpServletRequest request, Card c) {
		
		/*경로 설정*/
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savaPath = resources + "\\acct_files\\";
		c.setFilePath(savaPath);
		
		/*이름 설정*/
		String originName = file.getOriginalFilename();	//원본명
		System.out.println("originName : "+originName); //원본명 출력
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());	//저장시간
		String ext = originName.substring(originName.lastIndexOf("."));	//확장자
		String changeName = currentTime+ext;	//수정명

		System.out.println("changeName : "+changeName);	//수정명출력
		
		try {
			file.transferTo(new File(savaPath+changeName)); // 파일 생성해서 업로드 (경로+수정명)
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new CommException("file Upload Error");	//에러가 발생한 경우
		} 
		
		return changeName;
		
	}
}
