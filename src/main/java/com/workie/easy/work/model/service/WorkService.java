package com.workie.easy.work.model.service;

import java.util.ArrayList;

import com.workie.easy.work.model.dto.Work;
import com.workie.easy.work.model.dto.WorkSInfo;

public interface WorkService {

	Work selectWork(int empNo);

	void insertWork(int empNo);

	void updateWork(String wNo);

	void insertWorkStatus(WorkSInfo wsi);

	ArrayList<Work> selectWorkList(Work work);

}
