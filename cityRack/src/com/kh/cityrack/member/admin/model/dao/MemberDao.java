package com.kh.cityrack.member.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.cityrack.member.admin.model.dto.Member;
import com.kh.cityrack.member.admin.model.dto.Search;
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
	public ArrayList<Member> memberGetAll(Connection conn, int currentPage) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = prop.getProperty("memberGetAll");
		int listCount = 10;
		int startList = ((currentPage - 1)) * listCount + 1;
	    int endList = startList + listCount - 1; 
		
		
		try{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startList);
			pstmt.setInt(2, endList);
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
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
	public ArrayList<Withdraw> withdrawMemberGetAll(Connection conn, int currentPage) {
		ArrayList<Withdraw> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Withdraw w = null;
		String query = prop.getProperty("withdrawMemberGetAll");
		int listCount = 10;
		int startList = ((currentPage - 1)) * listCount + 1;
	    int endList = startList + listCount - 1; 
		
		try{
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, startList);
			pstmt.setInt(2, endList);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Withdraw>();
			
			while(rset.next()){
				w = new Withdraw();
				w.setMemberCode(rset.getInt("w_no"));
				w.setMemberName(rset.getString("m_name"));
				w.setWithdrawDate(rset.getDate("w_date"));
				w.setWithdrawReason(rset.getString("w_reason"));
				
				list.add(w);
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
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
			pstmt.setInt(2, memberCode);
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	public int getTotalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getTotalCount");
		int result = 0;
		
		try{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				result = rset.getInt("totalcount");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	public int getWithdrawTotalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getWithdrawTotalCount");
		int result = 0;
		
		try{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				result = rset.getInt("withdrawtotalcount");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	public int memberSearch(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		String query = null;
		ResultSet rset = null;
		int result = 0;
		
		if(search.getSearchCondition().equals("email")){
			query = prop.getProperty("emailSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getSearchText());
				if(search.getGender().equals("A")){
					pstmt.setString(2, "M");
					pstmt.setString(3, "F");
				}else{
					pstmt.setString(2, search.getGender());
					pstmt.setString(3, search.getGender());
				}
				pstmt.setInt(4, 1);
				pstmt.setInt(5, 1000);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					result++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("name")){
			query = prop.getProperty("nameSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getSearchText());
				if(search.getGender().equals("A")){
					pstmt.setString(2, "M");
					pstmt.setString(3, "F");
				}else{
					pstmt.setString(2, search.getGender());
					pstmt.setString(3, search.getGender());
				}
				pstmt.setInt(4, 1);
				pstmt.setInt(5, 1000);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					result++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("birthday")){
			query = prop.getProperty("birthdaySearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(search.getBeforeDate()));
				pstmt.setInt(2, Integer.parseInt(search.getAfterDate()));
				if(search.getGender().equals("A")){
					pstmt.setString(3, "M");
					pstmt.setString(4, "F");
				}else{
					pstmt.setString(3, search.getGender());
					pstmt.setString(4, search.getGender());
				}
				pstmt.setInt(5, 1);
				pstmt.setInt(6, 1000);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					result++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("grade")){
			query = prop.getProperty("gradeSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getGrade());
				if(search.getGender().equals("A")){
					pstmt.setString(2, "M");
					pstmt.setString(3, "F");
				}else{
					pstmt.setString(2, search.getGender());
					pstmt.setString(3, search.getGender());
				}
				pstmt.setInt(4, 1);
				pstmt.setInt(5, 1000);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					result++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("enrollDate")){
			query = prop.getProperty("enrollDateSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(search.getBeforeDate()));
				pstmt.setInt(2, Integer.parseInt(search.getAfterDate()));
				if(search.getGender().equals("A")){
					pstmt.setString(3, "M");
					pstmt.setString(4, "F");
				}else{
					pstmt.setString(3, search.getGender());
					pstmt.setString(4, search.getGender());
				}
				pstmt.setInt(5, 1);
				pstmt.setInt(6, 1000);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					result++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}
		
		
		return result;
	}
	
	public ArrayList<Member> memberSearch(Connection conn, Search search, int currentPage) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = prop.getProperty("emailSearch");
		int listCount = 10;
		int startList = ((currentPage - 1)) * listCount + 1;
	    int endList = startList + listCount - 1; 
		
	    if(search.getSearchCondition().equals("email")){
			query = prop.getProperty("emailSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getSearchText());
				if(search.getGender().equals("A")){
					pstmt.setString(2, "M");
					pstmt.setString(3, "F");
				}else{
					pstmt.setString(2, search.getGender());
					pstmt.setString(3, search.getGender());
				}
				pstmt.setInt(4, startList);
				pstmt.setInt(5, endList);
				
				rset = pstmt.executeQuery();
				
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
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("name")){
			query = prop.getProperty("nameSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getSearchText());
				if(search.getGender().equals("A")){
					pstmt.setString(2, "M");
					pstmt.setString(3, "F");
				}else{
					pstmt.setString(2, search.getGender());
					pstmt.setString(3, search.getGender());
				}
				pstmt.setInt(4, startList);
				pstmt.setInt(5, endList);
				
				System.out.println(query);
				
				rset = pstmt.executeQuery();
				
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
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("birthday")){
			query = prop.getProperty("birthdaySearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(search.getBeforeDate()));
				pstmt.setInt(2, Integer.parseInt(search.getAfterDate()));
				if(search.getGender().equals("A")){
					pstmt.setString(3, "M");
					pstmt.setString(4, "F");
				}else{
					pstmt.setString(3, search.getGender());
					pstmt.setString(4, search.getGender());
				}
				pstmt.setInt(5, startList);
				pstmt.setInt(6, endList);
				
				rset = pstmt.executeQuery();
				
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
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("grade")){
			query = prop.getProperty("gradeSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getGrade());
				if(search.getGender().equals("A")){
					pstmt.setString(2, "M");
					pstmt.setString(3, "F");
				}else{
					pstmt.setString(2, search.getGender());
					pstmt.setString(3, search.getGender());
				}
				pstmt.setInt(4, startList);
				pstmt.setInt(5, endList);
				
				rset = pstmt.executeQuery();
				
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
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("enrollDate")){
			query = prop.getProperty("enrollDateSearch");
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(search.getBeforeDate()));
				pstmt.setInt(2, Integer.parseInt(search.getAfterDate()));
				if(search.getGender().equals("A")){
					pstmt.setString(3, "M");
					pstmt.setString(4, "F");
				}else{
					pstmt.setString(3, search.getGender());
					pstmt.setString(4, search.getGender());
				}
				pstmt.setInt(5, startList);
				pstmt.setInt(6, endList);
				
				rset = pstmt.executeQuery();
				
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
				close(pstmt);
				close(rset);
			}
		}
		
		return list;
		
	}
	public int withdrawMemberSearch(Connection conn, Search search) {
		PreparedStatement pstmt = null;
		String query = null;
		ResultSet rset = null;
		int result = 0;
		
		if(search.getSearchCondition().equals("email")){
			query = prop.getProperty("withdrawEmailSearch");
			
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getSearchText());
				pstmt.setInt(2, 1);
				pstmt.setInt(3, 1000);
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					result++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("withdrawDate")){
			query = prop.getProperty("withdrawDateSearch");
			
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(search.getBeforeDate()));
				pstmt.setInt(2, Integer.parseInt(search.getAfterDate()));
				pstmt.setInt(3, 1);
				pstmt.setInt(4, 1000);
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					result++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}
		
		return result;
	}
	
	public ArrayList<Withdraw> withdrawMemberSearch(Connection conn, Search search, int currentPage) {
		ArrayList<Withdraw> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Withdraw w = null;
		String query = null;
		int listCount = 10;
		int startList = ((currentPage - 1)) * listCount + 1;
	    int endList = startList + listCount - 1; 
	    
	    if(search.getSearchCondition().equals("email")){
			query = prop.getProperty("withdrawEmailSearch");
			
			try{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, search.getSearchText());
				pstmt.setInt(2, startList);
				pstmt.setInt(3, endList);
				rset = pstmt.executeQuery();
				
				list = new ArrayList<Withdraw>();
				while(rset.next()){
					w = new Withdraw();
					w.setMemberCode(rset.getInt("w_no"));
					w.setMemberName(rset.getString("m_name"));
					w.setWithdrawDate(rset.getDate("w_date"));
					w.setWithdrawReason(rset.getString("w_reason"));
					list.add(w);
				}
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}else if(search.getSearchCondition().equals("withdrawDate")){
			query = prop.getProperty("withdrawDateSearch");
			System.out.println("비포:" + Integer.parseInt(search.getBeforeDate()));
			System.out.println("애프터:"+ Integer.parseInt(search.getAfterDate()));
			try{
				pstmt = conn.prepareStatement(query);
				
				pstmt.setInt(1, Integer.parseInt(search.getBeforeDate()));
				pstmt.setInt(2, Integer.parseInt(search.getAfterDate()));
				pstmt.setInt(3, startList);
				pstmt.setInt(4, endList);
				rset = pstmt.executeQuery();
				
				list  = new ArrayList<Withdraw>();
				while(rset.next()){
					w = new Withdraw();
					w.setMemberCode(rset.getInt("w_no"));
					w.setMemberName(rset.getString("m_name"));
					w.setWithdrawDate(rset.getDate("w_date"));
					w.setWithdrawReason(rset.getString("w_reason"));
					list.add(w);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(pstmt);
				close(rset);
			}
		}
		
	    return list;
	}
	
}
