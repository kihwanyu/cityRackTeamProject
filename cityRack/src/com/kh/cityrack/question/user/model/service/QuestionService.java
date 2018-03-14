package com.kh.cityrack.question.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.close;
import static com.kh.cityrack.common.JDBCTemplet.commit;
import static com.kh.cityrack.common.JDBCTemplet.getConnection;
import static com.kh.cityrack.common.JDBCTemplet.rollback;

import java.sql.Connection;

import com.kh.cityrack.member.common.model.dao.MemberDao;
import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.question.user.model.dao.QuestionDao;
import com.kh.cityrack.question.user.model.dto.Question;
/*sdf*//*sdf*//* sd */
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

	// 체질조사결과 가져오기
	/*public int selectConstitution(Question q) {
		
		Connection con = getConnection();

		int result = 0;
		
		result = new QuestionDao().selectConstitution(con, q);
		
		System.out.println("QuestionService's select result : " + result);
		
		close(con);
		
		return result;
	
	}*/
	
	
	public Question selectConstitution(Question q) {
		
		Connection con = getConnection();
				
		Question qResult = new QuestionDao().selectConstitution(con, q);
				
		close(con);
		
		return qResult;
	
	}

}
