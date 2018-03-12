package com.kh.cityrack.member.common.model.service;

import com.kh.cityrack.member.common.model.dao.MemberDao;
import com.kh.cityrack.member.common.model.dto.Member;
import static com.kh.cityrack.common.JDBCTemplet.*;

import java.sql.Connection;
public class MemberService {
	/*sdf*/
	public Member login(Member m) {
		//Connection 객체 생성
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().login(conn, m);
		
		return loginUser;
	}

}
