package com.kh.cityrack.order.user.model.service;

import com.kh.cityrack.order.user.model.dao.DeliveryDao;
import com.kh.cityrack.order.user.model.dto.Delivery;
import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
public class DeliveryService {

	public int deliveryInsert(Delivery d) {
		Connection conn = getConnection();
		
		int result = new DeliveryDao().deliveryInsert(conn, d);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return result;
	}

	public int dcodeGet() {
		Connection conn = getConnection();
		
		int result = new DeliveryDao().dcodeGet(conn);
		
		close(conn);
		
		return result;
	}

}
