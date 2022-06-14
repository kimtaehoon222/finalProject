package com.workie.easy.personnel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.personnel.model.dao.PersonnelDao;

@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	@Autowired
	private PersonnelDao personnelDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Employee updateEmp(Employee e) {
		
		int result = personnelDao.updateEmp(sqlSession,e);
		return null;
	}

	@Override
	public ArrayList<Employee> selectListEmp() {
		
		ArrayList<Employee> list = personnelDao.selectListEmp(sqlSession);
		return list;
	}
}
