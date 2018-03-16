package com.kh.cityrack.order.user.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.cityrack.order.user.model.dao.StockDao;
import com.kh.cityrack.order.user.model.dto.Cart;
import com.kh.cityrack.order.user.model.dto.Stock;

import static com.kh.cityrack.common.JDBCTemplet.*;
public class StockService {

	public int StockInsert(ArrayList<Cart> cartList) {
		Connection conn = getConnection();
		
		Stock s = new Stock();
		s.setDivsion("출고");
		s.setNote("상품 판매");
		
		int result = 0;
		
		for(int i = 0; i < cartList.size(); i++){	
			s.setPcode(cartList.get(i).getPcode());
			s.setAmount(cartList.get(i).getCart_amount());
			int p_total = StockTotal(conn, s);
			if(p_total > -1){
				result = new StockDao().stockInsert(conn, s);
			} else {
				result = 0;
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
	static public int StockTotal(Connection conn, Stock s) {
	//public int StockTotal(String pcode, Stock s) {
		
		//int result = new StockDao().stockTotal(conn, pcode);
		int result = new StockDao().stockTotal(conn, s);
		
		if(s.getDivsion().equals("입고")){
			result += s.getAmount();
		} else {
			result -= s.getAmount();
		}
		
		return result;
	}
}
