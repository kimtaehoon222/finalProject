package com.workie.easy.acct.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.workie.easy.acct.model.dao.CardDao;

/*
* <pre>
* Class : CardServiceImpl
* Comment : controller에서 넘어온 요청을 처리해서 dao로 넘긴다.
* History
* 2022/06/24 (전재은) 처음 작성, 카드사용내역조회 추가
* </pre>
* @version 1
* @author 전재은
* @see CardController, CardService, CardDao
*/
@Controller
public class CardServiceImpl implements CardService {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CardDao cardDao;
}
