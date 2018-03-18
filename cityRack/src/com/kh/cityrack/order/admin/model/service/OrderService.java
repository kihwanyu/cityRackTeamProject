package com.kh.cityrack.order.admin.model.service;

import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.order.admin.model.dao.OrderDao;
import com.kh.cityrack.order.admin.model.dto.Order;
import com.kh.cityrack.order.admin.model.dto.OrderSearch;
import com.kh.cityrack.order.admin.model.dto.Product;


public class OrderService {

	public int orderListCount() {
		Connection conn = getConnection();
		
		int result = new OrderDao().orderListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Order> orderListGetAll(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Order> olist = new OrderDao().orderListGetAll(conn, currentPage, limit);

		close(conn);
		
		return olist;
	}

	public int getListSearchCount(OrderSearch oSearch, String[] searchTypeArr, String orderType) {
		Connection conn = getConnection();

		int result = new OrderDao().orderSearchListCount(conn, oSearch, searchTypeArr, orderType);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Order> orderListSearchGetAll(int currentPage, int limit, OrderSearch oSearch,
			String[] searchTypeArr, String orderType) {
		Connection conn = getConnection();
		
		ArrayList<Order> oList = new OrderDao().orderListSearchGetAll(conn, currentPage, limit, oSearch, searchTypeArr, orderType);
		
		close(conn);
		
		return oList;
	}

	public Order orderDetailGet(String ono) {
		Connection conn = getConnection();
		
		Order o = new OrderDao().orderDetailGet(conn, ono);
		
		close(conn);
		
		return o;
	}

	public ArrayList<Product> orderProductGetAll(String ono) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> pList = new OrderDao().orderProductGetAll(conn, ono);
		
		close(conn);
		
		return pList;
	}

	public ArrayList<Order> orderListGetPcount(int currentPage, int limit, ArrayList<Order> oList) {
		//
		Connection conn = getConnection();
		
		oList = new OrderDao().orderListGetPcount(conn, currentPage, limit, oList);
		
		close(conn);
		
		return oList;
	}

	public ArrayList<Order> orderListSearchGetPcount(int currentPage, int limit, OrderSearch oSearch,
			String[] searchTypeArr, String orderType, ArrayList<Order> oList) {
		
		Connection conn = getConnection();
		
		oList = new OrderDao().orderListSearchGetPcount(conn, currentPage, limit, oSearch, searchTypeArr, orderType, oList);
		
		close(conn);
		
		return oList;
	}

	public int getOrderStatusUpdate(String ono, String status) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().getOrderStatusUpdate(conn ,ono ,status);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
