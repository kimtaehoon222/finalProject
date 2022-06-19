package com.workie.easy.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Repository;

import com.workie.easy.employee.JoinException;
import com.workie.easy.employee.model.dto.Employee;

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
