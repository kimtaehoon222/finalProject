package com.workie.easy.mail.model.service;

import com.workie.easy.mail.model.dto.Mail;

public interface MailService {

	void insertMail(Mail mail);

	//int selectListCount(); //메일 개수 조회
	
	//ArrayList<Mail> selectList(MailPageInfo mpi); //메일 리스트 조회(페이지정보 객체 전달)
	
	//Mail selectMail(int mno);
	
	
}
