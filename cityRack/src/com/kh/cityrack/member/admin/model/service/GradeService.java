package com.kh.cityrack.member.admin.model.service;

import java.sql.Connection;

import com.kh.cityrack.member.admin.model.dao.GradeDao;

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
}
