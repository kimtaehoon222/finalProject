package com.workie.easy.sign.model.service;

import java.util.ArrayList;

import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dto.Sign;


public interface SignService {

	ArrayList<Employee> selectList();

	void insertSign(Sign si);

	void insertHelp(Sign si);
	

	/* void insertName(int eNo); */

}
