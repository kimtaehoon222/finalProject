package com.workie.easy.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.common.model.dto.PageInfo;
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
* 2022/06/22 (전재은) 일정검색, 개수 추가
* 2022/06/23 (전재은) 선택일자일정목록조회 추가
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

	/*일정 전체 조회*/
	@Override
	public ArrayList<Schedule> selectScheduleList(Schedule sked) {
		
		return skedDao.selectScheduleList(sqlSession, sked);
		
	}

	/*선택 일정 상세 조회*/
	@Override
	public Schedule selectSchedule(Schedule sked) {

		return skedDao.selectSchedule(sqlSession, sked);

	}

	/*일정 등록*/
	@Override
	public void insertSchedule(Schedule sked) {

		int result = skedDao.insertSchedule(sqlSession, sked);
		if(result>0) {
			skedDao.insertScheduleInfo(sqlSession, sked);
		}
		
	}

	/*일정 수정*/
	@Override
	public void updateSchedule(Schedule sked) {

		int result = skedDao.updateSchedule(sqlSession, sked);
		if(result>0) {
			skedDao.updateScheduleInfo(sqlSession, sked);
		}
		
	}

	/*일정 삭제*/
	@Override
	public void deleteSchedule(String skedNo) {

		skedDao.deleteSchedule(sqlSession, skedNo);
		
	}

	/*일정 검색*/
	@Override
	public ArrayList<Schedule> searchScheduleList(Map<String, Object> hash, PageInfo pi) {
		
		return skedDao.searchScheduleList(sqlSession, hash, pi);
		
	}

	/*검색 일정 개수*/
	@Override
	public int selectListCount(Map<String, Object> hash) {

		return skedDao.selectListCount(sqlSession, hash);
		
	}
	
	/*선택일자 일정목록 조회*/
	@Override
	public ArrayList<Schedule> selectDayScheduleList(Schedule sked) {

		return skedDao.selectDayScheduleList(sqlSession, sked);
		
	}
}
