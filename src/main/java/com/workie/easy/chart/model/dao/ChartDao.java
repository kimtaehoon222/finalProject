package com.workie.easy.chart.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.workie.easy.chart.model.dto.ChartForAccount;
import com.workie.easy.chart.model.dto.ChartForMail;
import com.workie.easy.chart.model.dto.ChartForPersonnel;

/*
* <pre>
* Class : ChartDao
* Comment : DB에 접근하는 클래스
* 
* History
* 2022/06/22 (김지수) 
* 
* 
* </pre>
* @version 1.0(클래스의 버전)
* @author 김지수
* @see ChartService, chart-mapper.xml
*
*/
@Repository
public class ChartDao {

	public ArrayList<ChartForMail> selectChartListForMail(SqlSession sqlSession, ChartForMail chartForMail) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForMail", chartForMail);
	}

	public ArrayList<ChartForMail> selectChartListForMailByMonth(SqlSession sqlSession, ChartForMail chartForMail) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForMailByMonth", chartForMail);
	}

	public ArrayList<ChartForMail> selectChartListForMailFrom(SqlSession sqlSession, ChartForMail chartForMail) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForMailFrom", chartForMail);
	}

	public ArrayList<ChartForMail> selectChartListForMailByMonthFrom(SqlSession sqlSession, ChartForMail chartForMail) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForMailByMonthFrom", chartForMail);
	}

	public ArrayList<ChartForAccount> selectSalaryChartListForAccount(SqlSession sqlSession) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectSalaryChartListForAccount");
	}

	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByDeptAll(SqlSession sqlSession) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectSalaryChartListForAccountByDeptAll");
	}

	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByDeptOne(SqlSession sqlSession,
			ChartForAccount chartforAccount) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectSalaryChartListForAccountByDeptOne", chartforAccount);
	}

	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByJobAll(SqlSession sqlSession) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectSalaryChartListForAccountByJobAll");
	}

	public ArrayList<ChartForAccount> selectSalaryChartListForAccountByJobOne(SqlSession sqlSession,
			ChartForAccount chartforAccount) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectSalaryChartListForAccountByJobOne", chartforAccount);
	}

	public ArrayList<ChartForPersonnel> selectChartListForPersonnelIn(SqlSession sqlSession,
			ChartForPersonnel chartForPersonnel) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForPersonnelIn", chartForPersonnel);
	}

	public ArrayList<ChartForPersonnel> selectChartListForPersonnelInByMonth(SqlSession sqlSession,
			ChartForPersonnel chartForPersonnel) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForPersonnelInByMonth", chartForPersonnel);
	}

	public ArrayList<ChartForPersonnel> selectChartListForPersonnelOut(SqlSession sqlSession,
			ChartForPersonnel chartForPersonnel) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForPersonnelOut", chartForPersonnel);
	}

	public ArrayList<ChartForPersonnel> selectChartListForPersonnelOutByMonth(SqlSession sqlSession,
			ChartForPersonnel chartForPersonnel) {

		return (ArrayList)sqlSession.selectList("chartMapper.selectChartListForPersonnelOutByMonth", chartForPersonnel);
	}


}
