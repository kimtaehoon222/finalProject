package com.workie.easy.mail.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.workie.easy.mail.model.dto.Mail;

/*
* <pre>
* Class : MailDao
* Comment : DB에 접근하는 클래스
* 
* History
* 2022/06/13 (김지수) insert 구현
* 2022/06/
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see MailService, mail-mapper.xml
*
*/
@Repository
public class MailDao {

	public int insertMail(SqlSession sqlSession, Mail mail) {
		
		System.out.println("다오 mail 확인" + mail);
		return sqlSession.insert("mailMapper.insertMail", mail);
		
	}
	
}
