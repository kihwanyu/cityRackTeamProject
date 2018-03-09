package com.kh.cityrack.board.admin.model.dao;

import java.io.FileReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.board.admin.model.dto.Board;
import com.kh.cityrack.member.admin.model.dao.MemberDao;
import com.kh.cityrack.member.admin.model.dto.Member;
import com.kh.jsp.board.model.dao.BoardDao;

import static com.kh.cityrack.common.JDBCTemplet.*;
import static com.kh.jsp.common.JDBCTemplet.close;
import static com.kh.jsp.common.JDBCTemplet.commit;
import static com.kh.jsp.common.JDBCTemplet.getConnection;
import static com.kh.jsp.common.JDBCTemplet.rollback;

public class BoardDao {
private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName = BoardDao.class.getResource("/sql/admin/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//게시판 목록불러오는 메소드
	public ArrayList<Board> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		String query = prop.getProperty("selectList");
			
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			System.out.println("query:" + query);
			while(rset.next()){
				Board b = new Board();
				
				b.setBo_no(rset.getInt("BO_NO"));
				b.setBo_title(rset.getString("BO_TITLE"));
				b.setM_email(rset.getString("M_EMAIL"));
				b.setBo_date(rset.getDate("BO_DATE"));
				b.setBo_hit(rset.getInt("BO_HIT"));
				
				list.add(b);
				
			}
			System.out.println("list :" + list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
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
		BO_FILE*/
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBo_pno());
			
			pstmt.setString(2, b.getBo_division());
			pstmt.setString(3, b.getBo_category());
			pstmt.setInt(4, b.getM_no());
			pstmt.setString(5, b.getBo_title());
			pstmt.setString(6, b.getBo_content());
			pstmt.setInt(7, b.getBo_hit());
			pstmt.setInt(8, b.getBo_recomm());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
			
			
		}
		
		
		return result;
	}
	

}
