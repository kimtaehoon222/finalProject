package com.workie.easy.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.workie.easy.employee.JoinException;
import com.workie.easy.employee.LoginException;
import com.workie.easy.employee.model.dao.EmployeeDao;
import com.workie.easy.employee.model.dto.Employee;

/*
* <pre>
* Class : EmployeeServiceImpl
* Comment : controller에서 넘어온 요청을 처리해서 dao로 넘긴다.
* History
* 2022/06/14 (전재은) 처음 작성, 로그인, 회원가입 생성
* 2022/06/15 (전재은) 사용자 정의 예외처리 추가
* 2022/06/19 (전재은) 회원가입 예외처리 수정
* </pre>
* @version 1
* @author 전재은
* @see EmployeeController, EmployeeService, EmployeeDao
*/
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmployeeDao empDao;
	
	@Override
	public Employee loginEmp(BCryptPasswordEncoder bCryptPasswordEncoder, Employee emp) {

		Employee loginEmp = empDao.loginEmp(sqlSession, emp);

		if(loginEmp == null) {
			throw new LoginException("로그인에 실패했습니다. 가입 미승인 또는 없는 아이디입니다.");
		}
		
		if(!bCryptPasswordEncoder.matches(emp.getEmpPwd(), loginEmp.getEmpPwd())) {
			throw new LoginException("로그인에 실패했습니다. 암호가 불일치합니다.");
		}
		
		return loginEmp;
	}

	@Override
	public void insertEmp(Employee emp) {
		
		int result = empDao.insertEmp(sqlSession, emp);
		
		if(result<0) {
			throw new JoinException("회원가입에 실패하였습니다.");
		}
		
	}

}
