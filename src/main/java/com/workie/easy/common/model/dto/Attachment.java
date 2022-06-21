package com.workie.easy.common.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
* <pre>
* Class : Attachment
* Comment : 첨부파일의 정보를 담는 dto 클래스
* 
* History
* 2022/06/14 (김지수) 생성
* 2022/06/
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see 
*
*/
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Attachment {

	private int fileNo;							/* 파일 번호 */
	private int refNo;							/* 참조 번호 */
	private String ctgNo;						/* 분류 코드*/
	private String originName;					/* 파일 원본명 */
	private String changeName;					/* 파일 수정명 */
	private String filePath;					/* 저장 경로 */
	private Date uploadDate;					/* 업로드일 */
	private String status;						/* 상태값 */
	
	private String empId;                       /* 직원 아이디 */
	private String empNo;                       /* 사원 아이디*/
	
}
