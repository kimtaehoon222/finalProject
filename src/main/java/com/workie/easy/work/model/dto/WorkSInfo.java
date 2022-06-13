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
public class WorkSInfo {

	private String sNo;
	private int empNo;
	private int sCode;
	private String sName;
}
