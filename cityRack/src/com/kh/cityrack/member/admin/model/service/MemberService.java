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

}
