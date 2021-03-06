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
public class Chart {

	private String category; 
	private String type; 

	/* 메일 */
	private String year; 
	private String month; 
	
	/* 회계*/
	private String groupingLarge; 
	private String groupingSmall; 
	
	
}
