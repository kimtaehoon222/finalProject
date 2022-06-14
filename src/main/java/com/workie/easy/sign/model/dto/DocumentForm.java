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
public class DocumentForm {

	private int documentNo; //문서번호
	private String typeCode; //유형코드
	private String documentTitle; //문서제목
	private int empNo; //사원번호
	private Date CreateDate; //작성일
	private String ctgNo; //분류코드
	private String status; //상태값
}
