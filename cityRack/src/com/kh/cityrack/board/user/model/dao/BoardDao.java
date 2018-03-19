package com.kh.cityrack.board.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.board.user.model.dto.Board;
import com.kh.cityrack.member.user.model.dao.MemberDao;
import static com.kh.cityrack.common.JDBCTemplet.*;
import static com.kh.jsp.common.JDBCTemplet.close;
public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName = MemberDao.class.getResource("/sql/user/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			// 페이징처리수정부분
			if(rset.next()){
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			System.out.println("startRow"+startRow);
			System.out.println("endRow"+endRow);
			pstmt.setString(1, "게시글");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			//조회 시작할 행 번호와 마지막 행 번호 계산
			list = new ArrayList<Board>();
			
			/*BO_NO
			BO_PNO
			BO_DIVISION
			BO_CATEGORY
			M_NO
			BO_DATE
			BO_TITLE
			BO_CONTENT
			BO_HIT
			BO_RECOMM*/
			while(rset.next()){
				Board b = new Board();
				
				b.setBo_no(rset.getInt("bo_no"));
				//b.setBo_pno(rset.getInt("bo_pno"));
				//b.setBo_division(rset.getString("bo_division"));
				b.setBo_category(rset.getString("bo_category"));
				b.setBo_title(rset.getString("bo_title"));
				b.setM_name(rset.getString("m_name"));
				b.setBo_date(rset.getDate("bo_date"));
				b.setBo_status(rset.getString("bo_status"));
				//b.setBo_content(rset.getString("bo_content"));
				//b.setBo_hit(rset.getInt("bo_hit"));
				//b.setBo_recomm(rset.getInt("bo_recomm"));
				
				list.add(b);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
			
		}
		return list;
	}
	//문의글작성메소드
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		//
		System.out.println("insertBoard query:" + query);
		try {
			pstmt = con.prepareStatement(query);
			System.out.println("division:"+b.getBo_division());
			pstmt.setString(1, b.getBo_division());
			pstmt.setString(2, b.getBo_category());
			pstmt.setInt(3, b.getM_no());
			
			pstmt.setString(4, b.getBo_title());
			pstmt.setString(5, b.getBo_content());
			/*BO_NO
			BO_PNO
			BO_DIVISION
			BO_CATEGORY
			M_NO
			BO_DATE
			BO_TITLE
			BO_CONTENT
			BO_HIT
			BO_RECOMM
			BO_STATUS*/
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);                                   
		}
		
		
		return result;
	}
	//게시글 내용보기
	public Board selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOne");
		System.out.println("query:"+query);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			if(rset.next()){
				b = new Board();
				
				b.setBo_no(rset.getInt("bo_no"));
				b.setM_name(rset.getString("m_name"));
				b.setBo_title(rset.getString("bo_title"));
				b.setBo_content(rset.getString("bo_content"));
				b.setBo_date(rset.getDate("bo_date"));
				b.setBo_category(rset.getString("bo_category"));
			}
			
			
			
			System.out.println("b :"+b);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		return b;
	}
	public int insertRe(Connection con, Board re_b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRe");
		System.out.println("query:"+query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, re_b.getBo_pno());
			pstmt.setString(2, re_b.getBo_division());
			pstmt.setString(3, re_b.getBo_category());
			pstmt.setInt(4, re_b.getM_no());
			pstmt.setString(5, re_b.getBo_title());
			pstmt.setString(6, re_b.getBo_content());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Board> selectList(Connection con) {
		PreparedStatement pstmt = null;
		
		ArrayList<Board> rlist= null;
		ResultSet rset = null;
		
		String query = prop.getProperty("reList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "답글");
			rset = pstmt.executeQuery();
			
			rlist = new ArrayList<Board>();
			while(rset.next()){
				Board b = new Board();
				b.setBo_pno(rset.getInt("bo_pno"));
				b.setBo_title(rset.getString("bo_title"));
				b.setBo_content(rset.getString("bo_content"));
				
				rlist.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}
	public Board selectOne2(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOne");
		System.out.println("query:"+query);
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			if(rset.next()){
				b = new Board();
				
				b.setBo_no(rset.getInt("bo_no"));
				b.setM_name(rset.getString("m_name"));
				b.setBo_title(rset.getString("bo_title"));
				b.setBo_content(rset.getString("bo_content"));
				b.setBo_date(rset.getDate("bo_date"));
				b.setBo_category(rset.getString("bo_category"));
			}
			
			
			
			System.out.println("b :"+b);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		return b;
	}
	public Board selectReply(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectReply");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				b = new Board();
				b.setBo_pno(rset.getInt("bo_pno"));
				b.setBo_content(rset.getString("bo_content"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		
		return b;
	}

}
