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
public class ChartForPersonnel {

	/* between 조건절에 사용되는 함수*/
	private String startDate;
	private String endDate;
	
	private String groupBy;
	private String departD1;
	private String departD2;
	private String departD3;
	private String departD4;
	private String departD5;
	private String departD6;
	private String departD7;
}
