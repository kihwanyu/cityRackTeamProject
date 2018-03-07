package com.kh.cityrack.product.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.product.admin.model.dto.Product;
import static com.kh.cityrack.common.JDBCTemplet.*;
public class ProductDao {
	private Properties prop = null;
	public ProductDao(){
		//prop 객체 인스턴스화
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = PcategoryDao.class.getResource("/sql/admin/product/product-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int productInsert(Connection conn, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("productInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(p.getCa_code()));
			pstmt.setString(2, p.getP_8constitution());
			pstmt.setString(3, p.getP_name());
			pstmt.setInt(4, p.getP_price());
			pstmt.setString(5, p.getP_event());
			pstmt.setDouble(6, p.getP_discount());
			pstmt.setString(7, p.getP_pic1());
			pstmt.setString(8, p.getP_pic2());
			pstmt.setString(9, p.getP_status());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Product> productGetAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> pList = null;
		
		String query = prop.getProperty("productGetAll");
		
		return pList;
	}

}
