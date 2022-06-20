package com.workie.easy.mail.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.common.CommException;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.mail.model.dao.MailDao;
import com.workie.easy.mail.model.dto.Department;
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
* 2022/06/14~15 (김지수) selectList 구현
* 2022/06/15 (김지수) selectDetail 구현
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

	@Override
	public Mail selectDetailMail(int mailNo, int loginEmpNo, int toMail) {
		
		Mail mail = null;
		
		/* 수신 확인 업데이트 */
		int result = 0;
		
		/* 로그인한 회원과 해당 메일의 수신인이 같은 경우에만 수신확인 쿼리 실행한다.
		 * 로그인한 회원과 해당 메일의 수신인이 다른 경우(즉, 보낸 메일함이나 예약 메일함에서 상세조회시)에는 수신확인 쿼리를 실행하면 안된다. */
		if(loginEmpNo == toMail) {
			result = mailDao.updateReceiveCheck(sqlSession, mailNo);
		}else {
			result = 1;
		}
		
		/* 위의 if문에서 정상 update 되거나, 위의 else문을 통해 1을 받아야만 else 구문 실행 */
		if(result < 0) {
			throw new CommException("메일 확인에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}else {
			mail = mailDao.selectDetailMail(sqlSession, mailNo);
		}

		/* 수신 확인 업데이트 실패시 null 반환 */
		return mail; 
	}

	@Override
	public ArrayList<Mail> selectCcMembers(String ccMail) {

		return mailDao.selectCcMembers(sqlSession, ccMail);
	}

	@Override
	public int selectToMail(int mailNo) {

		return mailDao.selectToMail(sqlSession, mailNo);
	}

	@Override
	public Mail selectDetailDeleteMail(int mailNo, int loginEmpNo, int toMail) {
		
		Mail mail = null;
		
		/* 수신 확인 업데이트 */
		int result = 0;
		
		/* 로그인한 회원과 해당 메일의 수신인이 같은 경우에만 수신확인 쿼리 실행한다.
		 * 로그인한 회원과 해당 메일의 수신인이 다른 경우(즉, 보낸 메일함이나 예약 메일함에서 상세조회시)에는 수신확인 쿼리를 실행하면 안된다. */
		if(loginEmpNo == toMail) {
			result = mailDao.updateReceiveCheck(sqlSession, mailNo);
		}else {
			result = 1;
		}
		
		/* 위의 if문에서 정상 update 되거나, 위의 else문을 통해 1을 받아야만 else 구문 실행 */
		if(result < 0) {
			throw new CommException("메일 확인에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}else {
			mail = mailDao.selectDetailDeleteMail(sqlSession, mailNo);
		}

		/* 수신 확인 업데이트 실패시 null 반환 */
		return mail; 
	}

	@Override
	public Mail selectDetailMailForReply(int mailNo) {
	
		return mailDao.selectDetailMailForReply(sqlSession, mailNo); 
	}

	@Override
	public void cancelMail(int mailNo) {

		int result = mailDao.cancelMail(sqlSession, mailNo); 
		
		if(result < 0) {
			throw new CommException("메일 발송취소에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
		
	}

	/*@Override
	public void deleteMailList(int mailNo) {
		
		int result = mailDao.deleteMailList(sqlSession, mailNo); 
		
		if(result < 0) {
			throw new CommException("메일 삭제에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
		
	}*/

	@Override
	public void restoreMail(int mailNo) {

		int result = mailDao.restoreMail(sqlSession, mailNo); 
		
		if(result < 0) {
			throw new CommException("메일 복원에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
	}

	@Override
	public void permanentDeleteMail(int mailNo) {

		int result = mailDao.permanentDeleteMail(sqlSession, mailNo); 
		
		if(result < 0) {
			throw new CommException("메일 영구삭제에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
	}

	@Override
	public void deleteMail(int mailNo) {
		
		int result = mailDao.deleteMail(sqlSession, mailNo); 
		
		if(result < 0) {
			throw new CommException("메일 영구삭제에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
	}

	@Override
	public int selectEmpNo(String mailEmpId) {
		
		return mailDao.selectEmpNo(sqlSession, mailEmpId); 
	}

	@Override
	public String selectEmpId(int empNo) {

		return mailDao.selectEmpId(sqlSession, empNo); 
	}

	@Override
	public ArrayList<Department> seletDeptList() {
		
		return mailDao.seletDeptList(sqlSession); 
	}

	@Override
	public ArrayList<Employee> seletEmployeeList(String selectDept) {

		return mailDao.seletEmployeeList(sqlSession, selectDept); 
	}

	@Override
	public boolean checkReserveMail(int toMail) {
		
		boolean result = false;
		
		int checkReserveMailCount = mailDao.checkReserveMail(sqlSession, toMail);
		
		/* 처리해야할 예약 메일이 있는 경우 */
		if(checkReserveMailCount > 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public void updateReserveMail(int toMail) {

		int result = mailDao.updateReserveMail(sqlSession, toMail); 
		
		if(result < 0) {
			throw new CommException("메일 예약상태 변경에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
	}

	@Override
	public ArrayList<Mail> selectMailListNoRead(int empNo) {
		
		return mailDao.selectMailListNoRead(sqlSession, empNo);
	}

	@Override
	public ArrayList<Mail> selectFavoriteEmpList(int empNo) {

		return mailDao.selectFavoriteEmpList(sqlSession, empNo);
	}
}
