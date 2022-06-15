package com.workie.easy.mail.model.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	
	/* mail 테이블에 insert 하기 위한 정보를 담는 필드 */
	private int mailNo;
	private String reserveYn;
	private Date createDate;
	private String sendDate;
	private Date cancelDate;
	private String receiveCheck;
	private String status;
	private String stateCode;
	private String typeNo;
	private String ctgNo;
	
	/* mail_info 테이블에 insert 하기 위한 정보를 담는 필드 */
	private String title;
	private String content;
	private int toMail; 		
	private int fromMail; 
	private String ccMail; 
	
	/* attachment 테이블에 insert 하기 위한 정보를 담는 필드 */
	private String originName;
	private String changeName;
	private String filePath;
	
	/* join시 사용하는 필드*/
	private String typeName;
	private String empName;
	private String stateName;
	
}
