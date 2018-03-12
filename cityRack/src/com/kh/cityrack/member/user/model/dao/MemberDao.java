package com.kh.cityrack.member.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Properties;

import com.kh.cityrack.member.user.model.dto.Member;

import static com.kh.cityrack.common.JDBCTemplet.*;
/*sdfs*/
public class MemberDao {

	private Properties prop = null; 

	public MemberDao() {
		prop= new Properties();
		String fileName = MemberDao.class.getResource("/sql/user/member/member-query.properties").getPath();		
		System.out.println(fileName);

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}




	// 회원 가입
	public int insertMember(Connection con, Member m) {
		PreparedStatement pstmt =  null;
		int result = 0;

		String query = prop.getProperty("insertMember");

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





	// 회원 여부 체크  - ID, 비번 찾기 체크용 
	public Member checkLoginUser(Connection con, String name, String emailOrPhone, String key) {

		//PreparedStatement 객체 선언
		//ResultSet 객체 선언
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;

		//prop객체의 파일 위치에 있는 파일에서 key값이 query 값을 가져온다.
		// String key의 값에 따라 쿼리 문이 스위치문에 의해 바뀐다. 
		String query = "";

		switch(key) {
		case "id" : query= prop.getProperty("checkID");
		case "pwd" : query= prop.getProperty("checkPWD");
		}

		System.out.println(query);

		try {
			//Connection 객체를 통해 PreparedStatement객체를 인스턴스화 한다.
			pstmt = con.prepareStatement(query);

			//PreparedStatement객체의 ?를 채워준다.
			pstmt.setString(1, name);
			pstmt.setString(2, emailOrPhone);

			//쿼리문의 결과를 ResultSet으로 받는다.
			rset = pstmt.executeQuery();

			//rset의 결과를 반복하여 객체에 저장한다. 아이디와 비밀번호가 일치하는 정보는 1개 밖에 없으므로 while문이아닌 if문으로 처리한다.
			if (rset.next()) {
				loginUser = new Member();

				loginUser.setM_no(rset.getInt("M_NO"));
				loginUser.setC_code(rset.getString("c_no"));
				loginUser.setM_mail(rset.getString("M_EMAIL"));
				loginUser.setM_password(rset.getString("M_PASSWORD"));
				loginUser.setM_name(rset.getString("M_NAME"));
				loginUser.setM_gender(rset.getString("M_GENDER"));
				loginUser.setM_birthDay(rset.getDate("M_BIRTHDAY"));
				loginUser.setM_address(rset.getString("M_ADDRESS"));
				loginUser.setM_phone(rset.getString("M_PHONE"));
				loginUser.setM_tel(rset.getString("m_tel"));
				loginUser.setM_enorll_date(rset.getDate("m_enroll_date"));
				loginUser.setM_leave_yn(rset.getString("m_status"));


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




	// 로그인 아이디 체크(수정을 위한,,,)
	public Member loginCheck(Connection con, String m_mail, String m_password) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;

		String query = prop.getProperty("loginSelect");

		try {

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, m_mail);
			pstmt.setString(2, m_password);

			rset = pstmt.executeQuery();

			// 한 명 조회니까 if문
			if(rset.next()) {
				loginUser = new Member();

				loginUser.setM_no(rset.getInt("M_NO"));
				loginUser.setM_mail(rset.getString("M_EMAIL"));
				loginUser.setC_code(rset.getString("C_NO"));
				loginUser.setM_password(rset.getString("M_PASSWORD"));
				loginUser.setM_name(rset.getString("M_NAME"));
				loginUser.setM_gender(rset.getString("M_GENDER"));
				loginUser.setM_birthDay(rset.getDate("M_BIRTHDAY"));
				loginUser.setM_address(rset.getString("M_ADDRESS"));
				loginUser.setM_tel(rset.getString("M_TEL"));
				loginUser.setM_phone(rset.getString("M_PHONE"));
				loginUser.setM_enorll_date(rset.getDate("M_ENROLL_DATE"));
				loginUser.setM_leave_yn(rset.getString("M_STATUS"));
				/*loginUser.setM_note(rset.getString("mNote"));*/

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		System.out.println("MemberDao loginUser : " + loginUser);

		return loginUser;
	}




	// 회원정보수정 처리용 메소드
	public int modifyMember(Connection con, Member m) {

		PreparedStatement pstmt = null;
		int result = 0;
		Properties prop = new Properties();

		String query = prop.getProperty("modifyMember");

		try {
			// 쿼리문 불러오기
			pstmt = con.prepareStatement(query);

			// pstmt에 값 입력
			pstmt.setString(1, m.getM_password());
			pstmt.setString(2, m.getM_address());
			pstmt.setString(3, m.getM_phone());
			pstmt.setString(4, m.getM_tel());

			// 쿼리문 실행결과 result에 담기
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}




	// 회원정보 수정할때 비번체크
	public String passwordCheck(Connection con, String userId, String password) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		
		String query = prop.getProperty("passwordCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				if(password.equals(rset.getString(1))){
					result = rset.getString(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
