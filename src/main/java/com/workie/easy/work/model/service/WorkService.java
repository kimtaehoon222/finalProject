package com.workie.easy.work.model.service;

import java.util.ArrayList;

import com.workie.easy.sign.model.dto.VacationForm;
import com.workie.easy.work.model.dto.EmpVacation;
import com.workie.easy.work.model.dto.VacationInfo;
import com.workie.easy.work.model.dto.Work;
import com.workie.easy.work.model.dto.WorkSInfo;

public interface WorkService {

	Work selectWork(int empNo);

	void insertWork(int empNo);

	void updateWork(String wNo);

	void insertWorkStatus(WorkSInfo wsi);

	ArrayList<Work> selectWorkList(Work work);

	VacationInfo selectVacationInfo(int empNo);

	ArrayList<EmpVacation> selectEmpVacationList(int empNo);

}
