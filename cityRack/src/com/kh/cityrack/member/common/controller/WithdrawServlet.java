package com.kh.cityrack.member.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.member.common.model.dto.Withdraw;
import com.kh.cityrack.member.common.model.service.WithdrawService;
/*sdf*/
/*asdfasdf*/
@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WithdrawServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파라미터 꺼내기
		/* 1. 유저번호
		 * 2. 탈퇴사유
		 *  */
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String reason = request.getParameter("reason");
				
		System.out.println("withdrqwServlet's mNo : " + mNo);
		System.out.println("withdrqwServlet's reason : " + reason);
		
		// 객체에 파라미터로 받아온 두값을 set으로 넣어
		// 탈퇴사유용
		Withdraw w = new Withdraw();
		w.setM_no(mNo);
		w.setW_reason(reason);
		
		// 탈퇴여부 Y용
		Member m = new Member();
		m.setM_no(mNo);
		
		// 서비스 호출
		int result = new WithdrawService().deleteMember(w, m);
		
		// 페이지
		String page = "";
		if(result > 0) {
			page = "views/user/jeong/myPage_info_unregister2.jsp";
			request.getSession().invalidate();
			response.sendRedirect(page);
		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
