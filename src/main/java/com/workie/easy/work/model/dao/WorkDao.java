package com.workie.easy.work.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.workie.easy.work.model.dto.Work;
import com.workie.easy.work.model.dto.WorkSInfo;

@Repository
public class WorkDao {

	public Work selectWork(SqlSession sqlSession, int empNo) {
		
		return sqlSession.selectOne("workMapper.selectWork", empNo);
	}

	public int insertWork(SqlSession sqlSession, int empNo) {
		
		return sqlSession.insert("workMapper.insertWork", empNo);
	}

	public int updateWork(SqlSession sqlSession, String wNo) {
		
		return sqlSession.update("workMapper.updateWork", wNo);
	}

	public int insertWorkStatus(SqlSession sqlSession, WorkSInfo wsi) {
	
		return sqlSession.insert("workMapper.insertWorkStatus", wsi);
	}

}
