package com.workie.easy.acct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workie.easy.acct.model.service.CardService;

/*
* <pre>
* Class : CardController
* Comment : client가 보낸 데이터를 가공해서 service을 호출하고 결과를 view에 전달한다.
* History
* 2022/06/24 (전재은) 처음 작성, 카드사용내역조회 추가
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
	private String account() {
		
		return "acct/acct";
		
	}

}
