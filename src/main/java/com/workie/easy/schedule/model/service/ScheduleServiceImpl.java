package com.workie.easy.schedule.model.service;

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
	public List<Map<String, Schedule>> scheduleList() {
		
		return skedDao.scheduleList(sqlSession);
	}
	
	@Override
	public List<Schedule> scheduleList2() {
		
		return skedDao.scheduleList2(sqlSession);
	}

}
