package com.workie.easy.sign.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dto.Sign;

@Repository
public class SignDao {

	public ArrayList<Employee> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		return (ArrayList)sqlSession.selectList("signMapper.selectList");
	}

	public int insertName(SqlSessionTemplate sqlSession, int eNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("signMapper.insertName", eNo);
	}

	public ArrayList<Sign> selectName(SqlSessionTemplate sqlSession, int eNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("signMapper.selectName");
	}

	public int insertSign(SqlSessionTemplate sqlSession, Sign si) {
		
		return sqlSession.insert("signMapper.insertSign", si);
	}

	public int insertHelp(SqlSessionTemplate sqlSession, Sign si) {
		
		return sqlSession.insert("signMapper.insertHelp", si);
	}
		
}
