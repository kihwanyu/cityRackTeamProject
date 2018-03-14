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

import com.kh.cityrack.board.user.model.dto.Attachment;
import com.kh.cityrack.board.user.model.dto.Board;
import com.kh.cityrack.member.user.model.dao.MemberDao;

import static com.kh.cityrack.common.JDBCTemplet.*;
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
				//b.setBo_category(rset.getString("bo_category"));
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
	
	// 후기게시판
	public int insertThumbnailContent(Connection con, Board b) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertThumb");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getBo_title());
			pstmt.setString(2, b.getBo_content());
			pstmt.setInt(3, b.getM_no());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int selectCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			// 어차피 rset은 한행이니까 if문
			if(rset.next()) {
				bid = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return bid;
	}
	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
	
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			
			// 리스트에서 꺼내오기는 객체를 생성하고 해당객체의 bid를 가져오고, 다시 객체생성하고 .. 반복처리해야함
			for(int i = 0; i < fileList.size(); i++) {
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, fileList.get(i).getBid());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				
				// 레벨은 타이틀만 0으로하고 다른건 1로
				int level = 0;
				if(i == 0){
					level = 0;
				} else {
					level = 1;
				}
				
				pstmt.setInt(5, level);
				
				// 지금 한행한행 반복하는거기때문에 그냥 = 이렇게 대입하면 몇행이 들어가도 무조건 1이됨,, += 이렇게 누적해주기
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
