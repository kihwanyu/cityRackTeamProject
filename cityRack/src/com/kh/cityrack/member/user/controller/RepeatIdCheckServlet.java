package com.kh.cityrack.member.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cityrack.member.user.model.dto.Member;
import com.kh.cityrack.member.user.model.service.MemberService;

/**
 * Servlet implementation class RepeatIdCheckServlet
 */
@WebServlet("/checkRepeatId.em")
public class RepeatIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepeatIdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emailCheck = request.getParameter("id");
		com.kh.cityrack.member.common.model.dto.Member takenId = new MemberService().checkRepeatId(emailCheck);
		
		System.out.println(emailCheck);
		System.out.println(takenId);
		
		
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		new Gson().toJson(takenId.getM_email(), response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
