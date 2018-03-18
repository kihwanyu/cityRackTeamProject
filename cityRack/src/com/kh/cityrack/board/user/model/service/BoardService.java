package com.kh.cityrack.board.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.*;
import static com.kh.jsp.common.JDBCTemplet.close;
import static com.kh.jsp.common.JDBCTemplet.commit;
import static com.kh.jsp.common.JDBCTemplet.getConnection;
import static com.kh.jsp.common.JDBCTemplet.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.board.user.model.dao.BoardDao;
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
	public Board selectOne(int num) {
		Connection con = getConnection();
		
		Board b = new BoardDao().selectOne(con, num);
		
		close(con);
		return b;
	}
	public int insertRe(Board re_b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertRe(con, re_b);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		return result;
	}
	public ArrayList<Board> selectList() {
		Connection con = getConnection();
		ArrayList<Board> rlist = new BoardDao().selectList(con);
		close(con);
		return rlist;
	}
	public Board selectOne2(int num) {
		Connection con = getConnection();
		
		Board b = new BoardDao().selectOne2(con, num);
		
		close(con);
		return b;
	}
	public Board selectReply(int num) {
		Connection con = getConnection();
		
		Board b = new BoardDao().selectReply(con,num);
		
		close(con);
		return b;
		
	}
	

}
