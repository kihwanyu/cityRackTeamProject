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

	public ArrayList<Product> productGetAll() {
		Connection conn = getConnection();
		
		ArrayList<Product> pList = new ProductDao().productGetAll(conn);
		
		close(conn);
		
		return pList;
	}

}
