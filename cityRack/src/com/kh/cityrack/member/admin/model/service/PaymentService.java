package com.kh.cityrack.member.admin.model.service;

import java.sql.Connection;

import com.kh.cityrack.member.admin.model.dao.PaymentDao;
import com.kh.cityrack.member.admin.model.dto.Payment;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class PaymentService {

	public Payment paymentGetAll(String orderCode) {
		Connection conn = getConnection();
		
	    Payment p = new PaymentDao().paymentGetAll(conn, orderCode);
	    
	    close(conn);
		return p;
	}

	public int paymentUpdate(String status, String orderCode) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().paymentUpdate(conn, status, orderCode);
		
		if(result > 0){
			commit(conn);
		}else{
			rollback(conn);
		}
		
		return result;
	}

}
