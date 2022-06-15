package com.workie.easy.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dao.SignDao;


@Service
public class SignServiceImpl implements SignService {
	

@Autowired
private SqlSessionTemplate sqlSession;

@Autowired
private SignDao signDao;

/*
	@Override
	public Employee sEmp(Employee sEmp) {
		// TODO Auto-generated method stub
		return null;
	}
	
	*/

	@Override
	public ArrayList<Employee> selectList() {
		// TODO Auto-generated method stub
		return signDao.selectList(sqlSession);
	}



}
