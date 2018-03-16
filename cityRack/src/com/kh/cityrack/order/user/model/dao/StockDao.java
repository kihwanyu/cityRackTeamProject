package com.kh.cityrack.order.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.order.user.model.dto.Cart;
import com.kh.cityrack.order.user.model.dto.Stock;


import static com.kh.cityrack.common.JDBCTemplet.*;
public class StockDao{
	private Properties prop = null;
	public StockDao(){
		//prop 객체 인스턴스화
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = StockDao.class.getResource("/sql/admin/product/product-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int stockInsert(Connection conn, Stock s) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		switch (s.getDivsion()) {
		case "입고":
			query = prop.getProperty("warehousingResister");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, s.getDivsion());
				pstmt.setString(2, s.getPcode());
				pstmt.setDate(3, s.getSelflife());
				pstmt.setInt(4, s.getAmount());
				pstmt.setString(5, s.getNote());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}	
			break;
		default:
			query = prop.getProperty("releaseResister");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, s.getDivsion());
				pstmt.setString(2, s.getPcode());
				pstmt.setInt(3, s.getAmount());
				pstmt.setString(4, s.getNote());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}	
			break;
		}	
		return result;
	}

	public int stockTotal(Connection conn, Stock s) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		ArrayList<String> division = new ArrayList<>();
		division.add("입고");
		division.add("출고");
		
		String query = prop.getProperty("getstockTotalValue");
		
		for(int i = 0 ; i < division.size(); i++){
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, s.getPcode());
				pstmt.setString(2, division.get(i));
				
				rset = pstmt.executeQuery();
				
				if(rset.next()){
					if(result != 0){
						result -= rset.getInt(1);
					} else {
						result += rset.getInt(1);
					}
				}			
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);			
			}
		}
		
		return result;
	}

}