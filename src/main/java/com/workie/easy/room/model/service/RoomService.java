package com.workie.easy.room.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.workie.easy.room.model.dto.Room;

public interface RoomService {

	ArrayList<Room> selectResList(Room room);

	Room selectRes(Room room);

	ArrayList<Room> selectMyResList(Room room);

	ArrayList<Room> selectRoomList();

	int insertRes(Room room);

	int selectCheckDate(Room room);

	int deleteRes(Room room);

}
