package com.kupid.faq.model.dao;

import static com.kupid.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kupid.faq.model.dto.FaqDto;



public class FaqDao {
	private Properties sql=new Properties();
	
	{
		String path=FaqDao.class.getResource("/sql/sql_faq.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
	    }
	}	
		
		public List<FaqDto> selectFaqAll(Connection conn,int cPage,int numberpage){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<FaqDto> faq=new ArrayList<FaqDto>();
			try {
				pstmt=conn.prepareStatement(sql.getProperty("selectFaqAll"));
				pstmt.setInt(1,(cPage-1)*numberpage+1);
				pstmt.setInt(2, cPage*numberpage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					faq.add(getFaq(rs));
					}
				}catch(SQLException e) {
					e.printStackTrace();
				}finally {
					close(rs);
					close(pstmt);
				}
				return faq;
			}
		
		public int selectFaqAllCount(Connection conn) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(sql.getProperty("selectFaqAllCount"));
				rs=pstmt.executeQuery();
				if(rs.next()) result=rs.getInt(1);
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
		
		public List<FaqDto> selectFaqByCategory(Connection conn, String category, String keyword, int cPage, int numPerPage) {
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<FaqDto> faqList = new ArrayList<>();
	        String query = sql.getProperty("selectFaqByCategory");
	        
	        try {
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, category);
	            pstmt.setString(2, "%" + keyword + "%");
	            pstmt.setInt(3, (cPage - 1) * numPerPage + 1);
	            pstmt.setInt(4, cPage * numPerPage);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                faqList.add(getFaq(rs));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        return faqList;
	    }
			
			public static FaqDto getFaq(ResultSet rs) throws SQLException{
				return FaqDto.builder()
	            .faqNo(rs.getInt("FAQ_NO"))
	            .faqTitle(rs.getString("FAQ_TITLE"))
	            .faqContent(rs.getString("FAQ_CONTENT"))
	            .faqCategory(rs.getString("FAQ_CATEGORY"))
	            .faqDate(rs.getDate("FAQ_DATE"))
	            .build();
			}


		}
    

