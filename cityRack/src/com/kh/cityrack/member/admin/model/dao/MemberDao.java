package com.kh.cityrack.member.admin.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cityrack.member.admin.model.dto.Member;
import static com.kh.cityrack.common.JDBCTemplet.*;

public class MemberDao {
    Properties prop = null;
	
	public MemberDao() {
		prop = new Properties();
		String filePath = GradeDao.class.getResource("/sql/admin/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public ArrayList<Member> memberGetAll(Connection conn) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = prop.getProperty("memberGetAll");
		
		try{
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Member>();
			
			while(rset.next()){
				m = new Member();
				m.setM_no(rset.getInt("m_no"));
				m.setM_address(rset.getString("m_email"));
				m.setC_name(rset.getString("c_name"));
				m.setM_password(rset.getString("m_password"));
				m.setM_name(rset.getString("m_name"));
				m.setM_gender(rset.getString("m_gender"));
				m.setM_birthDay(rset.getDate("m_birthDay"));
				m.setM_address(rset.getString("m_address"));
				m.setM_tel(rset.getString("m_tel"));
				m.setM_phone(rset.getString("m_phone"));
				m.setM_enorll_date(rset.getDate("m_enroll_date"));
				m.setM_status(rset.getString("m_status"));
				
				list.add(m);
			}
		
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		return list;
	}

}
