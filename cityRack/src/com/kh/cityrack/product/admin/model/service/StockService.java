package com.kh.cityrack.product.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.product.admin.model.dao.StockDao;
import com.kh.cityrack.product.admin.model.dto.Stock;
import static com.kh.cityrack.common.JDBCTemplet.*;
public class StockService {

	public int StockInsert(Stock s) {
		Connection conn = getConnection();
			
		int result = new StockDao().stockInsert(conn, s);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int StockTotal(String pcode, Stock s) {
		Connection conn = getConnection();
		
		int result = new StockDao().stockTotal(conn, pcode);
		
		if(s.getDivsion().equals("입고")){
			result += s.getAmount();
		} else {
			result -= s.getAmount();
		}
		
		
		close(conn);
		
		return result;
	}

	public ArrayList<Stock> productGetAll(int currentPage, int limit) {
		return null;
	}

	public int getListCount() {
		
		return 0;
	}

}
