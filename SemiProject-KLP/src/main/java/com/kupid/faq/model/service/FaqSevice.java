package com.kupid.faq.model.service;


import static com.kupid.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import com.kupid.faq.model.dto.FaqDto;
import com.kupid.faq.model.dao.FaqDao;

import static com.kupid.common.JDBCTemplate.close;


public class FaqSevice {
	
	public FaqDao faqDao=new FaqDao();
	
	
	public List<FaqDto> selectFaqAll(int cPage,int numberpage){
		Connection conn=getConnection();
		List<FaqDto> faq = faqDao.selectFaqAll(conn, cPage, numberpage);
		close(conn);
		return faq;
		}
	}
