package com.kh.cityrack.product.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.product.admin.model.dao.PcategoryDao;
import com.kh.cityrack.product.user.model.dto.Product;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class ProductDao {
	
	private Properties prop = null;
	
	public ProductDao() {
		prop = new Properties();
		String fileName = ProductDao.class.getResource("/sql/user/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Product> selectAllProduct(Connection con) {
		ArrayList<Product> pList = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product p = null;
		
		String query = prop.getProperty("selectAllProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				p = new Product();
				
				p.setP_name(rset.getString("p_name"));
				p.setP_name(rset.getString("p_price"));
				p.setP_8constitution(rset.getString("p_8constitution"));
				
				pList.add(p);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		
		return pList;
	}

}
