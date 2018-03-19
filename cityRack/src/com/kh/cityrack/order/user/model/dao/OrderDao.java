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
import com.kh.cityrack.order.user.model.dto.Order;

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
	public int orderListCount(Connection conn, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = prop.getProperty("orderListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public ArrayList<Order> orderListGetAll(Connection conn, int mno, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Order> oList = null;
		
		String query = prop.getProperty("orderListGetAll");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, mno);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			oList = new ArrayList<Order>();
			
			while (rset.next()) {
				Order o = new Order();
				o.setO_ono(rset.getString("O_ONO"));
				o.setO_orderDate(rset.getDate("O_ORDERDATE"));
				o.setM_email(rset.getString("M_EMAIL"));
				o.setP_name(rset.getString("P_NAME"));
				o.setPa_amount(rset.getInt("AMOUNT"));
				o.setO_state(rset.getString("O_STATE"));
				o.setInvoice_no(rset.getString("D_INVOICE_NO"));
				oList.add(o);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return oList;
	}
	public ArrayList<Order> orderListGetPcount(Connection conn, int mno, int currentPage, int limit,
			ArrayList<Order> oList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String query = prop.getProperty("orderListGetPcount");
		System.out.println("oList : " + oList);
		
		try {
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, mno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			int i = 0;
			while(rset.next()) {
				oList.get(i).setpCount(rset.getInt("PCOUNT"));
				i++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return oList;
	}

}
