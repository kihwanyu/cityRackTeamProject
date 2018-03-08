package com.kh.cityrack.board.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.board.admin.model.dto.Board;


public class BoardDao {
private Properties prop = new Properties();
	
	public BoardDao(){
		String fileName = MemberDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Board> selectList() {
		
		
		
		return list;
	}

}
