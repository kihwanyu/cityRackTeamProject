package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.user.model.service.MemberService;

/*sdf*//*sdf*/
@WebServlet("/updateMember.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1. 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF=8");
		
		// 2. request객체에서 파라미터 꺼내기
		String mMail = request.getParameter("email");
		String mPassword = request.getParameter("password");
		String mName = request.getParameter("name");
		String zip = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String mPhone = request.getParameter("phone");
		String mTel = request.getParameter("tel");
		String mAddress =  zip + "/" + addr1 +"/" + addr2;
		
		
		// 3. member 객체 생성해서 넘기기
		Member m = new Member();
		m.setM_email(mMail);
		m.setM_password(mPassword);
		m.setM_name(mName);
		m.setM_address(mAddress);
		m.setM_phone(mPhone);
		m.setM_tel(mTel);
		
		// 4. service 로직으로 전달
		int result = new MemberService().updateMember(m);
		System.out.println("result = " + result);
		
		// 5. 처리결과에 따라 뷰 페이지 결정
		// 6. 뷰 페이지로 전달 -> 두 개 묶어서 해보자 (성공하면 sendRedirect, 실패하면 forward)
		String page = "";
		
		if(result > 0) {
			// 세션 객체 받아옴
			HttpSession session = request.getSession(); 
			
			// 로그인 유저 정보 갱신 (setAttribute)
			//int loginUser = new MemberService().updateMember(m);
			session.setAttribute("loginUser", m);
			
			// sendRedirect로 다시 updateForm으로 이동
			System.out.println("안녕하세여 숭덩이에요 ");
			response.sendRedirect("views/user/jeong/myPage_info_edit.jsp");
			//request.setAttribute("loginUser", m);
			//request.getRequestDispatcher("views/user/jeong/myPage_info_edit.jsp").forward(request, response);
			
		} else {
			// 에러페이지로 연결
			page = "views/common/errorPage.jsp";
			
			// request객체에 메세지 전달
			request.setAttribute("msg", "회원정보수정 실패");
			
			// forward방식으로 뷰페이지로 전달
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
