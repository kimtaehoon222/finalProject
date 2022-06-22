package com.workie.easy.chat.model.service;

import java.util.ArrayList;

import com.workie.easy.chat.model.dto.Contect;
import com.workie.easy.mail.model.dto.Department;

public interface ChatService {

	ArrayList<Department> selectDeptList();

	ArrayList<Contect> selectEmpList(String deptName);

}
