package com.workie.easy.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.workie.easy.mail.model.dto.Mail;
import com.workie.easy.mail.model.dto.MailPageInfo;
import com.workie.easy.mail.model.dto.MailType;

/*
* <pre>
* Class : MailDao
* Comment : DB에 접근하는 클래스
* 
* History
* 2022/06/13 (김지수) insert 구현
* 2022/06/14~15 (김지수) selectList 구현
* 2022/06/15 (김지수) selectDetail 구현
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see MailService, mail-mapper.xml
*
*/
@Repository
public class MailDao {

	public int insertMail(SqlSession sqlSession, Mail mail) {
		
		return sqlSession.insert("mailMapper.insertMail", mail);
		
	}

	public int selectMailListCount(SqlSession sqlSession, MailType mailType) {

		return sqlSession.selectOne("mailMapper.selectMailListCount", mailType);
	}

	public ArrayList<Mail> selectReceiveMailList(SqlSession sqlSession, int toMail, MailPageInfo mpi) {
		
		int offset = (mpi.getCurrentPage()-1) * mpi.getMailLimit();
		RowBounds rowBounds = new RowBounds(offset, mpi.getMailLimit());

		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList", toMail, rowBounds);
	}

	public ArrayList<Mail> selectSendMailList(SqlSession sqlSession, int fromMail, MailPageInfo mpi) {

		int offset = (mpi.getCurrentPage()-1) * mpi.getMailLimit();
		RowBounds rowBounds = new RowBounds(offset, mpi.getMailLimit());

		return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", fromMail, rowBounds);
	}

	public ArrayList<Mail> selectReserveMailList(SqlSession sqlSession, int fromMail, MailPageInfo mpi) {
		
		int offset = (mpi.getCurrentPage()-1) * mpi.getMailLimit();
		RowBounds rowBounds = new RowBounds(offset, mpi.getMailLimit());

		return (ArrayList)sqlSession.selectList("mailMapper.selectReserveMailList", fromMail, rowBounds);
	}

	public ArrayList<Mail> selectDeleteMailList(SqlSession sqlSession, int toFromMail, MailPageInfo mpi) {
		
		int offset = (mpi.getCurrentPage()-1) * mpi.getMailLimit();
		RowBounds rowBounds = new RowBounds(offset, mpi.getMailLimit());

		return (ArrayList)sqlSession.selectList("mailMapper.selectDeleteMailList", toFromMail, rowBounds);
	}

	public int updateReceiveCheck(SqlSession sqlSession, int mailNo) {
		
		return sqlSession.update("mailMapper.updateReceiveCheck", mailNo);
	}

	public Mail selectDetailMail(SqlSession sqlSession, int mailNo) {

		return sqlSession.selectOne("mailMapper.selectDetailMail", mailNo);
	}

	public ArrayList<Mail> selectCcMembers(SqlSession sqlSession, String ccMail) {

		return (ArrayList)sqlSession.selectList("mailMapper.selectCcMembers", ccMail);
	}

	public int selectToMail(SqlSession sqlSession, int mailNo) {
		
		return sqlSession.selectOne("mailMapper.selectToMail", mailNo);
	}

	public Mail selectDetailDeleteMail(SqlSession sqlSession, int mailNo) {
		
		return sqlSession.selectOne("mailMapper.selectDetailDeleteMail", mailNo);
	}

	public Mail selectDetailMailForReply(SqlSession sqlSession, int mailNo) {
		
		return sqlSession.selectOne("mailMapper.selectDetailMailForReply", mailNo);
	}

	
}
