package com.kh.cityrack.product.admin.model.service;

import java.sql.Connection;
import java.sql.Date;
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

	public int getListCount() {
		
		Connection conn = getConnection();
		
		int result = new StockDao().stockGetList(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Stock> stockGetAll(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Stock> slist = new StockDao().stockGetAll(conn, currentPage, limit);
		
		close(conn);
		
		return slist;
	}

	public int getDetailListCount(String pcode) {
		Connection conn = getConnection();
		
		int result = new StockDao().getDetailListCount(conn, pcode);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Stock> stockDetailListGetAll(int currentPage, int limit, String pcode) {
		Connection conn = getConnection();
		
		ArrayList<Stock> slist = new StockDao().stockDetailListGetAll(conn ,currentPage, limit, pcode);
		
		close(conn);
		
		return slist;
	}

	public int stockGetAmountSum(String pcode, String division) {
		Connection conn = getConnection();
		int result = new StockDao().stockGetAmountSum(conn, pcode, division);
		
		close(conn);
		
		return result;
	}

	public int getSearchListCount(String searchText) {
		Connection conn = getConnection();
		
		int result = new StockDao().stockSearchListCount(conn ,searchText);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Stock> getStockSearchList(int currentPage, int limit, String searchCondition ,String searchText, String order) {
		Connection conn = getConnection();
		
		ArrayList<Stock> slist = new StockDao().getStockSearchList(conn, currentPage, limit,searchCondition, searchText, order);
		
		close(conn);
		
		return slist;
	}

	public int getDetailSearchListCount(Date beforeDate, Date afterDate, String pcode) {
		Connection conn = getConnection();
		
		int result = new StockDao().getDetailSearchListCount(conn, beforeDate, afterDate, pcode);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Stock> getStockSearchList(int currentPage, int limit, Date beforeDate, Date afterDate,
			String order, String pcode) {
		Connection conn = getConnection();
		
		ArrayList<Stock> sList = new StockDao().getStockSearchList(conn, currentPage, limit, beforeDate, afterDate, order, pcode);
		
		close(conn);
		
		return sList;
	}

	public int stockSearchGetAmountSum(String pcode ,Date beforeDate, Date afterDate, String division) {
		Connection conn = getConnection();
		int result = new StockDao().stockGetAmountSum(conn, pcode, beforeDate, afterDate, division);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Stock> StockTodayList(String standard) {
		Connection conn = getConnection();
		
		ArrayList<Stock> stodayList = new StockDao().getStockTodayList(conn, standard);
		
		close(conn);
		
		return stodayList;
	}


	

}
