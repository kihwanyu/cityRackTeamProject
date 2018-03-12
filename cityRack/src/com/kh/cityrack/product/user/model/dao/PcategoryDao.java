package com.kh.cityrack.product.user.model.dao;

import java.io.Closeable;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.cityrack.common.JDBCTemplet.*;


import com.kh.cityrack.product.user.model.dto.Pcategory;

public class PcategoryDao {
	private Properties prop = null;
	public PcategoryDao() {
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
	
	public ArrayList<Pcategory> selectAllCategory(Connection con) {
		
		ArrayList<Pcategory> cList = new ArrayList<Pcategory>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Pcategory cat = null;
		
		String query = prop.getProperty("selectAllCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cat = new Pcategory();
				
				cat.setCa_code(String.valueOf(rset.getInt("ca_no")));
				cat.setCa_name(rset.getString("ca_name"));
				
				cList.add(cat);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		 
		
		return cList;
	}

}
