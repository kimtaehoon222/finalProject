package com.workie.easy.sign.model.service;

import java.util.ArrayList;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dto.Sign;


public interface SignService {

/*	Employee sEmp(Employee sEmp); */

	ArrayList<Employee> selectList();
	
	ArrayList<Sign> selectName(int eNo);

	void insertName(int eNo);

}
