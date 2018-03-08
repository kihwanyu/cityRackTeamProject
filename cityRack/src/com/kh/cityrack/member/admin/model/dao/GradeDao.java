package com.kh.cityrack.member.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.member.admin.model.dto.Grade;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class GradeDao {
	Properties prop = null;
	
	public GradeDao() {
		prop = new Properties();
		String filePath = GradeDao.class.getResource("/sql/admin/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int gradeInsert(Connection conn, String gradeName, int gradeDiscount) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("gradeInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, gradeName);
			pstmt.setInt(2, gradeDiscount);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Grade> gradeGetAll(Connection conn) {
		ArrayList<Grade> list = null;
		Grade g = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("gradeGetAll");
		
		try{
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Grade>();
			
			while(rset.next()){
				g = new Grade();
				g.setGradeCode(rset.getInt("c_no"));
				g.setGradeName(rset.getString("c_name"));
				g.setGradeDiscount(rset.getInt("c_discount"));
				
				list.add(g);
			}
					
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
			
		
		
		return list;
	}

	public Grade gradeGet(Connection conn, int num) {
		Grade g = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("gradeGet");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				g = new Grade();
				g.setGradeCode(num);
				g.setGradeName(rset.getString("C_NAME"));
				g.setGradeDiscount(rset.getInt("C_DISCOUNT"));			
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return g;
	}

	public int gradeUpdate(Connection conn, Grade g) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("gradeUpdate");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getGradeName());
			pstmt.setInt(2, g.getGradeDiscount());
			pstmt.setInt(3, g.getGradeCode());
			
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int gradeDelete(Connection conn, int gradeCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("gradeDelete");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, gradeCode);
			
			result = pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

}
