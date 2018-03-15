package com.kh.cityrack.board.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.cityrack.board.user.model.dto.BoardFile;
import com.kh.cityrack.board.user.model.dto.Board;
import com.kh.cityrack.member.user.model.dao.MemberDao;

import static com.kh.cityrack.common.JDBCTemplet.*;
public class ThumbBoardDao {
	private Properties prop = new Properties();
	
	public ThumbBoardDao(){
		String fileName = MemberDao.class.getResource("/sql/user/board/thumb-board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	// 후기게시판
	public int insertThumbnailContent(Connection con, Board b) {
		
		PreparedStatement pstmt = null;
		int result = 0;
										// 그냥 board 게시판에 insert
		String query = prop.getProperty("insertThumb");
		
		try {
			
			System.out.println("ThumbBoardDao's insertThumb query : " + query);
			
			pstmt = con.prepareStatement(query);
			
			// 회원번호, 제목, 내용
			pstmt.setInt(1, b.getM_no());
			pstmt.setString(2, b.getBo_title());
			pstmt.setString(3, b.getBo_content());
			
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
	
	
	public int insertBoardFile(Connection con, ArrayList<BoardFile> fileList, Board b) {
	
		/*PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoardFile");
		
		try {
			
			// 리스트에서 꺼내오기는 객체를 생성하고 해당객체의 bid를 가져오고, 다시 객체생성하고 .. 반복처리해야함
			for(int i = 0; i < fileList.size(); i++) {
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, fileList.get(i).getBo_no());
				pstmt.setString(2, fileList.get(i).getBf_originname());
				pstmt.setString(3, fileList.get(i).getBf_name());
				
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
		
		return result;*/
		
		PreparedStatement pstmt = null;
		int result = 0;
											// board-file 게시판에 insert
		String query = prop.getProperty("insertBoardFile");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for (int j = 0; j < fileList.size(); j++) {
				
				String fileName = fileList.get(j).getBf_originname();
				String extension = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()); 
				
				pstmt.setInt(1, b.getBo_no());
				pstmt.setString(2, fileList.get(j).getBf_originname());
				pstmt.setString(3, fileList.get(j).getBf_name());
				pstmt.setString(4, extension);
				
				System.out.println("extension : " + extension);
				result = pstmt.executeUpdate();

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	// 후기게시판 리스트
	public ArrayList<HashMap<String, Object>> selectThumbnailList(Connection con) {
		
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectThumbnailMap");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				// vo객체대신 해쉬맵사용한다고 생각하면됨,,
				// 해쉬맵에 put으로 get을 통해 정보가져와서 저장
				hmap = new HashMap<String, Object>();
				
				hmap.put("bid", rset.getInt("bid"));
				hmap.put("bno", rset.getInt("bno"));
				hmap.put("btitle", rset.getString("btitle"));
				hmap.put("bcontent", rset.getString("bcontent"));
				hmap.put("bwriter", rset.getString("nick_name"));
				hmap.put("bcount", rset.getInt("bcount"));
				hmap.put("bdate", rset.getDate("bdate"));
				hmap.put("fid", rset.getString("fid"));
				hmap.put("originName", rset.getString("origin_Name"));
				hmap.put("changeName", rset.getString("change_Name"));
				hmap.put("filePath", rset.getString("file_path"));
				hmap.put("uploadDate", rset.getDate("upload_Date"));
				
				list.add(hmap); // -> selectAll과 같지만 hmap을 사용한것뿐
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}


	public int updateCount(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public HashMap<java.lang.String, Object> selectThumbnailMap(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		// 맵에 바로 컬럼을 넣는게 아니라 보드와 어태치먼트의 객체를 넣음
		Board b = null;
		BoardFile at = null;
		
		// 클릭하면 사진이 4장이니까 어태치먼트를 리스트로 만들어서 전달
		ArrayList<BoardFile> list = null;
		
		String query = prop.getProperty("selectThumbnailOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<BoardFile>();
			
			while(rset.next()) {
				
			/*	b = new Board();
				
				b.setBid(rset.getInt("bid"));
				b.setBno(rset.getInt("bno"));
				b.setbTitle(rset.getString("btitle"));
				b.setbContent(rset.getString("bcontent"));
				b.setbWriter(rset.getString("nick_name"));
				b.setbCount(rset.getInt("bcount"));
				b.setbDate(rset.getDate("bdate"));
				
				at = new BoardFile();
				
				at.setFid(rset.getInt("fid"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setFilePath(rset.getString("file_path"));
				at.setUploadDate(rset.getDate("upload_date"));
				
				// < 일대다 조인 >
				// 보드는 어차피 한개니까 계속 생성 덮어쓰고
				// 리스트는 보드한개당 4개니까 생성하고 리스트에 담고
				// 결과) 보드는 하나고 리스트는 네개
				list.add(at);*/
			}
			
			hmap = new HashMap<String, Object>();
			hmap.put("board", b);
			hmap.put("BoardFile", list);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

}
