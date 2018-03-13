package com.kh.cityrack.product.user.model.service;

import java.sql.Connection;
import java.util.Map;

import com.kh.cityrack.product.user.model.dao.CartDao;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class CartService {

	public void selectCar() {
		
	}
	
	
	// 카트에 시그니처 도시락 담기
	public int insertCart(Map m) {
		int result = 0;
		Connection con = getConnection();
		
		result = new CartDao().insertCart(m, con);
		
		close(con);
		return result;
	}

}
