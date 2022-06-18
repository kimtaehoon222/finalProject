package com.workie.easy.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.schedule.model.dto.Schedule;

@Repository
public class ScheduleDao {

	public ArrayList<Schedule> scheduleList(SqlSessionTemplate sqlSession, Schedule sked) {
		
		return (ArrayList)sqlSession.selectList("skedMapper.scheduleList", sked);
		
	}

	public Schedule scheduleSelect(SqlSessionTemplate sqlSession, Schedule sked) {
		
		return sqlSession.selectOne("selectSchedule", sked);
		
	}

}
