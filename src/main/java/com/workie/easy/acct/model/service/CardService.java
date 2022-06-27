package com.workie.easy.acct.model.service;

import java.util.ArrayList;

import com.workie.easy.acct.model.dto.Card;
import com.workie.easy.common.model.dto.PageInfo;

public interface CardService {

	int cardStatListCount(String deptCode);

	ArrayList<Card> selectCardStatList(String deptCode, PageInfo pi);

	void insertCardStat(Card c);

	Card selectCardStat(int statNo);

	void updateCardStat(Card c, String string);

}
