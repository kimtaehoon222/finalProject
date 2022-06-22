package com.workie.easy.schedule.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.schedule.model.dto.Schedule;

/*
* <pre>
* Class : ScheduleDao
* Comment : service에서 넘어온 값으로 DB에 접근한다.
* History
* 2022/06/15 (전재은) 처음 작성, 일정전체조회 추가
* 2022/06/18 (전재은) 일정상세조회 추가
* 2022/06/20 (전재은) 일정등록추가
* </pre>
* @version 1
* @author 전재은
* @see ScheduleServiceImpl, schedule-mapper
*/
@Repository
public class ScheduleDao {

	public ArrayList<Schedule> selectScheduleList(SqlSessionTemplate sqlSession, Schedule sked) {
		
		return (ArrayList)sqlSession.selectList("skedMapper.scheduleList", sked);
		
	}

	public Schedule selectSchedule(SqlSessionTemplate sqlSession, Schedule sked) {
		
		return sqlSession.selectOne("selectSchedule", sked);
		
	}

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sked) {

		return sqlSession.insert("insertSchedule",sked);
		
	}
	
	public int insertScheduleInfo(SqlSessionTemplate sqlSession, Schedule sked) {
		
		return sqlSession.insert("insertScheduleInfo",sked);
		
	}

	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule sked) {
		
		return sqlSession.update("updateSchedule",sked);
		
	}

	public int updateScheduleInfo(SqlSessionTemplate sqlSession, Schedule sked) {

		return sqlSession.update("updateScheduleInfo",sked);
		
	}

	public int deleteSchedule(SqlSessionTemplate sqlSession, String skedNo) {

		return sqlSession.update("deleteSchedule",skedNo);
		
	}

	public ArrayList<Schedule> searchScheduleList(SqlSessionTemplate sqlSession, Map<String, Object> hash, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("skedMapper.searchScheduleList", hash , rowBounds);
		
	}

	public int selectListCount(SqlSessionTemplate sqlSession, Map<String, Object> hash) {

		return sqlSession.selectOne("skedMapper.searchScheduleCount", hash);
		
	}


}
