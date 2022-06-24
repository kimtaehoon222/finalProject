package com.workie.easy.acct.model.dto;

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
public class Card {
	
	/*부서 법인카드*/
	private int cardRegNo;			//카드등록번호
	private String deptCode;		//부서코드
	private String cardIssuer;		//카드사
	private String cardName;		//카드이름
	private String cardStatus;		//카드상태
	private String ctgNo;			//카드분류코드
	
	/*카드 정보*/
//	private int cardRegNo;			//카드등록번호
	private int cardLine;			//이용한도
	private String paymentType;		//카드브랜드
	private String cardNo;			//카드번호
	private String expirationDate;	//카드유효기간
	private int securityCode;		//CVC
	
	/*카드 내역*/
	private int statNo;				//카드내역번호
//	private int cardRegNo;			//카드등록번호
	private int empNo;				//카드사용인(사원번호)
	private String paymentStatus;	//결제처리상태
	private int amount;				//카드승인금액
	private String transactionDate;	//카드사용일
	private String storeName;		//가맹점
	private String statMemo;		//카드내역메모
	private String statStatus;		//내역상태
//	private String ctgNo;			//분류코드
	
	private String empName;			//카드사용인(사원이름)

}
