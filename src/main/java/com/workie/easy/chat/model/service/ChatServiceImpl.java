package com.workie.easy.chat.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.chat.model.dao.ChatDao;
import com.workie.easy.chat.model.dto.Contect;
import com.workie.easy.mail.model.dto.Department;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChatDao chatdao;

	@Override
	public ArrayList<Department> selectDeptList() {
		ArrayList<Department> list = chatdao.selectDeptList(sqlSession);
		return list;
	}

	@Override
	public ArrayList<Contect> selectEmpList(String deptName) {
		ArrayList<Contect> list = chatdao.selectEmpList(sqlSession, deptName);
		return list;
	}
}
