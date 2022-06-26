package com.workie.easy.room.model.dto;

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
public class Room {
 
	private int roomNo;//회의실번호
	private String roomName;//회의실이름
	private int capacity;//총인원
	
	private int resNo;//예약번호
	private int empNo;//사원번호
	private String meetTitle;//예약 번호
	private String meetGoal;//예약 목적
	private String startDate;//시작시간
	private String endDate;//종료시간
	private String resStatus;//상태값
	
	private String empName; //사원 이름

}
