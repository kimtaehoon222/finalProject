package com.workie.easy.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.employee.model.dto.Employee;

@Repository
public class EmployeeDao {

	public Employee loginEmp(SqlSessionTemplate sqlSession, Employee emp) {
		
		return sqlSession.selectOne("employeeMapper.loginEmp",emp);
		
	}

	public int insertEmp(SqlSessionTemplate sqlSession, Employee emp) {
		
		return sqlSession.insert("employeeMapper.insertEmp",emp);
		
	}

}
