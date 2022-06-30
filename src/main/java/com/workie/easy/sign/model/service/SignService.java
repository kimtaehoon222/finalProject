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

	Sign selectBBPList(Sign si);

	Sign selectCCPList(Sign si);

	void updateRR(Sign si);

	void updateA(Sign si);

	int selectRListCount(String empName);

	ArrayList<Sign> selectBackList(PageInfo pi, String empName);

	Sign selectAARList(Sign si);

	Sign selectBBRList(Sign si);

	Sign selectCCRList(Sign si);

	int selectAListCount(String deptCode);

	ArrayList<Sign> selectEndList(PageInfo pi, String deptCode);

	Sign selectAAAList(Sign si);

	Sign selectBBAList(Sign si);

	Sign selectCCAList(Sign si);

	int selectMywListCount(String empName);

	ArrayList<Sign> selectMySignWaitingList(PageInfo pi, String empName);

	void updateAAsign(Sign si);

	void DeleteN(Sign si);

	ArrayList<Sign> selectViewW(String empName);

	ArrayList<Sign> selectViewP(String empName);

	ArrayList<Sign> selectViewR(String empName);

	ArrayList<Sign> selectViewA(String deptCode);

	

	/* void insertName(int eNo); */

}
