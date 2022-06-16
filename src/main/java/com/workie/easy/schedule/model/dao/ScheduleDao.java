package com.workie.easy.schedule.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.schedule.model.dto.Schedule;

@Repository
public class ScheduleDao {

	public ArrayList<Schedule> scheduleList(SqlSessionTemplate sqlSession, int empNo) {
		
		return (ArrayList)sqlSession.selectList("skedMapper.scheduleList", empNo);
//		return null;
		
	}

	public ArrayList<Schedule> scheduleList2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("skedMapper.scheduleList");
	}

}
