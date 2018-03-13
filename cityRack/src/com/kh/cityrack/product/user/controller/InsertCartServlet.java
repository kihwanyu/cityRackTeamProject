package com.kh.cityrack.product.user.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.cityrack.product.user.model.service.CartService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/insertCart.em")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Map으로 장바구니에 담아 올 상품 가져오기
		Map m =  request.getParameterMap();
		
		//entrySet을 통해 맵을 set에 담음.
		Set s = m.entrySet();	
		//이터레이터에 s 담기
		Iterator it = s.iterator();

		//받아온 Map의 밸류 확인
		//Map.Entry인 entry 생성
		Map.Entry<String, String[]> entry = null;
		
		
		while(it.hasNext()){
			 
            entry = (Map.Entry<String,String[]>)it.next();

            //키와 밸류를 각자 제너릭에 저장.
            String key = entry.getKey();
            String[] value = entry.getValue();

            System.out.println(key);

            if(value.length>1){    
                    for (int i = 0; i < value.length; i++) {
                    	System.out.println( value[i].toString() );
                   }
             } else
              	System.out.println(value[0].toString());
			 }
		
		
		
		int result = new CartService().insertCart(m);
		
		
		
				
	/*	response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		new Gson().toJson(m, response.getWriter());*/
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
