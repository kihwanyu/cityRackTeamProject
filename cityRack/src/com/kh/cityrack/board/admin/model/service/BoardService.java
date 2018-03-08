package com.kh.cityrack.board.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.board.admin.model.dao.BoardDao;
import com.kh.cityrack.board.admin.model.dto.Board;
import static com.kh.cityrack.common.JDBCTemplet.*;
public class BoardService {

	public ArrayList<Board> selectList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con);
		
		close(con);
		
		return list;
	}

}
