package com.workie.easy.sign.model.service;

import java.util.ArrayList;

import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.employee.model.dto.Employee;
import com.workie.easy.sign.model.dto.Sign;


public interface SignService {

	ArrayList<Employee> selectList();

	void insertSign(Sign si);

	void insertHelp(Sign si);

	void insertDay(Sign si);

	int selectListCount(String empName);

	ArrayList<Sign> selectWaitingList(PageInfo pi, String empName);

	Sign selectAAList(Sign si);

	Sign selectBBList(Sign si);

	Sign selectCCList(Sign si);

	void updateR(Sign si);

	void updateP(Sign si);

	int selectPListCount(String empName);

	ArrayList<Sign> selectGoList(PageInfo pi, String empName);

	Sign selectAAPList(Sign si);

	

	/* void insertName(int eNo); */

}
