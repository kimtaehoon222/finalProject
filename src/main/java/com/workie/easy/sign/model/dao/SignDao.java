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

	public Sign selectBBPList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectBBPlist", si);
	}

	public Sign selectCCPList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectCCPlist", si);
	}

	public int updateRR(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.update("signMapper.updateRR", si);
	}

	public int updateA(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.update("signMapper.updateA", si);
	}

	public int selectRListCount(SqlSessionTemplate sqlSession, String empName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectRListCount", empName);
	}

	public ArrayList<Sign> selectBackList(SqlSessionTemplate sqlSession, PageInfo pi, String empName) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("signMapper.selectBackList", empName, rowBounds);
	}

	public Sign selectAARList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectAARlist", si);
	}

	public Sign selectBBRList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectBBRlist", si);
	}

	public Sign selectCCRList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectCCRlist", si);
	}

	public int selectAListCount(SqlSessionTemplate sqlSession, String deptCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectAListCount", deptCode);
	}

	public ArrayList<Sign> selectEndList(SqlSessionTemplate sqlSession, PageInfo pi, String deptCode) {
		// TODO Auto-generated method stub

		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("signMapper.selectEndList", deptCode, rowBounds);
	}

	public Sign selectAAAList(SqlSessionTemplate sqlSession, Sign si) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signMapper.selectAAAlist", si);
	}


		
}
