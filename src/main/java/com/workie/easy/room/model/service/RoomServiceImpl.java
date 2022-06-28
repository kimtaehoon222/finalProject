package com.workie.easy.room.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.room.model.dao.RoomDao;
import com.workie.easy.room.model.dto.Room;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	RoomDao roomDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;


	@Override
	public ArrayList<Room> selectResList(Room room) {
		
		return roomDao.selectResList(room, sqlSession);
	}


	@Override
	public Room selectRes(Room room) {
	
		return roomDao.selectRes(room, sqlSession);
	}


	@Override
	public ArrayList<Room> selectMyResList(int eno) {
	
		return roomDao.selectMyResList(eno, sqlSession);
	}


	@Override
	public ArrayList<Room> selectRoomList() {
		
		return roomDao.selectRoomList(sqlSession);
	}


	@Override
	public Room insertRes(Room room) {
		
		int result = roomDao.insertRes(room, sqlSession);
		
		if(result > 0) {
			return roomDao.selectRes(room, sqlSession);
		}else {
			
		}
		return room;
		
	}
	
	
}
