package com.workie.easy.mail.model.service;

import java.util.ArrayList;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.mail.model.dto.Department;
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

	void cancelMail(int mailNo);

	/*void deleteMailList(int mailNo);*/

	void restoreMail(int mailNo);

	void permanentDeleteMail(int mailNo);

	void deleteMail(int mailNo);

	int selectEmpNo(String mailEmpId);

	String selectEmpId(int empNo);

	ArrayList<Department> seletDeptList();

	ArrayList<Employee> seletEmployeeList(String selectDept);

	boolean checkReserveMail(int toMail);

	void updateReserveMail(int toMail);

	ArrayList<Mail> selectMailListNoRead(int empNo);

	ArrayList<Mail> selectFavoriteEmpList(int empNo);

	ArrayList<Mail> seletMailListChart(int empNo);

	boolean checkReserveMailFromMe(int fromMail);

	void updateReserveMailFromMe(int fromMail);

	
}
