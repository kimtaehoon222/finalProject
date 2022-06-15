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
		System.out.println("kim"+ result);
				
		     if(result > 0 ) {
				
				Employee loginUser = empDao.loginEmp(sqlSession,e);
				//empDao.loginEmp(sqlSession,e); 바뀐 정보 가져오기
				return loginUser;
			}else{
				throw new CommException("정보 수정에 실패하였습니다. 관리자에게 문의해주세요");
			}
		}

	@Override
	public ArrayList<Employee> selectEmpList() {
		
		ArrayList<Employee> list = personnelDao.selectEmpList(sqlSession);
		return list;
	}

	@Override
	public Employee updatePwd(Employee e) {
		
		int result = personnelDao.updatePwd(sqlSession, e);
		System.out.println("kimkim" + result);
		if(result > 0) { //업데이트가 성공적으로 되었다면
			return e; //객체 e 반환
		}else { //업데이트 실패시
			throw new CommException("비밀번호 변경에 실패하였습니다."); 
		}
	}

	@Override
	public Employee selectEmp(int eId) {
		
		Employee e = personnelDao.selectEmp(eId, sqlSession);
		System.out.println("직원 상세 페이지 서비스" + e);
		return e;
	}

}

