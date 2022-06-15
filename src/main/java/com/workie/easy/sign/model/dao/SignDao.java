package com.workie.easy.sign.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.employee.model.dto.Employee;

@Repository
public class SignDao {

	public ArrayList<Employee> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		return (ArrayList)sqlSession.selectList("signMapper.selectList");
	}
		
}
