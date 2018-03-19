package com.kh.cityrack.delivery.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.delivery.model.dto.Delivery;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class DeliveryDao {
	Properties prop = null;
	
	public DeliveryDao() {
		prop = new Properties();
		String filePath = DeliveryDao.class.getResource("/sql/admin/delivery/delivery-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Delivery deliverySearch(Connection conn, String orderCode) {
		Delivery d = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("deliverySearch");
		System.out.println("query : " + query);
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, orderCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				d = new Delivery();
				d.setD_no(rset.getInt("d_no"));
				d.setD_invoice_no(rset.getString("d_invoice_no"));
				d.setD_addr_name(rset.getString("d_addr_name"));
				d.setD_addr_tel(rset.getString("d_addr_tel"));
				d.setD_addr_phone(rset.getString("d_addr_phone"));
				d.setD_addr_address(rset.getString("d_addr_address"));
				d.setD_addr_msg(rset.getString("d_addr_msg"));
			}
			
			System.out.println("d : " + d);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		
				
		return d;
	}

	public int deliveryUpdate(Delivery d, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deliveryUpdate");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getD_addr_name());
			pstmt.setString(2, d.getD_addr_tel());
			pstmt.setString(3, d.getD_addr_phone());
			pstmt.setString(4, d.getD_addr_address());
			pstmt.setString(5, d.getD_addr_msg());
			pstmt.setString(6, d.getD_invoice_no());
			pstmt.setInt(7, d.getD_no());
			
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

}
