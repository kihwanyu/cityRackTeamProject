package com.kh.cityrack.member.common.model.dao;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.common.model.dto.Withdraw;

import static com.kh.cityrack.common.JDBCTemplet.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class MemberDao {
	//Properties 객체 선언
	//member-query.propertie 파일을 읽어 오기 위해서.
	private Properties prop = null;
	public MemberDao(){
		//prop 객체 인스턴스화sdfasd
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = MemberDao.class.getResource("/sql/common/member/member-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Member login(Connection conn, Member m) {
		//PreparedStatement 객체 선언
		//ResultSet 객체 선언
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		//prop객체의 파일 위치에 있는 파일에서 key값이 login value값을 가져온다.
		String query = prop.getProperty("login");
		
		try {
			//Connection 객체를 통해 PreparedStatement객체를 인스턴스화 한다.
			pstmt = conn.prepareStatement(query);
			
			//PreparedStatement객체의 ?를 채워준다.
			pstmt.setString(1, m.getM_email());
			pstmt.setString(2, m.getM_password());
			
			//쿼리문의 결과를 ResultSet으로 받는다.
			rset = pstmt.executeQuery();
			
			//rset의 결과를 반복하여 객체에 저장한다. 아이디와 비밀번호가 일치하는 정보는 1개 밖에 없으므로 while문이아닌 if문으로 처리한다.
			if (rset.next()) {
				loginUser = new Member();
				loginUser.setM_no(rset.getInt("M_NO"));
				loginUser.setC_name(rset.getString("C_NAME"));
				loginUser.setM_email(rset.getString("M_EMAIL"));
				loginUser.setM_password(rset.getString("M_PASSWORD"));
				loginUser.setM_name(rset.getString("M_NAME"));
				loginUser.setM_gender(rset.getString("M_GENDER"));
				loginUser.setM_birthDay(rset.getDate("M_BIRTHDAY"));
				loginUser.setM_address(rset.getString("M_ADDRESS"));
				loginUser.setM_phone(rset.getString("M_PHONE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return loginUser;
	}
	
	// 회원탈퇴처리용
	public int deleteMember(Connection con, Withdraw w) {
		
		// PreparedStatement 객체 선언
		PreparedStatement pstmt = null;
		// result값 초기화
		int result = 0;
		
		//prop객체의 파일 위치에 있는 파일에서 key값이 deleteMember value값을 가져온다.
		String query = prop.getProperty("deleteMember");		
		
		try {
			
			//Connection 객체를 통해 PreparedStatement객체를 인스턴스화 한다.
			pstmt = con.prepareStatement(query);
			
			//PreparedStatement객체의 ?를 채워준다.
			pstmt.setInt(1, w.getM_no());	
			
			//쿼리문의 결과를 result에 담는다.
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteGroup(Connection con, Withdraw w) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteGroup");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, w.getM_no());
			pstmt.setString(2, w.getW_reason());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


}
