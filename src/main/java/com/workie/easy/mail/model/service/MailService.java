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

	Mail selectDetailMail(int mailNo, int loginEmpNo, int toMail);

	ArrayList<Mail> selectCcMembers(String ccMail);

	int selectToMail(int mailNo);

	Mail selectDetailDeleteMail(int mailNo, int loginEmpNo, int toMail);

	Mail selectDetailMailForReply(int mailNo);

	
}
