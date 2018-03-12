package com.kh.cityrack.question.user.model.dao;

import static com.kh.cityrack.common.JDBCTemplet.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.cityrack.member.user.model.dao.MemberDao;
import com.kh.cityrack.question.user.model.dto.Question;
/*sdf*//*sdf*/
public class QuestionDao {
	
	//Properties 객체 선언
	//member-query.propertie 파일을 읽어 오기 위해서.
	private Properties prop = null;
	public QuestionDao(){
		//prop 객체 인스턴스화sdfasd
		prop = new Properties();
		
		//fileName에 member-query.properties 파일의 위치를 넣어준다.
		String fileName = MemberDao.class.getResource("/sql/user/member/member-query.properties").getPath();
		
		try {
			//prop객체에 member-query.properties 파일위치를 넣어준다.
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	

	// 체질 설문조사결과 insert
	public int insertConstitution(Connection con, Question q) {

		// PreparedStatement 객체 선언
		PreparedStatement pstmt = null;
		// result값 초기화
		int result = 0;
		
		//prop객체의 파일 위치에 있는 파일에서 key값이 deleteMember value값을 가져온다.
		String query = prop.getProperty("insertCon");
		
		System.out.println("QuestionDao's query : " + query);
		
		try {
			
			//Connection 객체를 통해 PreparedStatement객체를 인스턴스화 한다.
			pstmt = con.prepareStatement(query);
			
			//PreparedStatement객체의 ?를 채워준다.
			pstmt.setInt(1, q.getM_no());	
			pstmt.setString(2, q.getQ_8constitution());
			
			//쿼리문의 결과를 result에 담는다.
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 체질 조사결과 가져오기
	public int selectConstitution(Connection con, Question q) {

		// PreparedStatement 객체 선언
		PreparedStatement pstmt = null;
		// result값 초기화
		int result = 0;
		
		//prop객체의 파일 위치에 있는 파일에서 key값이 selectCon value값을 가져온다.
		String query = prop.getProperty("selectCon");
		
		System.out.println("QuestionDao's query(select) : " + query);
		
		try {
			
			//Connection 객체를 통해 PreparedStatement객체를 인스턴스화 한다.
			pstmt = con.prepareStatement(query);
			
			//PreparedStatement객체의 ?를 채워준다.
			pstmt.setInt(1, q.getM_no());	
			
			//쿼리문의 결과를 result에 담는다.
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
