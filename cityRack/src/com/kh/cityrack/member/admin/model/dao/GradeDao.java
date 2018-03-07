package com.kh.cityrack.member.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;
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

}
