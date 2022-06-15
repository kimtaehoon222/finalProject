package com.workie.easy.mail.model.dto;

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
public class MailType {

	private String receive;
	private String send;
	private String reserve;
	private String delete;
	private int mailEmpNo;
	
}
