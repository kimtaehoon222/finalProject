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
public class CardData {
	
	private String thisMonth;	//이번달
	private int aCount;			//승인수
	private int cCount;			//취소수
	private int aSum;			//승인합계
	private int cSum;			//취소합계
	private int add;			//총 사용액
	private int balance;		//잔액
	private int creditLine;		//한도

}
