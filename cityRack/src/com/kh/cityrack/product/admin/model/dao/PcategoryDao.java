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

import com.kh.cityrack.product.admin.model.dto.Pcategory;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class PcategoryDao {
	private Properties prop = null;
	public PcategoryDao(){
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
	public int categoryInsert(Connection conn, String category_name) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("CategoryInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, category_name);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Pcategory> categoryGetAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Pcategory> cList = null;
		
		String query = prop.getProperty("categoryGetAll");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			cList = new ArrayList<Pcategory>();
			
			while (rset.next()) {
				cList.add(new Pcategory(String.valueOf(rset.getInt("CA_NO")), rset.getString("CA_NAME")));
				/*CA_NO
				CA_NAME*/
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return cList;
	}
	public int categoryUpdate(Connection conn, Pcategory pc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("categoryUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pc.getCa_name());
			pstmt.setInt(2, Integer.parseInt(pc.getCa_code()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	public int categoryDelete(Connection conn, String cano) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("categoryDelete");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cano);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
