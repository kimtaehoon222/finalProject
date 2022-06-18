package com.workie.easy.personnel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.workie.easy.common.CommException;
import com.workie.easy.employee.model.dao.EmployeeDao;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.personnel.model.dao.PersonnelDao;

@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	@Autowired
	private PersonnelDao personnelDao;
	@Autowired
	private EmployeeDao empDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Employee updateEmp(Employee e) {
		
		int result = personnelDao.updateEmp(sqlSession,e);
				
		     if(result > 0 ) {
				
				Employee loginUser = empDao.loginEmp(sqlSession,e);
				//empDao.loginEmp(sqlSession,e); 바뀐 정보 가져오기
				return loginUser;
			}else{
				throw new CommException("정보 수정에 실패하였습니다. 관리자에게 문의바랍니다.");
			}
		}

	@Override
	public ArrayList<Employee> selectEmpList() {
		
		ArrayList<Employee> list = personnelDao.selectEmpList(sqlSession);
		return list;
	}

	@Override
	public Employee updatePwd(BCryptPasswordEncoder bCryptPasswordEncoder, Employee e, String originPwd,
			String updatePwd) {
		Employee selectEmp = empDao.loginEmp(sqlSession,e);	
		
		if(!bCryptPasswordEncoder.matches(originPwd, selectEmp.getEmpPwd())){
			/*rawPassword 평문 ,encodedPassword(암호화된 패스워드) 
			  originPwd,selectEmp.getEmpPwd()비교해서 true,false로 나눠줌*/
			throw new CommException("암호 불일치합니다.");
		}
		String encPwd = bCryptPasswordEncoder.encode(updatePwd);
		selectEmp.setEmpPwd(encPwd);//암호화 된 새로운 비밀 번호를 넣어주고
		
		int result = personnelDao.updatePwd(sqlSession,selectEmp);
	
	    if(result > 0 ) {
			
	    	Employee updateEmp = empDao.loginEmp(sqlSession,e);
	    
			//새로 업데이트한 비번 담아 와서
			return updateEmp;
		}else{
			throw new CommException("비밀번호 변경에 실패하였습니다.관리자에게 문의바랍니다.");
		}
	}

	@Override
	public Employee selectEmp(String eId) {
		
		Employee e = personnelDao.selectEmp(eId, sqlSession);
	
		return e;
	}

	@Override
	public void updateEmpInfo(Employee emp) {
		
       int result = personnelDao.updateEmpInfo(emp,sqlSession);
     
		if(result < 0 ) {
			throw new CommException("직원 정보 수정에 실패하였습니다. 관리자에게 문의바랍니다.");
		}
	}

	@Override
	public void deleteEmp(String eId) {
        
		int result = personnelDao.deleteEmp(eId,sqlSession);
		
		if(result < 0 ) {
			throw new CommException("직원 삭제에 실패하였습니다. 관리자에게 문의바랍니다.");
		}
	}

	@Override
	public ArrayList<Employee> selectRetiredEmpList() {
		
		ArrayList<Employee> list = personnelDao.selectRetiredEmpList(sqlSession);
		
		return list;
	}

	@Override
	public Employee selectRetiredEmp(String eId) {
		// TODO Auto-generated method stub
		return null;
	}

}

