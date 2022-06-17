package com.workie.easy.schedule.model.service;

import java.util.ArrayList;

import com.workie.easy.schedule.model.dto.Schedule;

public interface ScheduleService {

	ArrayList<Schedule> scheduleList(Schedule sked);

	ArrayList<Schedule> scheduleList2();

}
