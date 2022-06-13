package com.workie.easy.mail.model.dto;

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
public class Mail {
	
	//mail 테이블의 컬럼
	private int mailNo;
	private String typeNo;
	private String reserveYn;
	private Date createDate;
	private Date sendDate;
	private Date cancelDate;
	private String receiveCheck;
	private String status;
	private String stateCode;
	private String ctgNo;
	
	//mail 테이블과 join하는 mail_info 테이블의 컬럼
	private String title;
	private String content;
	private int to; //수신인
	private int from; //발신인
	private int cc; //참조인
	
}
