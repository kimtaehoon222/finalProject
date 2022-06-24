package com.workie.easy.chart.model.service;

import java.util.ArrayList;

import com.workie.easy.chart.model.dto.ChartForAccount;
import com.workie.easy.chart.model.dto.ChartForMail;

public interface ChartService {

	ArrayList<ChartForMail> selectChartListForMail(ChartForMail chartForMail);

	ArrayList<ChartForMail> selectChartListForMailByMonth(ChartForMail chartForMail);

	ArrayList<ChartForMail> selectChartListForMailFrom(ChartForMail chartForMail);

	ArrayList<ChartForMail> selectChartListForMailByMonthFrom(ChartForMail chartForMail);

	ArrayList<ChartForAccount> selectSalaryChartListForAccount();

	ArrayList<ChartForAccount> selectSalaryChartListForAccountByDeptAll();

	ArrayList<ChartForAccount> selectSalaryChartListForAccountByDeptOne(ChartForAccount chartforAccount);

	ArrayList<ChartForAccount> selectSalaryChartListForAccountByJobAll();

	ArrayList<ChartForAccount> selectSalaryChartListForAccountByJobOne(ChartForAccount chartforAccount);

}
