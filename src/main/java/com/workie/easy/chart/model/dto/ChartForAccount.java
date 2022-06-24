package com.workie.easy.chart.model.dto;

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
public class ChartForAccount {

	private String deptName;
	private String jobName;
	private String empName;
	private String hireDate;
	private long salary;
	private String percent;
	private long middleSum;
	private long totalSum;
	
}
