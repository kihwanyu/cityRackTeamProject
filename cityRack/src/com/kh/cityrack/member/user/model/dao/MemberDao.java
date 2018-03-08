package com.kh.cityrack.member.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.cityrack.member.user.model.dto.Member;

import static com.kh.cityrack.common.JDBCTemplet.*; 

public class MemberDao {
	
	private Properties prop; 
	
	public MemberDao() {
		/*String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();		
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		*/
	}

	
	
	
	// 회원 가입
	public int insertMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into member values(mno.nextval, 100, ?,?,?,?,?,?,?,?,sysdate,default)";
		/*String query = prop.getProperty("insertMember");*/
		
				/*M_NO
				C_NO
				M_EMAIL
				M_PASSWORD
				M_NAME
				M_GENDER
				M_BIRTHDAY
				M_ADDRESS
				M_TEL
				M_PHONE
				M_ENROLL_DATE
				M_STATUS*/
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getM_mail());
			pstmt.setString(2, m.getM_password());
			pstmt.setString(3, m.getM_name());
			pstmt.setString(4, m.getM_gender());
			pstmt.setDate(5, m.getM_birthDay());
			pstmt.setString(6, m.getM_address());
			pstmt.setString(7, m.getM_tel());
			pstmt.setString(8, m.getM_phone());
			
			
			
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
