package com.workie.easy.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.schedule.model.dao.ScheduleDao;
import com.workie.easy.schedule.model.dto.Schedule;

/*
* <pre>
* Class : ScheduleServiceImpl
* Comment : controller에서 넘어온 요청을 처리해서 dao로 넘긴다.
* History
* 2022/06/15 (전재은) 처음 작성, 일정전체조회 추가
* 2022/06/18 (전재은) 일정상세조회 추가
* 2022/06/20 (전재은) 일정등록추가
* </pre>
* @version 1
* @author 전재은
* @see ScheduleController, ScheduleService, ScheduleDao
*/
@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao skedDao;

	@Override
	public ArrayList<Schedule> selectScheduleList(Schedule sked) {
		
		return skedDao.selectScheduleList(sqlSession, sked);
		
	}

	@Override
	public Schedule selectSchedule(Schedule sked) {

		return skedDao.selectSchedule(sqlSession, sked);

	}

	@Override
	public void insertSchedule(Schedule sked) {

		int result = skedDao.insertSchedule(sqlSession, sked);
		if(result>0) {
			skedDao.insertScheduleInfo(sqlSession, sked);
		}
		
	}

	@Override
	public void updateSchedule(Schedule sked) {

		int result = skedDao.updateSchedule(sqlSession, sked);
		if(result>0) {
			skedDao.updateScheduleInfo(sqlSession, sked);
		}
		
	}

	@Override
	public void deleteSchedule(String skedNo) {

		skedDao.deleteSchedule(sqlSession, skedNo);
		
	}
	
}
