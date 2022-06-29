package com.workie.easy.personnel.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.workie.easy.common.model.dto.Attachment;
import com.workie.easy.employee.model.dto.Employee;

public interface PersonnelService {

	Employee updateEmp(Employee e);
	//마이페이지 업데이트 메소드
	ArrayList<Employee> selectEmpList();
	//인사관리에서 재직중인 직원 전체 리스트 메소드
	Employee updatePwd(BCryptPasswordEncoder bCryptPasswordEncoder, Employee e, String originPwd, String updatePwd);
	//마이페이지 비밀번호 업데이트 메소드
	Employee selectEmp(String eId);
	//인사관리에서 재직중인 직원 메소드
	void updateEmpInfo(Employee emp, Attachment at);
	//인사관리에서 재직중인 직원 정보 메소드
	void deleteEmp(String eId);
	//재직중인 직원 퇴사시키는 메소드
	ArrayList<Employee> selectRetiredEmpList();
	//인사관리에서 퇴사자 리스트 메소드
	Employee selectRetiredEmp(String eId);
	//인사관리에서 퇴사자 상세 메소드
	Employee updateReturnEmp(String eId);
	//인사관리에서 퇴사자 다시 재직으로 업데이트 메소드
	ArrayList<Employee> selectApvList();
	//인사관리에서 미승인 직원 목록 조회하는 메소드
	void insertEmp(Employee e, Attachment at);
	//인사관리에서 미승인 직원 정보 추가, 승인 메소드
	ArrayList<Employee> selectMonthEmpList();
	//이 달의 입사지 리스트 조회하는 메소드
}
