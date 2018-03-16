package com.kh.cityrack.order.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.order.user.model.dto.Cart;

import static com.kh.cityrack.common.JDBCTemplet.*;
public class CartDao {
	private Properties prop = null;
	public CartDao(){
		//prop 객체 인스턴스화
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = OrderDao.class.getResource("/sql/user/cart/cart-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Cart> memberCartListGetAll(Connection conn, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("memberCartPcodeGetAll");
		
		ArrayList<Cart> cartList = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			cartList = new ArrayList<Cart>();
			
			while(rset.next()){
				Cart c = new Cart();
				c.setPcode(rset.getString("P_CODE"));
				c.setCart_amount(rset.getInt("CART_AMOUNT"));
				
				cartList.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cartList;
	}
	public int memberCarListDelteAll(Connection conn, int mno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("memberCartDeleteAll");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mno);
			
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
