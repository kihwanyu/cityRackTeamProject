package com.kh.cityrack.order.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.order.user.model.dao.CartDao;
import com.kh.cityrack.order.user.model.dto.Cart;

import static com.kh.cityrack.common.JDBCTemplet.*;
public class CartService {

	public ArrayList<Cart> memberCartListGetAll(int mno) {
		Connection conn = getConnection();
		
		ArrayList<Cart> cartList = new CartDao().memberCartListGetAll(conn, mno);
		
		close(conn);
		
		return cartList;
	}

	public int memberCartDeleteAll(int mno) {
		Connection conn = getConnection();
		
		int result = new CartDao().memberCarListDelteAll(conn, mno);
		
		close(conn);
		
		return result;
	}

}
