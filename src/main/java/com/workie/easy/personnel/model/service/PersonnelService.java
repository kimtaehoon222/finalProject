package com.workie.easy.personnel.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.workie.easy.employee.model.dto.Employee;

public interface PersonnelService {

	Employee updateEmp(Employee e);
	//마이페이지 업데이트용
	ArrayList<Employee> selectEmpList();
	//인사관리에서 재직중인 직원 전체 리스트용
	Employee updatePwd(BCryptPasswordEncoder bCryptPasswordEncoder, Employee e, String originPwd, String updatePwd);
	//마이페이지 비밀번호 업데이트용
	Employee selectEmp(String eId);
	//인사관리에서 재직중인 직원 상세용
	void updateEmpInfo(Employee emp);
	//인사관리에서 재직중인 직원 정보 수정용
	void deleteEmp(String eId);
	//재직중인 직원 퇴사하는 용
	ArrayList<Employee> selectRetiredEmpList();
	//
	Employee selectRetiredEmp(String eId);

}
