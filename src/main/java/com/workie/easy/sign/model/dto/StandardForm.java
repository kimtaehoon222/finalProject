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
public class StandardForm {
	
	private int signNo; //결재번호
	private Date expiryDate; //문서 만료일
	private String ctgNo; //분류코드
	private String signContent; //결재 내용
}
