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
import com.kh.cityrack.order.user.model.dto.Payment;
import static com.kh.cityrack.common.JDBCTemplet.*;
public class PaymentDao {
	private Properties prop = null;
	
	public PaymentDao(){
		//prop 객체 인스턴스화
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = OrderDao.class.getResource("/sql/user/payment/payment-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int paymentInsert(Connection conn, Payment p) {
		PreparedStatement pstmt = null;

		int result = 0;
		String query = prop.getProperty("paymentInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPg());
			pstmt.setString(2, p.getPay_method());
			pstmt.setString(3, p.getMerchant_uid());
			pstmt.setString(4, p.getName());
			pstmt.setString(5, p.getBuyer_name());
			pstmt.setString(6, p.getBuyer_tel());
			pstmt.setString(7, p.getBuyer_addr());
			pstmt.setString(8, p.getBuyer_postcode());
			pstmt.setString(9, p.getPay_imp_uid());
			pstmt.setInt(10, p.getAmount());
			pstmt.setString(11, p.getPay_apply_num());
			pstmt.setString(12, p.getbuyer_email());
			pstmt.setString(13, "결제 완료");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int payCodeGet(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("payCodeGet");
		
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
