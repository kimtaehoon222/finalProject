package com.workie.easy.personnel.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.employee.model.dto.Employee;

@Repository
public class PersonnelDao {

	public int updateEmp(SqlSessionTemplate sqlSession, Employee e) {
		
		return sqlSession.update("personnelMapper.updateEmp", e);
	}

	public ArrayList<Employee> selectEmpList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("personnelMapper.selectEmpList");
	}


	public int updatePwd(SqlSessionTemplate sqlSession, Employee e) {
		
		return sqlSession.update("personnelMapper.updatePwd", e);
	}

	public Employee selectEmp(int eId, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("personnelMapper.selectEmp", eId);
	}

}
