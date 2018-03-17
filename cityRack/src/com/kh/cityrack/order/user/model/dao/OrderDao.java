package com.kh.cityrack.order.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.cityrack.order.user.model.dto.Cart;
import static com.kh.cityrack.common.JDBCTemplet.*;
public class OrderDao {
	private Properties prop = null;
	public OrderDao(){
		//prop 객체 인스턴스화
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = OrderDao.class.getResource("/sql/user/order/order-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int orderInsert(Connection conn, String ono, int mno ,int dcode, int paycode, int level, Cart cart) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("orderInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ono);
			pstmt.setInt(2, mno);
			pstmt.setInt(3, dcode);
			pstmt.setInt(4, paycode);
			pstmt.setInt(5, level);
			pstmt.setString(6,cart.getPcode());
			pstmt.setInt(7, cart.getCart_amount());
			//
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
