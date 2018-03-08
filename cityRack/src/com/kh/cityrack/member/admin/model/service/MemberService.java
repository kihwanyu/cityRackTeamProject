package com.kh.cityrack.member.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.member.admin.model.dao.MemberDao;
import com.kh.cityrack.member.admin.model.dto.Member;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class MemberService {

	public ArrayList<Member> memberGetAll() {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().memberGetAll(conn);
		
		close(conn);
		return list;
	}

	public Member memberGet(int memberCode) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().memberGet(conn, memberCode);
		
		close(conn);
		return m;
	}

	public int memberUpdate(int memberCode, String memberStatus) {
		Connection conn = getConnection();
		
		int result = new MemberDao().memberUpdate(conn, memberCode, memberStatus);
		
		if(result > 0){
			commit(conn);
		
		}else{
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
