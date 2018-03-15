package com.kh.cityrack.order.user.model.service;

import com.kh.cityrack.order.user.model.dao.PaymentDao;
import com.kh.cityrack.order.user.model.dto.Payment;
import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
public class PaymentService {

	public int paymentInsert(Payment p) {
		Connection conn = getConnection();
		
		int result = new PaymentDao().paymentInsert(conn, p);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int payCodeGet() {
		Connection conn = getConnection();
		
		int result = new PaymentDao().payCodeGet(conn);
		
		close(conn);
		return result;
	}

}
