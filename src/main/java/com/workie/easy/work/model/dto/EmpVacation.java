package com.workie.easy.work.model.dto;



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
public class EmpVacation {

	private String useNo;//휴가코드
	private int empNo;//사원코드
	private String vNo;//종류코드
	private String reason;//사유	
	private Date firstDate;//휴가 시작일
	private Date lastDate;//휴가 종료일
	private int usingDay;//휴가 사용일
	
	//join
	private String vName;
	private String deptName;
}
