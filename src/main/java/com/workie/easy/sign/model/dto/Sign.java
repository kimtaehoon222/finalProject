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
	private String typeCode; //유형코드 (품의 : AA, 현조 : BB, 휴가 : CC)
	private String signTitle; //결재제목
	private int empNo; //사원번호
	private String createDate; //기안일
	private String firstApprover; //1차 결재자
	private String finalApprover; //최종 결재자
	private String firstSignDate; //1차 승인일
	private String finalSignDate; //최종 승인일
	private String rejectDate; //반려일
	private String statusCode; //처리 상태코드
	private String status; // 상태값
	private String modifyDate; //수정일
	private String createName; //기안자
	private String signContent; //결재내용
	
	private String empName;//사원이름
	private String jobName;//직위명
	private String jobCode;//직위코드
	
	/* 파일 */
	private int fileNo;							/* 파일 번호 */
	private int refNo;							/* 참조 번호 */
	private String originName;					/* 파일 원본명 */
	private String changeName;					/* 파일 수정명 */
	private String filePath;					/* 저장 경로 */
	private Date uploadDate;					/* 업로드일 */
	
	/* 품의, 협조 */
	private String expiryDate; //문서 만료일
	private String ctgNo; //분류코드
	
	private String check; // 1년
	
	/* 휴가원 */
	private String title; //제목
	private String reason; //사유
	private String firstDate; //휴가 시작일
	private String lastDate; //휴가 종료일
	private String vCode; //휴가종류
	
	/* 결재 유형 */
	private String typeName; //유형명 (품의, 협조, 휴가)
	
	/* 부서 */
	private String deptCode;
	private String deptName;
	private String deptPwd;
	
	/* 1차 결재자, 최종 결재자 이름 / 직급 */
	
	private String firstSignName;
	private String firstSignJob;
	private String finalSignName;
	private String finalSignJob;
	
}

