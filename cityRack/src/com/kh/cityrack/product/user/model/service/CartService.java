package com.kh.cityrack.product.user.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import com.kh.cityrack.product.user.model.dao.CartDao;
import com.kh.cityrack.product.user.model.dto.Product;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class CartService {

	public HashMap<Product, Integer> selectCart() {
		Connection con = getConnection();
		HashMap<Product, Integer> hmap = new CartDao().selectCart(con);
		
		return hmap;
		
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
