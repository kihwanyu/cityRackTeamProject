package com.kh.cityrack.member.user.model.service;

import java.sql.Connection;

import com.kh.cityrack.member.user.model.dao.MemberDao;
import com.kh.cityrack.member.user.model.dto.Member;
import static com.kh.cityrack.common.JDBCTemplet.*; 
public class MemberService {

	// 회원 가입
	public int insertMember(Member m) {
		int result = 0;
		Connection con = getConnection();
		
		result = new MemberDao().insertMember(con, m);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}
