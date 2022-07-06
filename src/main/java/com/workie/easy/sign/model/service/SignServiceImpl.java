package com.workie.easy.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.common.CommException;
import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dao.SignDao;
import com.workie.easy.sign.model.dto.Sign;


@Service
public class SignServiceImpl implements SignService {
   

@Autowired
private SqlSessionTemplate sqlSession;

@Autowired
private SignDao signDao;



   @Override
   public ArrayList<Employee> selectList() {
      // TODO Auto-generated method stub
      return signDao.selectList(sqlSession);
   }



   @Override
   public void insertSign(Sign si) {
      
      int result = signDao.insertSign(sqlSession, si);
      
      if(result < 0 ) {
         throw new CommException("품의 기안 실패");
      }
      
   }



   @Override
   public void insertHelp(Sign si) {
      // TODO Auto-generated method stub
      
      int result = signDao.insertHelp(sqlSession, si);
      
      if(result < 0) {
         throw new CommException("협조 기안 실패");
      }
   }



   @Override
   public void insertDay(Sign si) {
      // TODO Auto-generated method stub
      
      int result = signDao.insertDay(sqlSession, si);
      
      if(result < 0) {
         throw new CommException("휴가원 기안 실패");
      }
      
   }



   @Override
   public int selectListCount(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectListCount(sqlSession, empName);
   }



   @Override
   public ArrayList<Sign> selectWaitingList(PageInfo pi, String empName) {
      // TODO Auto-generated method stub
      return signDao.selectWaitingList(sqlSession, pi, empName);
   }



   @Override
   public Sign selectAAList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectAAList(sqlSession, si);
   }



   @Override
   public Sign selectBBList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectBBList(sqlSession, si);
   }



   @Override
   public Sign selectCCList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectCCList(sqlSession, si);
   }



   @Override
   public void updateR(Sign si) {
      // TODO Auto-generated method stub
      int result = signDao.updateR(sqlSession, si);
      
      if(result < 0) {
         throw new CommException("휴가원 기안 실패");
      }
   }



   @Override
   public void updateP(Sign si) {
      // TODO Auto-generated method stub
      int result = signDao.updateP(sqlSession, si);   
      
      if(result < 0) {
         throw new CommException("휴가원 기안 실패");
      }
   }



   @Override
   public int selectPListCount(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectPListCount(sqlSession, empName);
   }



   @Override
   public ArrayList<Sign> selectGoList(PageInfo pi, String empName) {
      // TODO Auto-generated method stub
      return signDao.selectGoList(sqlSession, pi, empName);
   }



   @Override
   public Sign selectAAPList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectAAPList(sqlSession, si);
   }



   @Override
   public Sign selectBBPList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectBBPList(sqlSession, si);
   }



   @Override
   public Sign selectCCPList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectCCPList(sqlSession, si);
   }



   @Override
   public void updateRR(Sign si) {
      // TODO Auto-generated method stub
   int result = signDao.updateRR(sqlSession, si);
      
      if(result < 0) {
         throw new CommException("휴가원 기안 실패");
      }
   }



   @Override
   public void updateA(Sign si) {
      // TODO Auto-generated method stub
      int result = signDao.updateA(sqlSession, si);   
      
      if(result < 0) {
         throw new CommException("휴가원 기안 실패");
      }
   }



   @Override
   public int selectRListCount(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectRListCount(sqlSession, empName);
   }



   @Override
   public ArrayList<Sign> selectBackList(PageInfo pi, String empName) {
      // TODO Auto-generated method stub
      return signDao.selectBackList(sqlSession, pi, empName);
   }



   @Override
   public Sign selectAARList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectAARList(sqlSession, si);
   }



   @Override
   public Sign selectBBRList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectBBRList(sqlSession, si);
   }



   @Override
   public Sign selectCCRList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectCCRList(sqlSession, si);
   }



   @Override
   public int selectAListCount(String deptCode) {
      // TODO Auto-generated method stub
      return signDao.selectAListCount(sqlSession, deptCode);
   }



   @Override
   public ArrayList<Sign> selectEndList(PageInfo pi, String deptCode) {
      // TODO Auto-generated method stub
      return signDao.selectEndList(sqlSession, pi, deptCode);
   }



   @Override
   public Sign selectAAAList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectAAAList(sqlSession, si);
   }



   @Override
   public Sign selectBBAList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectBBAList(sqlSession, si);
   }



   @Override
   public Sign selectCCAList(Sign si) {
      // TODO Auto-generated method stub
      return signDao.selectCCAList(sqlSession, si);
   }



   @Override
   public int selectMywListCount(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectMywListCount(sqlSession, empName);
   }



   @Override
   public ArrayList<Sign> selectMySignWaitingList(PageInfo pi, String empName) {
      // TODO Auto-generated method stub
      return signDao.selectMySignWaitingList(sqlSession, pi, empName);
   }




	@Override
	public void updateAAsign(Sign si) {  //업데이트를 3개 한번에 하는게 아닌 하나씩 실행   [ 첨부가 만약 안되면  
		
		int result = signDao.updateAAsign(sqlSession, si); //Sign 테이블 업데이트 수행
		
		if(result > 0) {
			
			int result2 = signDao.updateAAstandard(sqlSession, si); //Sign 테이블 성공시 Standard테이블 업데이트 수행
			
			if(result2 > 0 && si.getOriginName() != null) {
				
				int count = signDao.selectCountAttachment(sqlSession, si); //결재번호 가지고가서 카운트만 세오기 첨부파일이 없다면 insert를 해주어야하니
		
				if(count > 0) {  //카운트가 0이상이면 업데이트 ( 카운트해올때 주의해올게 CTG_NO = 'SF' 랑 STATUS= Y 인거 꼭 조건주기  
					signDao.updateAttachment(sqlSession, si); //카운트가 0이상이면 업데이트 ( 카운트해올때 주의해올게 CTG_NO = 'SF' 랑 STATUS= Y 인거 꼭 조건주기  			
				}else{ // 조회해온게 0이하면 인설트
					signDao.insertAttachment(sqlSession, si); 
				}
			}
			
		}else { //Sign 테이블 업데이트 성공 시 
			
			throw new CommException("품의 수정 실패");

		}

	}




   @Override
   public void DeleteN(Sign si) {
      // TODO Auto-generated method stub
            int result = signDao.DeleteN(sqlSession, si);
            
            if(result < 0) {
               throw new CommException("삭제 실패");
            }
   }



   @Override
   public ArrayList<Sign> selectViewW(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectViewW(sqlSession, empName);
   }



   @Override
   public ArrayList<Sign> selectViewP(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectViewP(sqlSession, empName);
   }



   @Override
   public ArrayList<Sign> selectViewR(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectViewR(sqlSession, empName);
   }



   @Override
   public ArrayList<Sign> selectViewA(String deptCode) {
      // TODO Auto-generated method stub
      return signDao.selectViewA(sqlSession, deptCode);
   }



   @Override
   public int selectCountW(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectCountW(sqlSession, empName);
   }



   @Override
   public int selectCountP(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectCountP(sqlSession, empName);
   }



   @Override
   public int selectCountR(String empName) {
      // TODO Auto-generated method stub
      return signDao.selectCountR(sqlSession, empName);
   }



   @Override
   public int selectCountA(String deptCode) {
      // TODO Auto-generated method stub
      return signDao.selectCountA(sqlSession, deptCode);
   }






}