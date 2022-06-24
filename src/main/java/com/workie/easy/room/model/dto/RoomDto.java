package com.workie.easy.room.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RoomDto {
 
	private int roomNo;//회의실번호
	private String roomName;//회의실이름
	private int capacity;//총인원
	
	private int resNo;//예약번호
	private int empNo;//사원번호
	private String meetTitle;//예약 번호
	private String meetGoal;//예약 목적
	private Date resDate;//예약날짜
	private String startTime;//시작시간
	private String endTime;//종료시간
	private String resStatus;//상태값

}
