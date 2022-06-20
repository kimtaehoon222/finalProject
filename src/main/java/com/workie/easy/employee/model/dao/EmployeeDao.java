package com.workie.easy.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Repository;

import com.workie.easy.employee.JoinException;
import com.workie.easy.employee.model.dto.Employee;

/*
* <pre>
* Class : EmployeeDao
* Comment : service에서 넘어온 값으로 DB에 접근한다.
* History
* 2022/06/14 (전재은) 처음 작성, 로그인, 회원가입 생성
* 2022/06/19 (전재은) 회원가입 예외처리 수정
* </pre>
* @version 1
* @author 전재은
* @see EmployeeServiceImpl, employee-mapper
*/
@Repository
public class EmployeeDao {

	public Employee loginEmp(SqlSessionTemplate sqlSession, Employee emp) {
		
		return sqlSession.selectOne("employeeMapper.loginEmp",emp);
		
	}

	public int insertEmp(SqlSessionTemplate sqlSession, Employee emp) {
		
		int result;
		
		try {
			
			result = sqlSession.insert("employeeMapper.insertEmp",emp);
			
		}catch(DataIntegrityViolationException e) {
			
			throw new JoinException("회원가입에 실패하였습니다.");
			
		}
		
		return result;
		
	}

}
