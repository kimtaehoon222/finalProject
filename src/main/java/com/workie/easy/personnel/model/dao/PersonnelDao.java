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

	public ArrayList<Employee> selectListEmp(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("personnelMapper.selectListEmp");
	}

}
