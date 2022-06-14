package com.workie.easy.employee.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.workie.easy.employee.model.dto.Employee;

public interface EmployeeService {

	Employee loginEmp(BCryptPasswordEncoder bCryptPasswordEncoder, Employee emp);

	void insertEmp(Employee emp);

}
