package com.kh.cityrack.product.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.product.user.model.dao.ProductDao;
import com.kh.cityrack.product.user.model.dto.Product;
import static com.kh.cityrack.common.JDBCTemplet.*;
public class ProductService {

	public ArrayList<Product> selectAllProduct() {
		Connection con = getConnection();
		
		ArrayList<Product> pList = new ProductDao().selectAllProduct(con);
		
		close(con) ;
		
		return pList;
	}

}
