package com.workie.easy.employee.model.dto;

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
public class Employee {

	private int empNo;//사원번호
	private String empName;//사원이름
	private String phone;//전화번호
	private String empId;//이메일	
	private String empReg;//주민번호
	private String gender;//성별
	private String empPwd;//비밀번호
	private String address;//주소
	private String deptCode;//부서코드
	private String jobCode;//직위코드
	private String disabledYN;//장애여부
	private String empNote;//특이사항
	private Date hireDate;//입사일
	private Date entDate;//퇴사일
	private String apvYN;//승인여부
	private String entYN;//재직여부
	private String ctgNo;//분류코드
	
	private String deptName;//부서명
	private String jobName;//직위명
	private int jobVacation;//보유연차
		
}
