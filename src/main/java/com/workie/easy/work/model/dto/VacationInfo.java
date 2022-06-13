package com.workie.easy.work.model.dto;


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
public class VacationInfo {

	private int empNo;
	private int allDays;
	private int useDays;
	private int leftDays;
}
