package com.workie.easy.acct.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.workie.easy.acct.model.dao.CardDao;
import com.workie.easy.acct.model.dto.Card;
import com.workie.easy.common.CommException;
import com.workie.easy.common.model.dto.PageInfo;

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

	@Override
	public int cardStatListCount(String deptCode) {

		return cardDao.cardStatListCount(sqlSession, deptCode);
		
	}

	@Override
	public ArrayList<Card> selectCardStatList(String deptCode, PageInfo pi) {

		return cardDao.selectCardStatList(sqlSession, deptCode, pi);
		
	}

	@Override
	public void insertCardStat(Card c) {
		
		int result = cardDao.insertCardStat(sqlSession, c);
		
		if(result<0) {
			throw new CommException("카드내역 등록에 실패했습니다. 관리자에게 문의 바랍니다.");
		}
		
	}

	@Override
	public Card selectCardStat(int statNo) {

		return cardDao.selectCardStat(sqlSession, statNo);
		
	}
}
