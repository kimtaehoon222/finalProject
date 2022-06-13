package com.workie.easy.work.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.workie.easy.work.model.dto.Work;

@Repository
public class WorkDao {

	public Work selectWork(SqlSession sqlSession, int empNo) {
		
		return sqlSession.selectOne("workMapper.selectWork", empNo);
	}

}
