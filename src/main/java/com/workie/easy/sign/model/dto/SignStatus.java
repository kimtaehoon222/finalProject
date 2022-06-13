package com.workie.easy.sign.model.dto;

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
public class SignStatus {

	private String statusCode; //처리 상태코드 W :대기, P :진행, A, :승인,  R :반려
	private String statusName; //처리 상태명
	
}
