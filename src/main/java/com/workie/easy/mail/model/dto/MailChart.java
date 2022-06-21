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
public class MailChart {
	
	/* mailHome.jsp에서 chart에 사용되는 필드 */
	private int toMail;
	private int fromMail;
	private int totalMail;
	private double percentToMail;
	private double percentFromMail;

}
