package com.workie.easy.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.workie.easy.common.CommException;
import com.workie.easy.employee.model.dao.EmployeeDao;
import com.workie.easy.employee.model.dto.Employee;

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
			throw new CommException("loginUser 확인");
		}
		
		if(!bCryptPasswordEncoder.matches(emp.getEmpPwd(), loginEmp.getEmpPwd())) {
			throw new CommException("암호 불일치");
		}
		
		return loginEmp;
	}

	@Override
	public void insertEmp(Employee emp) {
		int result = empDao.insertEmp(sqlSession, emp);
		
		if(result <0) {
			throw new CommException("회원가입에 실패하였습니다.");
		}
	}

}
