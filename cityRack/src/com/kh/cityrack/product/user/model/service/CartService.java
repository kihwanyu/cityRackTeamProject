package com.kh.cityrack.product.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.product.user.model.dao.CartDao;
import com.kh.cityrack.product.user.model.dto.Cart;
import com.kh.cityrack.product.user.model.dto.Product;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class CartService {

	public ArrayList<Cart> selectCart(Member m) {
		Connection con = getConnection();
		ArrayList<Cart> c  = new CartDao().selectCart(con, m);
		
		close(con);
		
		return c;
		
	}
	
	
	// 카트에 시그니처 도시락 담기
	public int insertCart(Map foodname, Member m ) {
		int result = 0;
		Connection con = getConnection();
		
		result = new CartDao().insertCart(foodname, con, m);
		
		close(con);
		return result;
	}


	// 카트에 물품 삭제
	public int deleteCart(String[] list, Member m) {
		Connection con = getConnection();
		int result = new CartDao().deleteCart(list, m, con);
		close(con);
		return result ;
	}


	// 카트 물품 수정
	public int updateCart(Member m, ArrayList<Cart> cartList) {
		Connection con = getConnection();
		int result = new CartDao().updateCart(cartList, m, con);
		
		close(con);
		
		return result;
	}

}
