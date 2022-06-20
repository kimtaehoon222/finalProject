package com.workie.easy.schedule.model.service;

import java.util.ArrayList;

import com.workie.easy.schedule.model.dto.Schedule;

public interface ScheduleService {

	ArrayList<Schedule> selectScheduleList(Schedule sked);

	Schedule selectSchedule(Schedule sked);

	void insertSchedule(Schedule sked);

	void updateSchedule(Schedule sked);

	void deleteSchedule(String skedNo);

}
