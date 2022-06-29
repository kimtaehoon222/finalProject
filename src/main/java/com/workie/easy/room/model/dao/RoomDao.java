package com.workie.easy.room.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workie.easy.room.model.dto.Room;

@Repository
public class RoomDao {

	public ArrayList<Room> selectResList(Room room, SqlSessionTemplate sqlSession) {
				
		return (ArrayList)sqlSession.selectList("roomMapper.selectResList",room);
	}

	public Room selectRes(Room room, SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("roomMapper.selectRes", room);
	}

	public ArrayList<Room> selectMyResList(Room room, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("roomMapper.selectMyResList",room);
	}

	public ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomList");
	}

	public int insertRes(Room room, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("roomMapper.insertRes", room);
	}

	public int selectCheckDate(Room room, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("roomMapper.selectCheckDate", room);
	}

	public int deleteRes(Room room, SqlSessionTemplate sqlSession) {
		
		return sqlSession.delete("roomMapper.deleteRes",room);
	}



}
