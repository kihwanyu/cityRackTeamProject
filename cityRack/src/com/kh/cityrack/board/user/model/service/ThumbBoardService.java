package com.kh.cityrack.board.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cityrack.board.user.model.dao.ThumbBoardDao;
import com.kh.cityrack.board.user.model.dto.BoardFile;
import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.board.user.model.dto.Board;
public class ThumbBoardService {


	// 후기게시판 insert(게시글내용과 파일 두가지)
	public int insertThumb(Member m, Board b, ArrayList<BoardFile> fileList) {

		Connection con = getConnection();
		int result = 0;
		
		// 게시글 제목이랑 내용 insert
		int result1 = new ThumbBoardDao().insertThumbnailContent(con, b);
		
		System.out.println("ThumbBoardService's result1 : " + result1);

		// board 게시판에 insert되면 커밋
		if(result1 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		
		if(result1 > 0) {
			int boNo = new ThumbBoardDao().selectCurrval(con);

			// 반복문을 이용해서 파일리스트에 반복적으로 가공한 BO_NO를 저장
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setBo_no(boNo);
			}
		}
		
		System.out.println("ThumbBoardService's fileList.get(i).getBo_no : " + fileList.get(1).getBo_no());
		
		int result2 = 0;
		
		if(fileList.size() > 0){
			
			// 게시글에 첨부된 사진파일 insert
			result2 = new ThumbBoardDao().insertBoardFile(con, fileList, b);
			
			System.out.println("ThumbBoardService's result2 : " + result2);
			
		} else{
			
			// 첨부파일이 없을때 기본으로 로고사진 insert
			result2 = new ThumbBoardDao().insertDefaultFile(con, b);
						
			System.out.println("ThumbBoardService's result2 : " + result2);
		}
		
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		if(result > 0) {
			commit(con);
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
