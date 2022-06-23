package com.workie.easy.chart.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.workie.easy.chart.model.dto.ChartForMail;

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


}
