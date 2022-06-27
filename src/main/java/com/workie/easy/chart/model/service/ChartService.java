package com.workie.easy.chart.model.service;

import java.util.ArrayList;

import com.workie.easy.chart.model.dto.ChartForAccount;
import com.workie.easy.chart.model.dto.ChartForMail;
import com.workie.easy.chart.model.dto.ChartForPersonnel;

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

	ArrayList<ChartForPersonnel> selectChartListForPersonnelIn(ChartForPersonnel chartForPersonnel);

	ArrayList<ChartForPersonnel> selectChartListForPersonnelInByMonth(ChartForPersonnel chartForPersonnel);

	ArrayList<ChartForPersonnel> selectChartListForPersonnelOut(ChartForPersonnel chartForPersonnel);

	ArrayList<ChartForPersonnel> selectChartListForPersonnelOutByMonth(ChartForPersonnel chartForPersonnel);

}
