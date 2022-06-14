package com.workie.easy.personnel.model.service;

import java.util.ArrayList;

import com.workie.easy.employee.model.dto.Employee;

public interface PersonnelService {

	Employee updateEmp(Employee e);

	ArrayList<Employee> selectListEmp();

}
