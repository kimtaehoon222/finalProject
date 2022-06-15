package com.workie.easy.mail.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.common.CommException;
import com.workie.easy.mail.model.dao.MailDao;
import com.workie.easy.mail.model.dto.Mail;
import com.workie.easy.mail.model.dto.MailPageInfo;
import com.workie.easy.mail.model.dto.MailType;

/*
* <pre>
* Class : MailServiceImpl
* Comment : MailController에서 DB에 반영할 데이터를 전달받고, sqlSession 객체를 Dao에 전달하는 클래스
* 
* History
* 2022/06/13 (김지수) insert 구현
* 2022/06/
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see MailController, MailDao
*
*/
@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MailDao mailDao;

	@Override
	public void insertMail(Mail mail) {
		
		int result = mailDao.insertMail(sqlSession, mail);

		if(result < 0) {
			throw new CommException("메일 전송에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
	}

	@Override
	public int selectMailListCount(MailType mailType) {

		return mailDao.selectMailListCount(sqlSession, mailType);
	}

	@Override
	public ArrayList<Mail> selectReceiveMailList(int toMail, MailPageInfo mpi) {

		return mailDao.selectReceiveMailList(sqlSession, toMail, mpi);
	}

	@Override
	public ArrayList<Mail> selectSendMailList(int fromMail, MailPageInfo mpi) {

		return mailDao.selectSendMailList(sqlSession, fromMail, mpi);
	}

	@Override
	public ArrayList<Mail> selectReserveMailList(int fromMail, MailPageInfo mpi) {
		
		return mailDao.selectReserveMailList(sqlSession, fromMail, mpi);
	}

	@Override
	public ArrayList<Mail> selectDeleteMailList(int toFromMail, MailPageInfo mpi) {
		
		return mailDao.selectDeleteMailList(sqlSession, toFromMail, mpi);
	}
}
