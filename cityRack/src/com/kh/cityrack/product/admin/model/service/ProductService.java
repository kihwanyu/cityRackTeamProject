package com.kh.cityrack.product.admin.model.service;

import com.kh.cityrack.product.admin.model.dao.ProductDao;
import com.kh.cityrack.product.admin.model.dto.Product;

import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;
public class ProductService {

	public int productInsert(Product p) {
		Connection conn = getConnection();
		
		int result = new ProductDao().productInsert(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Product> productGetAll(int currentPage, int limit) {
		Connection conn = getConnection();
		
		ArrayList<Product> pList = new ProductDao().productGetAll(conn, currentPage, limit);
		
		close(conn);
		
		return pList;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new ProductDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public Product productGet(String pcode) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().productGet(conn, pcode);
		
		close(conn);
		
		return p;
	}

	public int productUpdate(Product p) {
		Connection conn = getConnection();
		
		int result = new ProductDao().productUpdate(conn, p);
		
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int productDelete(String pcode) {
		Connection conn = getConnection();
		
		int result = new ProductDao().productDelete(conn, pcode);
		
		if(result > 0){			
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
