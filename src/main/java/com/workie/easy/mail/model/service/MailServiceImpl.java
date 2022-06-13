package com.workie.easy.mail.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workie.easy.mail.model.dao.MailDao;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MailDao mailDao;
}
