package com.kh.cityrack.member.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.close;
import static com.kh.cityrack.common.JDBCTemplet.commit;
import static com.kh.cityrack.common.JDBCTemplet.getConnection;
import static com.kh.cityrack.common.JDBCTemplet.rollback;

import java.sql.Connection;

import com.kh.cityrack.member.common.model.dao.MemberDao;
import com.kh.cityrack.member.common.model.dto.Withdraw;

public class WithdrawService {
	
	// 회원 탈퇴
	public int deleteMember(Withdraw w) {
		
		Connection con = getConnection();

		int result = 0;
		
		result = new MemberDao().deleteMember(con, w);
				
		if(result > 0) {
			commit(con);
			
			result = new MemberDao().deleteGroup(con, w);
			
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
}
