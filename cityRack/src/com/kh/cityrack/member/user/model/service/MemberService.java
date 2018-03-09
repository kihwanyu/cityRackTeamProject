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

		result = new MemberDao().insertMember(con , m);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}



	// 회원 여부 체크  - ID, 비번 체크용
	public Member checkLoginUser(String name, String emailOrPhone, String key) {
		Connection con = getConnection();

		Member loginUser = new MemberDao().checkLoginUser(con, name, emailOrPhone, key);


		return loginUser;
	}


	// 회원정보수정 처리용 메소드 
	public int updateMember(Member m) {

		int result = 0;

		Connection con = getConnection();

		Member loginUser = new MemberDao().loginCheck(con, m.getM_mail(), m.getM_password());

		if(loginUser != null) {
			result = new MemberDao().modifyMember(con, m);
		}

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
