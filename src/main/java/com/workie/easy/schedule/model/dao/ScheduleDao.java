package com.workie.easy.schedule.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.schedule.model.dto.Schedule;

@Repository
public class ScheduleDao {

	public List<Map<String, Schedule>> scheduleList(SqlSessionTemplate sqlSession) {
		
//		return sqlSession.selectList("skedMapper.scheduleList");
		return null;
		
	}

	public List<Schedule> scheduleList2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("skedMapper.scheduleList");
	}

}
