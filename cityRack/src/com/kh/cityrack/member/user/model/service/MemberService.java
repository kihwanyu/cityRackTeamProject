package com.kh.cityrack.member.user.model.service;

import static com.kh.cityrack.common.JDBCTemplet.close;
import static com.kh.cityrack.common.JDBCTemplet.commit;
import static com.kh.cityrack.common.JDBCTemplet.getConnection;
import static com.kh.cityrack.common.JDBCTemplet.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.user.model.dao.MemberDao;
public class MemberService {
	/*sdf*//* sd */
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
		
		close(con);

		return result;
	}


/*sdfsd*/
	// 회원 여부 체크  - ID, 비번 체크용
	public Member checkLoginUser(String name, String emailOrPhone, String key) {
		Connection con = getConnection();

		Member loginUser = new MemberDao().checkLoginUser(con, name, emailOrPhone, key);

		close(con);
		
		return loginUser;
	}


	// 회원정보수정 처리용 메소드 
	public int updateMember(Member m) {

		int result = 0;

		Connection con = getConnection();

		//Member loginUser = new MemberDao().loginCheck(con, m.getM_mail(), m.getM_password());

		//if(loginUser != null) {
			result = new MemberDao().modifyMember(con, m);
		//}

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}


	public String passwordCheck(String userId, String password) {
		Connection con = getConnection();
		
		String result = new MemberDao().passwordCheck(con, userId, password);
		
		close(con);
		
		return result;
	}


	// 이메일 중복 체크
	public Member checkRepeatId(String emailCheck) {
		Connection con = getConnection();
		Member takenId = 
				new MemberDao().checkRepeatId(con, emailCheck);
		close(con);
		
		return takenId;
	}


	// 임시 비밀번호로 수정
	public int updateMemberPwd(String encpwd, int mno) {
		Connection con = getConnection();
		int result = new MemberDao().updateMemberPwd(con, encpwd, mno);
		
		if(result>0){
			commit(con);
		} else{
			rollback(con);
		}
		close(con);
		
		return result;
	}



}
