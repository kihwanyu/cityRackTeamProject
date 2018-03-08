package com.kh.cityrack.member.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.member.admin.model.dao.GradeDao;
import com.kh.cityrack.member.admin.model.dto.Grade;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class GradeService {
	
	public int gradeInsert(String gradeName, int gradeDiscount) {
		Connection conn = getConnection();
		
		int result = new GradeDao().gradeInsert(conn, gradeName, gradeDiscount); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;		
	}

	public ArrayList<Grade> gradeGetAll() {
		Connection conn = getConnection();
		ArrayList<Grade> list = new GradeDao().gradeGetAll(conn);
		
		return list;
	}

	public Grade gradeGet(int num) {
		Connection conn = getConnection();
		
		Grade g = new GradeDao().gradeGet(conn, num);
		
		close(conn);
		return g;
	}

	public int gradeUpdate(Grade g) {
		Connection conn = getConnection();
		
		int result = new GradeDao().gradeUpdate(conn, g);
		
		if(result > 0){
			commit(conn);
			
		}else{
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int gradeDelete(int gradeCode) {
		Connection conn = getConnection();
		
		int result = new GradeDao().gradeDelete(conn, gradeCode);
		
		if(result > 0){
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	
}
