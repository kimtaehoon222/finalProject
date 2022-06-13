package com.workie.easy.work.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.work.model.dao.WorkDao;
import com.workie.easy.work.model.dto.Work;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private WorkDao workdao;

	@Override
	public Work selectWork(int empNo) {
		Work w = workdao.selectWork(sqlSession, empNo);
		return w;
	}
}
