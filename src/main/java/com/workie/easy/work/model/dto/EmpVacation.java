package com.workie.easy.work.model.dto;



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
public class EmpVacation {

	private int signNo; //결재번호
	private String title; //제목
	private String reason; //사유
	private Date firstDate; //휴가 시작일
	private Date lastDate; //휴가 종료일
	private String vCode;
	
	//사용한 일 
	private int usingDay;
	private double hDay;
	
	//join
	private String vName;
	private String deptName;
}
