package com.kh.cityrack.member.admin.model.dao;

import com.kh.cityrack.member.admin.model.dto.Payment;
import static com.kh.cityrack.common.JDBCTemplet.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class PaymentDao {
Properties prop = null;
	
	public PaymentDao() {
		prop = new Properties();
		String filePath = GradeDao.class.getResource("/sql/admin/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Payment paymentGetAll(Connection conn, String orderCode) {
        Payment p = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String query = prop.getProperty("paymentGetAll");
        
        try{
        	pstmt = conn.prepareStatement(query);
        	pstmt.setString(1, orderCode);
        	
        	rset = pstmt.executeQuery();
        	
        	if(rset.next()){
        		p = new Payment();
        		p.setAmount(rset.getInt("amount"));
        		p.setApplyNum(rset.getString("apply_num"));
        		p.setBuyerAddr(rset.getString("buyer_addr"));
        		p.setBuyerEmail(rset.getString("buyer_email"));
        		p.setBuyerName(rset.getString("buyer_name"));
        		p.setBuyerPostcode(rset.getString("buyer_postcode"));
        		p.setBuyerTel(rset.getString("buyer_tel"));
        		p.setImpUid(rset.getString("imp_uid"));
        		p.setMerchantUid(rset.getString("merchant_uid"));
        		p.setName(rset.getString("name"));
        		p.setNo(rset.getInt("no"));
        		p.setPayMethod(rset.getString("pay_method"));
        		p.setPg(rset.getString("pg"));
        		p.setStatus(rset.getString("status"));
        	}
        }catch(Exception e){
        	e.printStackTrace();
        }finally{
        	close(rset);
        	close(pstmt);
        }

		return p;
	}

	public int paymentUpdate(Connection conn, String status, String orderCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("paymentUpdate");
		
		System.out.println(status);
		System.out.println(orderCode);
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setString(2, orderCode);
			result = pstmt.executeUpdate();
			
			System.out.println("결과값 : " + result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

}
