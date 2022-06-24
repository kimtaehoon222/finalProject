package com.workie.easy.chart.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.chart.model.dao.ChartDao;
import com.workie.easy.chart.model.dto.ChartForAccount;
import com.workie.easy.chart.model.dto.ChartForMail;

/*
* <pre>
* Class : ChartServiceImpl
* Comment : ChartController에서 DB에 반영할 데이터를 전달받고, sqlSession 객체를 Dao에 전달하는 클래스
* 
* History
* 2022/06/22 (김지수) 
* 
* 
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see ChartController, ChartDao
*
*/
@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChartDao chartDao;

	@Override
	public ArrayList<ChartForMail> selectChartListForMail(ChartForMail chartForMail) {

		return chartDao.selectChartListForMail(sqlSession, chartForMail);
	}

	@Override
	public ArrayList<ChartForMail> selectChartListForMailByMonth(ChartForMail chartForMail) {

		return chartDao.selectChartListForMailByMonth(sqlSession, chartForMail);
	}

	@Override
	public ArrayList<ChartForMail> selectChartListForMailFrom(ChartForMail chartForMail) {

		return chartDao.selectChartListForMailFrom(sqlSession, chartForMail);
	}

	@Override
	public ArrayList<ChartForMail> selectChartListForMailByMonthFrom(ChartForMail chartForMail) {

		return chartDao.selectChartListForMailByMonthFrom(sqlSession, chartForMail);
	}

	@Override
	public ArrayList<ChartForAccount> selectSalaryChartListForAccount() {

		return chartDao.selectSalaryChartListForAccount(sqlSession);
	}

	@Override
	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByDeptAll() {

		return chartDao.selectSalaryChartListForAccountByDeptAll(sqlSession);
	}

	@Override
	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByDeptOne(ChartForAccount chartforAccount) {
		
		return chartDao.selectSalaryChartListForAccountByDeptOne(sqlSession, chartforAccount);
	}

	@Override
	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByJobAll() {

		return chartDao.selectSalaryChartListForAccountByJobAll(sqlSession);
	}

	@Override
	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByJobOne(ChartForAccount chartforAccount) {

		return chartDao.selectSalaryChartListForAccountByJobOne(sqlSession, chartforAccount);
	}


	
}
