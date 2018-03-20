package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.user.model.service.MemberService;

/**
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/searchId.em")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*sdf*/
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력한 이름과 이메일을 가지고 온다.
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String key="id"; //아이디 찾기와 같은 서비스, Dao를 이용하므로 비밀번호 찾기임을 알려주는 키.
		String alert=""; //보낼 알림 메세지
		
		System.out.println(name);
		System.out.println(phone);
		
		//멤버 객체 로그인 유저 생성		
		com.kh.cityrack.member.common.model.dto.Member loginUser = new MemberService().checkLoginUser(name, phone, key);
		
		//받아온 loginUser의 값에 따라 보낼 alert 메세지 설정
		System.out.println("searchId : "+loginUser);
		if(loginUser !=null) {
			
					
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			
			new Gson().toJson(loginUser.getM_email(), response.getWriter());
			
					
		} else {
			alert =  "해당하는 회원 정보가 없습니다.";		
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			
			new Gson().toJson(alert, response.getWriter());
		}	
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
