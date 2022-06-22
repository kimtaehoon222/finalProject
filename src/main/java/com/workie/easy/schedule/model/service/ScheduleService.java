package com.workie.easy.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.workie.easy.common.model.dto.PageInfo;
import com.workie.easy.schedule.model.dto.Schedule;

public interface ScheduleService {

	ArrayList<Schedule> selectScheduleList(Schedule sked);

	Schedule selectSchedule(Schedule sked);

	void insertSchedule(Schedule sked);

	void updateSchedule(Schedule sked);

	void deleteSchedule(String skedNo);

	ArrayList<Schedule> searchScheduleList(Map<String, Object> hash, PageInfo pi);

	int selectListCount(Map<String, Object> hash);

}
