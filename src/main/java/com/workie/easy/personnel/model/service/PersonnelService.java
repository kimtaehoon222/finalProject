package com.workie.easy.personnel.model.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.workie.easy.employee.model.dto.Employee;

public interface PersonnelService {

	Employee updateEmp(Employee e);

	ArrayList<Employee> selectEmpList();

	Employee updatePwd(Employee e);

	Employee selectEmp(int eId);


}
