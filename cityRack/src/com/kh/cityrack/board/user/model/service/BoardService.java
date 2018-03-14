package com.kh.cityrack.board.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.board.user.model.dao.BoardDao;
import com.kh.cityrack.board.user.model.dto.Attachment;
import com.kh.cityrack.board.user.model.dto.Board;
public class BoardService {
	//페이징 카운트
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}
	//문의글 목록 메소드
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	//문의글작성
	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	// 후기게시판 
	public int insertThumb(Board b, ArrayList<Attachment> fileList) {
		
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new BoardDao().insertThumbnailContent(con, b);
		
		if(result1 > 0) {
			// 아직 커밋을 안했어서 bid의 키값을 가져올 수 없으니까 제일 최근의 커런트 값의 시퀀스를 가져옴
			int bid = new BoardDao().selectCurrval(con);
			
			// 반복문을 이용해서 파일리스트에 반복적으로 가공한 bid를 저장
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setBid(bid);
			}
		}
			
		int result2 = new BoardDao().insertAttachment(con, fileList);
					
					// result2 > 0을 안하는 이유 : 사진이 모두다 올라가야 커밋 -> 이런처리를 서비스에서 하는 것
		if(result1 > 0 && result2 == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
