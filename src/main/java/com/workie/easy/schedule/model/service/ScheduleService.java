package com.workie.easy.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.workie.easy.schedule.model.dto.Schedule;

public interface ScheduleService {

	List<Map<String, Schedule>> scheduleList();

	List<Schedule> scheduleList2();

}
