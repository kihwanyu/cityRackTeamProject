package com.kh.cityrack.member.common.model.service;

import java.sql.Connection;

import com.kh.cityrack.member.common.model.dao.MemberDao;
import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.common.model.dto.Withdraw;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class WithdrawService {
/*sdfs*/
	// 회원 탈퇴
	public int deleteMember(Withdraw w, Member m) {
		
		Connection con = getConnection();

		int result = 0;
				
		// 탈퇴여부 Y용
		result = new MemberDao().deleteMember(con, m);
			
		// 탈퇴사유용
		result = new MemberDao().deleteGroup(con, w);
			
		System.out.println("withdrawService's result : " + result); 

		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
