package com.workie.easy.acct.model.service;

import java.util.ArrayList;

import com.workie.easy.acct.model.dto.Card;
import com.workie.easy.acct.model.dto.CardChart;
import com.workie.easy.acct.model.dto.CardData;
import com.workie.easy.common.model.dto.PageInfo;

public interface CardService {

	int cardStatListCount(String deptCode);

	ArrayList<Card> selectCardStatList(String deptCode, PageInfo pi);

	void insertCardStat(Card c);
	
	void insertCardStatOnly(Card c);

	Card selectCardStat(int statNo);

	void updateCardStat(Card c, String string);

	void deleteCardStat(int statNo);

	int searchStatCount(Card c);

	ArrayList<Card> searchStatList(Card c, PageInfo pi);

	Card selectCardInfo(String deptCode);

	CardData cardData(String deptCode);

	ArrayList<CardChart> cardChart(String deptCode);

}
