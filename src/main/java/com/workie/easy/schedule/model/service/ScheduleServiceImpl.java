package com.workie.easy.schedule.model.service;

import java.util.ArrayList;

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
	public ArrayList<Schedule> scheduleList(Schedule sked) {
		
		return skedDao.scheduleList(sqlSession, sked);
	}
	
	@Override
	public ArrayList<Schedule> scheduleList2() {
		
		return skedDao.scheduleList2(sqlSession);
	}

}
