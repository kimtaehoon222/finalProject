package com.workie.easy.sign.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dto.Sign;

@Repository
public class SignDao {

	public ArrayList<Employee> selectList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		return (ArrayList)sqlSession.selectList("signMapper.selectList");
	}

	public int insertName(SqlSessionTemplate sqlSession, int eNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("signMapper.insertName", eNo);
	}

	public ArrayList<Sign> selectName(SqlSessionTemplate sqlSession, int eNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("signMapper.selectName");
	}

	public int insertSign(SqlSessionTemplate sqlSession, Sign si) {
		
		return sqlSession.insert("signMapper.insertSign", si);
	}

	public int insertHelp(SqlSessionTemplate sqlSession, Sign si) {
		
		return sqlSession.insert("signMapper.insertHelp", si);
	}

	public int insertDay(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.insert("signMapper.insertDay", si);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String empName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectListCount", empName);
	}

	public ArrayList<Sign> selectWaitingList(SqlSessionTemplate sqlSession, PageInfo pi, String empName) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("signMapper.selectWaitingList", empName, rowBounds);
	}

	public Sign selectAAList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectAAlist", si);
	}

	public Sign selectBBList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectBBlist", si);
	}

	public Sign selectCCList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectCClist", si);
	}

	public int updateR(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.update("signMapper.updateR", si);
	}

	public int updateP(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.update("signMapper.updateP", si);
	}

	public int selectPListCount(SqlSessionTemplate sqlSession, String empName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectPListCount", empName);
	}

	public ArrayList<Sign> selectGoList(SqlSessionTemplate sqlSession, PageInfo pi, String empName) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("signMapper.selectGoList", empName, rowBounds);
	}

	public Sign selectAAPList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectAAPlist", si);
	}


		
}
