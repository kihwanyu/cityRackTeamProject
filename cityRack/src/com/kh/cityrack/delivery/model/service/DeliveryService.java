package com.kh.cityrack.delivery.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.delivery.model.dao.DeliveryDao;
import com.kh.cityrack.delivery.model.dto.Delivery;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class DeliveryService {

	public Delivery deliverySearch(int orderCode) {
		Connection conn = getConnection();
		Delivery d = new DeliveryDao().deliverySearch(conn, orderCode);
		
		close(conn);
		return d;
	}

	public int deliveryUpdate(Delivery d) {
		Connection conn = getConnection();
		
		int result = new DeliveryDao().deliveryUpdate(d, conn);
		
		if(result > 0){
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
