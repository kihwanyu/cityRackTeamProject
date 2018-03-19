package com.kh.cityrack.order.user.model.service;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.kh.cityrack.order.user.model.dao.OrderDao;
import com.kh.cityrack.order.user.model.dto.Cart;
import com.kh.cityrack.order.user.model.dto.Order;

import static com.kh.cityrack.common.JDBCTemplet.*;
public class OrderService {

	public int orderInsert(int mno, int dcode, int paycode, ArrayList<Cart> cartList) {
		ArrayList<Integer> resultList = new ArrayList<Integer>();
		Connection conn = getConnection();
		int result = 1;
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNum = (int)(Math.random() * 10000);
		
		String ono = ft.format(currentTime) +""+randomNum;
		//
		for(int i = 0; i < cartList.size(); i++){
			if(i > 0){
				resultList.add(new OrderDao().orderInsert(conn, ono, mno, dcode, paycode, 0,cartList.get(i)));
			} else {
				resultList.add(new OrderDao().orderInsert(conn, ono, mno, dcode, paycode, 1,cartList.get(i)));
			}
		}
		
		for(int i = 0; i < resultList.size(); i++){
			if(resultList.get(i) <= 0){
				result = -1;
				break;
			} 
		}
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
				
		return result;
	}

	public ArrayList<Order> orderListGetAll(int mno, int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Order> oList = new OrderDao().orderListGetAll(conn, mno, currentPage, limit);
		
		close(conn);
		
		return oList;
	}

	public int orderListCount(int mno) {
		Connection conn = getConnection();
		
		int result = new OrderDao().orderListCount(conn, mno);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Order> orderListGetPcount(int mno, int currentPage, int limit, ArrayList<Order> oList) {
		Connection conn = getConnection();
		
		oList = new OrderDao().orderListGetPcount(conn, mno, currentPage, limit, oList);
		
		close(conn);
		/**/
		return oList;
	}

}
