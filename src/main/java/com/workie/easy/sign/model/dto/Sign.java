/**
 * 
 */
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
public class Sign {
	private int signNo; //결재번호
	private String typeCode; //유형코드 품의 : AA, 현조 : BB, 휴가 : CC
	private String signTitle; //결재제목
	private int empNo; //사원번호
	private Date createDate; //기안일
	private String firstApprover; //1차 결재자
	private String finalApprover; //최종 결재자
	private Date firstSignDate; //1차 승인일
	private Date finalSignDate; //최종 승인일
	private Date rejectDate; //반려일
	private String statusCode; //처리 상태코드
	private String status; // 상태값
	private Date modifyDate; //수정일
}

