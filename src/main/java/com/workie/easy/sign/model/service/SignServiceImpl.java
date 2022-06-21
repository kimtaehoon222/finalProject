package com.workie.easy.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.common.CommException;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dao.SignDao;
import com.workie.easy.sign.model.dto.Sign;


@Service
public class SignServiceImpl implements SignService {
	

@Autowired
private SqlSessionTemplate sqlSession;

@Autowired
private SignDao signDao;



	@Override
	public ArrayList<Employee> selectList() {
		// TODO Auto-generated method stub
		return signDao.selectList(sqlSession);
	}



	@Override
	public void insertSign(Sign si) {
		
		int result = signDao.insertSign(sqlSession, si);
		
		if(result < 0 ) {
			throw new CommException("품의 기안 실패");
		}
		
	}



	@Override
	public void insertHelp(Sign si) {
		// TODO Auto-generated method stub
		
		int result = signDao.insertHelp(sqlSession, si);
		
		if(result < 0) {
			throw new CommException("협조 기안 실패");
		}
	}





}
