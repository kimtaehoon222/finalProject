package com.workie.easy.chat.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.chat.model.dao.ChatDao;
import com.workie.easy.chat.model.dto.Chat;
import com.workie.easy.chat.model.dto.Contect;
import com.workie.easy.common.CommException;
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

	@Override
	public Contect selectEmployee(int empNo) {
		Contect toChat = chatdao.selectEmployee(sqlSession, empNo);
		return toChat;
	}

	@Override
	public ArrayList<Chat> selectChatList(Chat chat) {
		ArrayList<Chat> chatList = chatdao.selectChatList(sqlSession, chat);
		return chatList;
	}

	@Override
	public int insertMessage(Chat chat) {
		int result = chatdao.insertMessage(sqlSession, chat);
		
		if(result < 0) {
			throw new CommException("메세지 등록에 실패하였습니다. 관리자에게 문의 바랍니다.");
		}
		
		return result;
	}
}
