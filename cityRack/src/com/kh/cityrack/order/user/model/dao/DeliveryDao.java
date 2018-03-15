package com.kh.cityrack.order.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.cityrack.order.admin.model.dao.OrderDao;
import com.kh.cityrack.order.user.model.dto.Delivery;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class DeliveryDao {
	private Properties prop = null;
	public DeliveryDao(){
		//prop 객체 인스턴스화
				prop = new Properties();
				
				//fileName에 member-query.properties 파일의 위치를 넣어준다.
				String fileName = OrderDao.class.getResource("/sql/user/delivery/delivery-query.properties").getPath();
				
				try {
					//prop객체에 member-query.properties 파일위치를 넣어준다.
					prop.load(new FileReader(fileName));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
	public int deliveryInsert(Connection conn, Delivery d) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deliveryInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, d.getD_addrName());
			pstmt.setString(2, d.getD_addrTel());
			pstmt.setString(3, d.getD_addrPhone());
			pstmt.setString(4, d.getD_addrAddress());
			pstmt.setString(5, d.getD_addrMSg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int dcodeGet(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("dcodeGet");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

}
