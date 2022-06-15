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
public class Work {

	//private int workNo;
	private String workNo;
	private int empNo;
	private Date workDate;
	private String startTime;
	private String endTime;
	private String totalTime;
	private String strDate;
	
	public Work(int empNo, String strDate) {
		super();
		this.empNo = empNo;
		this.strDate = strDate;
	}
}
