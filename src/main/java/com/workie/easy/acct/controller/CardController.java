package com.workie.easy.acct.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.workie.easy.acct.model.dto.Card;
import com.workie.easy.acct.model.dto.CardChart;
import com.workie.easy.acct.model.dto.CardData;
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
* 2022/06/27 (전재은) 상세조회 수정, 내역 수정, 삭제 추가
* 2022/06/28 (전재은) 내역삭제 수정, 내역검색, 카드조회 추가
* 2022/06/28 (전재은) 사용금액 그래프 추가
* 2022/06/29 (전재은) 사용금액 그래프 수정
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
	@RequestMapping("acct.do")
	public String selectCardStatList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage 
									, String deptCode, Model model, HttpSession session) {
		
		
		/*--카드사용내역조회--*/
		/*deptCode삽입*/
		if(deptCode == null) {
			deptCode=((Employee)session.getAttribute("loginEmp")).getDeptCode();
		}
		
		/*카드 목록 갯수조회*/
		int cardListCount = cardService.cardStatListCount(deptCode);
		
		/*페이지 정보*/
		PageInfo pi = Pagination.getPageInfo(cardListCount, currentPage, 10, 5);
		
		/*카드목록 조회*/
		ArrayList<Card> cardList = cardService.selectCardStatList(deptCode, pi);
		
		/*--카드 조회--*/
		Card cardInfo = cardService.selectCardInfo(deptCode);
		
		/*--사용금액, 한도--*/
		CardData cardData = cardService.cardData(deptCode);
		
		String thisMonth = cardData.getThisMonth();
		int aCount = cardData.getACount();
		int cCount = cardData.getCCount();
		int aSum = cardData.getASum();
		int cSum = cardData.getCSum();
		int add = cardData.getAdd();
		int balance = cardData.getBalance();
		int creditLine = cardData.getCreditLine();
		
		System.out.println("thisMonth : " + thisMonth);
		System.out.println("aCount : " + aCount);
		System.out.println("cCount : " + cCount);
		System.out.println("aSum : " + aSum);
		System.out.println("cSum : " + cSum);
		System.out.println("add : " + add);
		System.out.println("balance : " + balance);
		System.out.println("creditLine : " + creditLine);
		
		/*--공통--*/
		/*세션에 올리기*/
		model.addAttribute("cardList", cardList);
		model.addAttribute("pi", pi);
		model.addAttribute("cardInfo", cardInfo);
		model.addAttribute("cardData", cardData);
		
		return "acct/acct";
		
	}

	/*카드사용내역등록*/
	@RequestMapping("insertStat.do")
	public String insertCardStat(Card c , HttpServletRequest request , 
								  @RequestParam(name = "uploadFile" , required = false) MultipartFile file) {
		
		/*출력테스트*/
		System.out.println("empName : "+c.getEmpName());
		System.out.println("empNo : "+c.getEmpNo());
		System.out.println("storeName : "+c.getStoreName());
		System.out.println("paymentStatus : "+c.getPaymentStatus());
		System.out.println("amount : "+c.getAmount());
		System.out.println("transactionDate : "+c.getTransactionDate());
		System.out.println("originName : "+file.getOriginalFilename());
		System.out.println("statMemo : "+c.getStatMemo());
		

//		try {
			if(!file.getOriginalFilename().equals("")) {
				String changeName = saveFile(file, request, c);
				
				if(changeName != null) {
					c.setOriginName(file.getOriginalFilename());
					c.setChangeName(changeName);
				}
				
				cardService.insertCardStat(c);
			}else {
				cardService.insertCardStatOnly(c);
			}
			
//		}catch(NullPointerException e){
//			System.out.println("널포인트");
//		}
		
		return "redirect:acct.do";
		
	}
	
	/*카드사용내역상세조회*/
	@RequestMapping("statDetail.do")
	@ResponseBody
	public JSONObject selectCardStat(int statNo) {
		
		/*서비스연결*/
		Card c = cardService.selectCardStat(statNo);
		
		/*Json에 담기*/
		JSONObject jsonStat = new JSONObject();
		jsonStat.put("statNo", c.getStatNo());
		jsonStat.put("empNo", c.getEmpNo());
		
		jsonStat.put("empName", c.getEmpName());
		jsonStat.put("paymentStatus", c.getPaymentStatus());
		jsonStat.put("amount", c.getAmount());
		jsonStat.put("transactionDate", c.getTransactionDate());
		jsonStat.put("storeName", c.getStoreName());
		jsonStat.put("statMemo", c.getStatMemo());
		
		jsonStat.put("originName", c.getOriginName());
		jsonStat.put("changeName", c.getChangeName());
		
		return jsonStat;
		
	}
	
	/*카드내역 수정*/
	@RequestMapping("updateStat.do")
	public String updateCardStat(Card c , HttpServletRequest request , 
								  @RequestParam(name = "reUploadFile" , required = false) MultipartFile file) {
		
		System.out.println(c.toString());
		
		/*새로운 첨부파일이 있는 경우*/
		if(!file.getOriginalFilename().equals("")) {

			
			String orgChangeName = c.getChangeName();	//기존 첨부파일
			
			try {
				if(!orgChangeName.equals("")) {			/*기존 첨부파일이 있는 경우*/
					
					System.out.println("왜 안되는지 모르겠는중");
					
					/*파일이름 수정*/
					String changeName = saveFile(file, request, c);
					c.setOriginName(file.getOriginalFilename());
					c.setChangeName(changeName);
					
					/*[UPDATE]*/
					cardService.updateCardStat(c, "update");
					
					/*기존 첨부파일 지우기*/
					deleteFile(orgChangeName, request);
					
				}else { 		/*기존 첨부파일이 없는 경우*/
					
				}
			}catch(NullPointerException e){
				System.out.println("기존첨부파일이 없어서 파일 추가하는중2");
				
				/*파일이름 수정*/
				String changeName = saveFile(file, request, c);
				c.setOriginName(file.getOriginalFilename());
				c.setChangeName(changeName);
				
				/*[INSERT]*/
				cardService.updateCardStat(c, "insert");
			}
			
			
			
		}else { /*새로운 첨부파일이 없는 경우*/
			/*기존 첨부파일을 삭제하는 경우*/
			/*기존 첨부파일을 삭제하지 않는 경우*/
		}
		
		return "redirect:acct.do";
		
	}

	/*카드내역 삭제*/
	@RequestMapping("deleteStat.do")
	public String deleteCardStat(int statNo , HttpServletRequest request , 
								@RequestParam(name = "changeName" , required = false)String changeName) {
		
		System.out.println("changeName : "+changeName);
		
		/*내역 삭제*/
		cardService.deleteCardStat(statNo);
		try {
			/*첨부파일 삭제*/
			if(!changeName.equals("")) {
				System.out.println("삭제중...1");
				deleteFile(changeName, request);
			}
		}catch(NullPointerException e) {
			
			System.out.println("삭제중...2");
			deleteFile(changeName, request);
		}
		
		
		return "redirect:acct.do";
		
	}

	/*첨부파일 추가*/
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
	
	/*첨부파일 삭제*/
	private void deleteFile(String changeName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savaPath = resources + "\\acct_files\\";
		
		File deleteFile = new File(savaPath+changeName);
		
		deleteFile.delete();
		
	}

	/*카드내역 검색*/
	@RequestMapping("searchStat.do")
	@ResponseBody
	private JSONArray searchStatList(@RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage ,
									  @RequestParam(value="keyWord", required = false) String keyWord ,
									  @RequestParam(value="empName", required = false) String empName ,
									  @RequestParam(value="amount", defaultValue = "0") int amount ,
									  String startDate , String endDate , HttpSession session
									  ) {
		/*값 확인*/
		System.out.println("currentPage : "+currentPage);
		
		System.out.println("startDate : "+startDate);
		System.out.println("endDate : "+endDate);
		System.out.println("amount : "+amount);
		System.out.println("keyWord : "+keyWord);
		System.out.println("empName : "+empName);
		
		/*부서 설정*/
		String deptCode=((Employee)session.getAttribute("loginEmp")).getDeptCode();
		System.out.println("deptCode : "+deptCode); //부서코드 확인 출력
		
		/*겁색 값 설정*/
		Card c = new Card();
		
		c.setDeptCode(deptCode);	//부서코드
		
		c.setStartDate(startDate);	//검색 시작일
		c.setEndDate(endDate);		//검색 종료일
		c.setAmount(amount);		//가격
		c.setKeyWord("%"+keyWord+"%");		//검색어
		c.setEmpName(empName);		//사용자
		
		/*--페이지 설정--*/
		/*검색 내역 수*/
		int cardListCount = cardService.searchStatCount(c);
		/*페이지 정보*/
		PageInfo pi = Pagination.getPageInfo(cardListCount, currentPage, 10, 5);
		
		/*--검샥 조회--*/
		/*검색 결과 목록*/
		ArrayList<Card> statList = cardService.searchStatList(c, pi);
		
		/*JSONObject, JSONArray*/
		JSONArray jsonArr = new JSONArray();
		
		for(int i=0; i < statList.size(); i++) {
			System.out.println("조회 테스트 ("+i+") : "+statList.get(i).toString());
			
			JSONObject jsonStat = new JSONObject();
		
			jsonStat.put("statNo", statList.get(i).getStatNo()); 					//내역번호
			jsonStat.put("empName", statList.get(i).getEmpName()); 					//사용자
			jsonStat.put("transactionDate", statList.get(i).getTransactionDate()); 	//결제일
			jsonStat.put("amount", statList.get(i).getAmount()); 					//가격
			jsonStat.put("storeName", statList.get(i).getStoreName());				//가맹점
			jsonStat.put("paymentStatus", statList.get(i).getPaymentStatus());		//결제상태
			
			jsonStat.put("pi", pi);											//pi
			
			jsonArr.add(jsonStat); 											// 대괄호 안에 넣어주기[중괄호]
		}
		
		return jsonArr;
	}

	@RequestMapping("cardchart.do")
	@ResponseBody
	public JSONObject cardChart2(HttpServletRequest request, HttpSession session) {
		String deptCode = ((Employee)session.getAttribute("loginEmp")).getDeptCode();
		
		ArrayList<CardChart> chartData = cardService.cardChart(deptCode);
		
		for(CardChart c2 : chartData) {
			String name = c2.getName();
			int amount = c2.getAmount();
			
			System.out.println("name : " + name);
			System.out.println("amount : " + amount);
		}
		
		/*원하는 JSON 형태*/
		/*
		 {
			"cols":[
				{"label":"상태","type":"string"},
				{"label":"금액","type":"number"}
			],
			"rows" :[
				{"c":[{"v":"사용금액"},{"v":35000}]},
				{"c":[{"v":"잔액"},{"v":88000}]}
			]
		}
		*/
		
		/*--반환값--*/
		JSONObject jsonChart = new JSONObject();
		
		/*--컬럼--*/
		
		JSONObject colStatus = new JSONObject();
		JSONObject colBalance = new JSONObject();
		
		colStatus.put("label","상태");
		colStatus.put("type", "string");
		colBalance.put("label", "금액");
		colBalance.put("type", "number");
		
		/*컬럼들(배열)*/
		JSONArray cols = new JSONArray();
		cols.add(colStatus);
		cols.add(colBalance);
		
		/*차트에 컬럼 담기*/
		jsonChart.put("cols", cols);
		
		/*--로우--*/
		JSONArray rows = new JSONArray();
		for(CardChart c2 : chartData) {
			
			/*상태*/
	        JSONObject name = new JSONObject();
	        name.put("v", c2.getName());
	        
	        /*금액*/
	        JSONObject amount = new JSONObject();
	        amount.put("v", c2.getAmount());
	        
	        /*value*/
	        JSONArray row = new JSONArray();
	        row.add(name);
	        row.add(amount);
	        
	        /*key*/
	        JSONObject cell = new JSONObject(); 
	        cell.put("c", row);

	        /*rows 담기*/
	        rows.add(cell);
		}
         
        /*차트에 로우 담기*/
        jsonChart.put("rows", rows);
        
		return jsonChart;
	}
	
}
