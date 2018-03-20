package com.kh.cityrack.question.user.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.question.user.model.dto.Question;
import com.kh.cityrack.question.user.model.service.QuestionService;
/*sdf*//*sdf*/
@WebServlet("/qResult.tn")
public class ConstitutionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConstitutionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파라미터 꺼내기
		/* 1. 유저번호
		* 2. 체질결과
		*  */
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String qResult = request.getParameter("qResult");
		
		System.out.println("ConstitutionServlet's mNo : " + mNo);
		System.out.println("ConstitutionServlet's qResult : " + qResult);
		
		
		// 객체에 파라미터로 받아온 두값을 set으로 넣어
		Question q = new Question();
		q.setM_no(mNo);
		q.setQ_8constitution(qResult);
		
		
		// 서비스 호출
		int result = new QuestionService().insertConstitution(q);
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		m.setQ_8constitution(qResult);

		// 페이지
		String page = "";
		if(result > 0) {
			request.setAttribute("qResult", qResult);
			System.out.println("ConstitutionServlet's qResult(if문) : " + qResult);
	
			// 설문조사결과 세션에도 담기
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", m);
			
			page = "views/user/jeong/myPage_result.jsp";
			request.getRequestDispatcher(page).forward(request, response);
			
		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
