package com.kh.cityrack.question.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.close;
import static com.kh.cityrack.common.JDBCTemplet.commit;
import static com.kh.cityrack.common.JDBCTemplet.getConnection;
import static com.kh.cityrack.common.JDBCTemplet.rollback;

import java.sql.Connection;

import com.kh.cityrack.question.user.model.dao.QuestionDao;
import com.kh.cityrack.question.user.model.dto.Question;
/*sdf*/
public class QuestionService {

	// 체질 설문조사결과 insert
	public int insertConstitution(Question q) {

		Connection con = getConnection();

		int result = 0;
		
		result = new QuestionDao().insertConstitution(con, q);
		
		System.out.println("QuestionService's result : " + result);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
