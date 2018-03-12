package com.kh.cityrack.board.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.board.user.model.dao.BoardDao;
import com.kh.cityrack.board.user.model.dto.Board;
public class BoardService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

}
