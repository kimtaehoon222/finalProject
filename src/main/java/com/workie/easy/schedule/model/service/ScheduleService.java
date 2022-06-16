package com.workie.easy.schedule.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.workie.easy.schedule.model.dto.Schedule;

public interface ScheduleService {

	ArrayList<Schedule> scheduleList(int empNo);

	ArrayList<Schedule> scheduleList2();

}
