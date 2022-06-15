package com.workie.easy.mail.model.service;

import java.util.ArrayList;

import com.workie.easy.mail.model.dto.Mail;
import com.workie.easy.mail.model.dto.MailPageInfo;
import com.workie.easy.mail.model.dto.MailType;

public interface MailService {

	void insertMail(Mail mail);

	int selectMailListCount(MailType mailType);

	ArrayList<Mail> selectReceiveMailList(int toMail, MailPageInfo mpi);

	ArrayList<Mail> selectSendMailList(int fromMail, MailPageInfo mpi);

	ArrayList<Mail> selectReserveMailList(int fromMail, MailPageInfo mpi);

	ArrayList<Mail> selectDeleteMailList(int toFromMail, MailPageInfo mpi);


	//int selectListCount(); //메일 개수 조회
	
	//ArrayList<Mail> selectList(MailPageInfo mpi); //메일 리스트 조회(페이지정보 객체 전달)
	
	//Mail selectMail(int mno);
	
	
}
