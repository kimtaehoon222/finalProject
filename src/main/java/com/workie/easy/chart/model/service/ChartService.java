package com.workie.easy.chart.model.service;

import java.util.ArrayList;

import com.workie.easy.chart.model.dto.ChartForMail;

public interface ChartService {

	ArrayList<ChartForMail> selectChartListForMail(ChartForMail chartForMail);


}