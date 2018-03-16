package com.kh.cityrack.order.user.model.service;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.kh.cityrack.order.user.model.dao.OrderDao;
import com.kh.cityrack.order.user.model.dto.Cart;

import static com.kh.cityrack.common.JDBCTemplet.*;
public class OrderService {

	public int orderInsert(int mno, int dcode, int paycode, ArrayList<Cart> cartList) {
		ArrayList<Integer> resultList = new ArrayList<Integer>();
		Connection conn = getConnection();
		int result = 0;
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNum = (int)(Math.random() * 10000);
		
		String ono = ft.format(currentTime) +""+randomNum;
		
		for(int i = 0; i < cartList.size(); i++){
			resultList.add(new OrderDao().orderInsert(conn, Integer.valueOf(ono), mno, dcode, paycode ,cartList.get(i)));
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

}
