package com.workie.easy.sign.model.service;

import java.util.ArrayList;

import com.workie.easy.employee.model.dto.Employee;


public interface SignService {

/*	Employee sEmp(Employee sEmp); */

	ArrayList<Employee> selectList();

	void insertName(int eNo);

}
