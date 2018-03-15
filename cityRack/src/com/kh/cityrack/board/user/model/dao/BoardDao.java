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
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
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
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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

}
