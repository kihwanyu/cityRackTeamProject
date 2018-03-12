package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.member.user.model.service.MemberService;
/*sdf*//*sdf*/
@WebServlet("/equalsPwd.do")
public class EqualsPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EqualsPasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		String userId = request.getParameter("userId");
		String result = new MemberService().passwordCheck(userId, password);
	
		PrintWriter out = response.getWriter();
		if(result != null){
			out.append("success");
		}else {
			out.append("fail");
		}
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
