package com.workie.easy.acct.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.acct.model.dto.Card;
import com.workie.easy.common.model.dto.PageInfo;

/*
* <pre>
* Class : CardDao
* Comment : service에서 넘어온 값으로 DB에 접근한다.
* History
* 2022/06/24 (전재은) 처음 작성, 카드사용내역조회 추가
* 2022/06/25 (전재은) 카드사용내역조회 수정
* 2022/06/26 (전재은) 카드사용내역등록, 파일업로드, 상세조회 추가
* 2022/06/27 (전재은) 상세조회 수정, 내역 수정, 삭제 추가
* 2022/06/28 (전재은) 내역삭제 수정, 내역검색, 카드조회 추가
* 2022/06/28 (전재은) 사용금액 그래프 추가
* </pre>
* @version 1
* @author 전재은
* @see CardServiceImpl, card-mapper
*/
@Repository
public class CardDao {

	
	public int cardStatListCount(SqlSessionTemplate sqlSession, String deptCode) {

		return sqlSession.selectOne("cardMapper.cardStatListCount", deptCode);
		
	}
	
	public ArrayList<Card> selectCardStatList(SqlSessionTemplate sqlSession, String deptCode, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cardMapper.selectCardStatList" , deptCode , rowBounds);
		
	}

	public int insertCardStat(SqlSessionTemplate sqlSession, Card c) {

		return sqlSession.insert("cardMapper.insertCardStat", c);
	
	}

	public Card selectCardStat(SqlSessionTemplate sqlSession, int statNo) {

		return sqlSession.selectOne("cardMapper.selectCardStat",statNo);
	
	}

	public int updateCardStat(SqlSessionTemplate sqlSession, Card c) {

		return sqlSession.update("cardMapper.updateCardStat",c);
		
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Card c) {
		
		return sqlSession.insert("cardMapper.insertAttachment",c);
		
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, Card c) {
		
		return sqlSession.update("cardMapper.updateAttachment",c);
		
	}

	public int deleteCardStat(SqlSessionTemplate sqlSession, int statNo) {
		
		return sqlSession.update("cardMapper.deleteCardStat",statNo);
		
	}

	public int deleteAttachment(SqlSessionTemplate sqlSession, int statNo) {
		
		return sqlSession.update("cardMapper.deleteAttachment",statNo);
		
	}

	public int searchStatCount(SqlSessionTemplate sqlSession, Card c) {
		
		return sqlSession.selectOne("cardMapper.searchStatCount",c);
		
	}

	public ArrayList<Card> searchStatList(SqlSessionTemplate sqlSession, Card c, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cardMapper.searchStatList", c, rowBounds);
		
	}

	public Card selectCardInfo(SqlSessionTemplate sqlSession, String deptCode) {

		return sqlSession.selectOne("cardMapper.selectCardInfo", deptCode);
		
	}

}
