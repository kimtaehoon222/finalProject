package com.workie.easy.acct.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.workie.easy.acct.model.dao.CardDao;
import com.workie.easy.acct.model.dto.Card;
import com.workie.easy.acct.model.dto.CardChart;
import com.workie.easy.acct.model.dto.CardData;
import com.workie.easy.common.CommException;
import com.workie.easy.common.model.dto.PageInfo;

/*
* <pre>
* Class : CardServiceImpl
* Comment : controller에서 넘어온 요청을 처리해서 dao로 넘긴다.
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
		
		if(result < 0) {
			throw new CommException("카드내역 등록에 실패했습니다. 관리자에게 문의 바랍니다.");
		}
		
	}
	
	@Override
	public void insertCardStatOnly(Card c) {
		
		int result = cardDao.insertCardStatOnly(sqlSession, c);
		
		if(result < 0) {
			throw new CommException("카드내역 등록에 실패했습니다. 관리자에게 문의 바랍니다.");
		}
		
	}

	@Override
	public Card selectCardStat(int statNo) {

		return cardDao.selectCardStat(sqlSession, statNo);
		
	}

	@Override
	public void updateCardStat(Card c, String string) {

		int result = cardDao.updateCardStat(sqlSession, c);
		
		if(result > 0) {
			
			int result2 = 0;
			
			if(string.equals("insert")){
				System.out.println("서비스단에서 첨부파일 넣는중");
				result2 = cardDao.insertAttachment(sqlSession, c);
				
			}
			
			if(string.equals("update")){
				System.out.println("서비스업데이트");
				result2 = cardDao.updateAttachment(sqlSession, c);
				
			}
			
			
			if(result2 < 0) {
				
				throw new CommException("카드내역 첨부파일 수정에 실패했습니다. 관리자에게 문의 바랍니다.");
				
			}
			
		}else {
			
			throw new CommException("카드내역 수정에 실패했습니다. 관리자에게 문의 바랍니다.");
			
		}
		
	}

	@Override
	public void deleteCardStat(int statNo) {
		
		int result = cardDao.deleteCardStat(sqlSession, statNo);
		
		if(result > 0) {
			
			int result2 = cardDao.deleteAttachment(sqlSession, statNo);
			
			if(result2 < 0) {
				
				throw new CommException("카드내역 첨부파일 삭제에 실패했습니다. 관리자에게 문의 바랍니다.");
				
			}
			
		}else {
			
			throw new CommException("카드내역 삭제에 실패했습니다. 관리자에게 문의 바랍니다.");
			
		}
		
	}

	
	@Override
	public int searchStatCount(Card c) {
		
		return cardDao.searchStatCount(sqlSession, c);
		
	}

	@Override
	public ArrayList<Card> searchStatList(Card c, PageInfo pi) {
		
		return cardDao.searchStatList(sqlSession, c, pi);
		
	}

	@Override
	public Card selectCardInfo(String deptCode) {

		return cardDao.selectCardInfo(sqlSession, deptCode);
		
	}

	@Override
	public CardData cardData(String deptCode) {

		return cardDao.cardData(sqlSession, deptCode);
		
	}

	@Override
	public ArrayList<CardChart> cardChart(String deptCode) {
		
		return cardDao.cardChart(sqlSession, deptCode);
		
	}
	
}
