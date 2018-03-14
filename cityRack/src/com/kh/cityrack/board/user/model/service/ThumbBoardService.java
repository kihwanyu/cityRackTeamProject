package com.kh.cityrack.board.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cityrack.board.user.model.dao.ThumbBoardDao;
import com.kh.cityrack.board.user.model.dto.Attachment;
import com.kh.cityrack.board.user.model.dto.Board;
public class ThumbBoardService {
	
	
	// 후기게시판 
	public int insertThumb(Board b, ArrayList<Attachment> fileList) {
		
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new ThumbBoardDao().insertThumbnailContent(con, b);
		
		if(result1 > 0) {
			// 아직 커밋을 안했어서 bid의 키값을 가져올 수 없으니까 제일 최근의 커런트 값의 시퀀스를 가져옴
			int bid = new ThumbBoardDao().selectCurrval(con);
			
			// 반복문을 이용해서 파일리스트에 반복적으로 가공한 bid를 저장
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setBid(bid);
			}
		}
			
		int result2 = new ThumbBoardDao().insertAttachment(con, fileList);
					
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

	// 후기게시판 리스트
	public ArrayList<HashMap<String, Object>> selectThumbnailList() {
		
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new ThumbBoardDao().selectThumbnailList(con);
		
		close(con);
		
		return list;
	}
	
	
	public HashMap<String, Object> selectThumbnailMap(int num) {

		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		// 클릭하면 먼저 게시판에서 조회수 증가 후 보여줌(일반게시판에서 카운트 증가하는거 그대로 쓸 수 있음)
		int result = new ThumbBoardDao().updateCount(con, num);
		
		if(result > 0) {
			commit(con);
			// 조회한 사진게시글 보여주기
			hmap = new ThumbBoardDao().selectThumbnailMap(con, num);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return hmap;
	}
	
	

}
