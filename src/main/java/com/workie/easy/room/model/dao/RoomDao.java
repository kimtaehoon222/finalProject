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

}
