package com.kh.cityrack.product.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.cityrack.member.user.model.dto.Member;
import com.kh.cityrack.product.user.model.dao.CartDao;
import com.kh.cityrack.product.user.model.dto.Cart;
import com.kh.cityrack.product.user.model.dto.Product;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class CartService {

	public HashMap<String, ArrayList<Cart>> selectCart() {
		Connection con = getConnection();
		HashMap<String, ArrayList<Cart>> hmap  = new CartDao().selectCart(con);
		
		close(con);
		
		return hmap;
		
	}
	
	
	// 카트에 시그니처 도시락 담기
	public int insertCart(Map map, Member m ) {
		int result = 0;
		Connection con = getConnection();
		
		result = new CartDao().insertCart(map, con, m);
		
		close(con);
		return result;
	}

}
