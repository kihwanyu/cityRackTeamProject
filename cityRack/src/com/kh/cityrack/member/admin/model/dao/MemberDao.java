package com.kh.cityrack.member.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.member.admin.model.dto.Member;
import com.kh.cityrack.member.admin.model.dto.Withdraw;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class MemberDao {
    Properties prop = null;
	
	public MemberDao() {
		prop = new Properties();
		String filePath = GradeDao.class.getResource("/sql/admin/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public ArrayList<Member> memberGetAll(Connection conn) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = prop.getProperty("memberGetAll");
		
		try{
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Member>();
			
			while(rset.next()){
				m = new Member();
				m.setM_no(rset.getInt("m_no"));
				m.setM_email(rset.getString("m_email"));
				m.setC_name(rset.getString("c_name"));
				m.setM_password(rset.getString("m_password"));
				m.setM_name(rset.getString("m_name"));
				m.setM_gender(rset.getString("m_gender"));
				m.setM_birthDay(rset.getDate("m_birthDay"));
				m.setM_address(rset.getString("m_address"));
				m.setM_tel(rset.getString("m_tel"));
				m.setM_phone(rset.getString("m_phone"));
				m.setM_enorll_date(rset.getDate("m_enroll_date"));
				m.setM_status(rset.getString("m_status"));
				
				list.add(m);
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		return list;
	}
	public Member memberGet(Connection conn, int memberCode) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("memberGet");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				m.setM_no(rset.getInt("m_no"));
				m.setM_email(rset.getString("m_email"));
				m.setC_name(rset.getString("c_name"));
				m.setM_password(rset.getString("m_password"));
				m.setM_name(rset.getString("m_name"));
				m.setM_gender(rset.getString("m_gender"));
				m.setM_birthDay(rset.getDate("m_birthDay"));
				m.setM_address(rset.getString("m_address"));
				m.setM_tel(rset.getString("m_tel"));
				m.setM_phone(rset.getString("m_phone"));
				m.setM_enorll_date(rset.getDate("m_enroll_date"));
				m.setM_status(rset.getString("m_status"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return m;
	}
	public int memberUpdate(Connection conn, int memberCode, String memberStatus) {
		PreparedStatement pstmt = null;
		int result = 0;
		String status = null;
		String query = prop.getProperty("memberUpdate");
		
		if(memberStatus.equals("Y")){
			status = "N";
		}else{
			status = "Y";
		}
		
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, memberCode);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Withdraw> withdrawMemberGetAll(Connection conn) {
		ArrayList<Withdraw> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		Withdraw w = null;
		String query = prop.getProperty("withdrawMemberGetAll");
		
		try{
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Withdraw>();
			
			while(rset.next()){
				w = new Withdraw();
				w.setMemberCode(rset.getInt("m_no"));
				w.setMemberName(rset.getString("m_name"));
				w.setWithdrawDate(rset.getDate("w_date"));
				w.setWithdrawReason(rset.getString("w_reason"));
				
				list.add(w);
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		return list;
	}
	
	public int checkWithdraw(Connection conn, int memberCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int existence = 0;
		
		String query = prop.getProperty("checkWithdraw");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				existence = 1;
			}else{
				existence = 0;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return existence;
	}
	
	public int withdrawMemberInsert(Connection conn, int memberCode, String withdrawReason) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("withdrawMemberInsert");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			pstmt.setString(2, withdrawReason);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	
	public int withdrawMemberUpdate(Connection conn, int memberCode, String withdrawReason) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("withdrawMemberUpdate");
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, withdrawReason);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

}
