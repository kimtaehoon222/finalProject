package com.workie.easy.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.workie.easy.chat.model.dto.Contect;
import com.workie.easy.mail.model.dto.Department;

@Repository
public class ChatDao {

	public ArrayList<Department> selectDeptList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectDeptList");
	}

	public ArrayList<Contect> selectEmpList(SqlSession sqlSession, String deptName) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectEmpList",deptName);
	}

}
