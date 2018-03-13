package com.kh.cityrack.product.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class CartDao {
	private Properties prop = new Properties();
	
	public CartDao() {
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
			String fileName = PcategoryDao.class.getResource("/sql/user/product/product-query.properties").getPath();
					
			try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
			} catch (IOException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	
	
	// 장바구니에 물건 담기 
	public int insertCart(Map m, Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertCart");
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return result;
	}

}
