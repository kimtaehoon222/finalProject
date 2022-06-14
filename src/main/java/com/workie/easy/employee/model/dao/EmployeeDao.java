package com.workie.easy.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.employee.model.dto.Employee;

@Repository
public class EmployeeDao {

	public Employee loginEmp(SqlSessionTemplate sqlSession, Employee emp) {
		
		Employee loginEmp = sqlSession.selectOne("employeeMapper.loginEmp",emp);
		
		return loginEmp;
		
	}

	public int insertEmp(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return 0;
	}

}
