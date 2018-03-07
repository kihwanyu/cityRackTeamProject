package com.kh.cityrack.member.common.model.service;

import java.sql.Connection;

import com.kh.cityrack.member.common.model.dao.MemberDao;
import com.kh.cityrack.member.common.model.dto.Member;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class WithdrawService {

	// 회원 탈퇴
	public int deleteMember(Member m) {

		int result = 0;
		
		Connection con = getConnection();
		
		result = new MemberDao().deleteMember(con, m);
				
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
