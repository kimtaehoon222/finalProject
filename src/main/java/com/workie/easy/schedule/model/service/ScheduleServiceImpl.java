package com.workie.easy.schedule.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.schedule.model.dao.ScheduleDao;
import com.workie.easy.schedule.model.dto.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao skedDao;

	@Override
	public ArrayList<Schedule> scheduleList(int empNo) {
		
		return skedDao.scheduleList(sqlSession, empNo);
	}
	
	@Override
	public ArrayList<Schedule> scheduleList2() {
		
		return skedDao.scheduleList2(sqlSession);
	}

}
