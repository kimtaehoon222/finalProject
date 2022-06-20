package com.workie.easy.sign.model.dto;

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
public class VacationForm {
	
	private int signNo; //결재번호
	private String title; //제목
	private String reason; //사유
	private Date firstDate; //휴가 시작일
	private Date lastDate; //휴가 종료일
	private String vNo; //휴가종류
	
	//조인

	private String vName;
	private String deptName;
}
