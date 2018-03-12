package com.kh.cityrack.member.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.member.admin.model.dao.MemberDao;
import com.kh.cityrack.member.admin.model.dto.Member;
import com.kh.cityrack.member.admin.model.dto.Withdraw;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class MemberService {

	public ArrayList<Member> memberGetAll(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().memberGetAll(conn, currentPage);
		
		close(conn);
		return list;
	}

	public Member memberGet(int memberCode) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().memberGet(conn, memberCode);
		
		close(conn);
		return m;
	}

	public int memberUpdate(int memberCode, String memberStatus, String withdrawReason) {
		Connection conn = getConnection();
		int result1 = 0;
		int result2 = 0;
		int existence = 0;
		
		existence = new MemberDao().checkWithdraw(conn, memberCode);
		System.out.println(existence);
		
		if(existence == 0){
			result1 = new MemberDao().withdrawMemberInsert(conn, memberCode, withdrawReason);
		}else{
			result1 = new MemberDao().withdrawMemberUpdate(conn, memberCode, withdrawReason);
		}
		
		if(result1 > 0){
			result2 = new MemberDao().memberUpdate(conn, memberCode, memberStatus);
			
			if(result1 > 0 && result2 > 0){
				commit(conn);
			}else{
				rollback(conn);
			}
		}
		
		
		close(conn);
		return result1 + result2;
	}

	public ArrayList<Withdraw> withdrawMemberGetAll() {
		Connection conn = getConnection();
		ArrayList<Withdraw> list = new MemberDao().withdrawMemberGetAll(conn);
		
		close(conn);
		return list;
	}

	public int getTotalCount() {
		Connection conn = getConnection();
		
		int totalCount = new MemberDao().getTotalCount(conn);
		
		close(conn);
		return totalCount;
	}

}
