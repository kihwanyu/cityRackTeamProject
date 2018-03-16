package com.kh.cityrack.product.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.kh.cityrack.member.common.model.dto.Member;
import com.kh.cityrack.product.user.model.dto.Cart;
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
		//세션에서 멤버 정보 가져오기
		Member m = (Member) request.getSession().getAttribute("loginUser");
		System.out.println(m);
		
		//Map으로 장바구니에 담아 올 상품 가져오기
				
		HashMap<String, String[]> hmap = new HashMap<>(request.getParameterMap());
		
		System.out.println(hmap);
		//entrySet을 통해 맵을 set에 담음.
				Set s = hmap.entrySet();	
				//이터레이터에 s 담기
				Iterator it = s.iterator();

				//받아온 Map의 밸류 확인
				//Map.Entry인 entry 생성
				Map.Entry<String, String[]> entry = null;
				
				//foodprice에 담을 맵,  foodname에 담을 맵 생성.
				HashMap<String, Integer> foodamount= new HashMap<String, Integer>();
				HashMap<String, Integer> foodname= new HashMap<String, Integer>();
				
				while(it.hasNext()){
					 
		            entry = (Map.Entry<String , String[]>)it.next();

		            //키와 밸류를 각자 제너릭에 저장.
		            String key = entry.getKey();
		            String[] value = entry.getValue();

		            //키값이 'amount'를 포함하면
		            if(key.contains("amount")) {
		            	
		            	if(value.length>1) {
		            		for(int i = 0; i<value.length;i++) {
		            			foodamount.put(key, Integer.parseInt(value[i]));
		            		}
		            	} else {
		            		foodamount.put(key, Integer.parseInt(value[0]));
		            	}
		            	
		            	
		            } else if(key.contains("name") ){
		            	if(value.length>1) {
		            		for(int i =0; i<value.length;i++) {
		            			foodname.put(key, Integer.parseInt(value[i]));
		            		}
		            	} else {
		            		foodname.put(key, Integer.parseInt(value[0]));
		            	}
		            }

				}
		
				System.out.println("foodname@Servlet" + foodname);
				System.out.println("foodamount@Servlet" + foodamount);
		
				
		//카트에 담은 물품 넣기
		int result = new CartService().insertCart( foodamount, foodname, m);
		String page = "";
		
		//카트 리스트 불러오기
		ArrayList<Cart> c = new CartService().selectCart(m);
		
		System.out.println("cart @InsertCartServlet : " +c );
		
		if(result > 0) {
			page="getProducts.pr";
			request.setAttribute("cart", c);
			
		} else {
			page = "views/common/errorPage";
			request.setAttribute("msg", "카트 넣기 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
				
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		new Gson().toJson(m, response.getWriter()); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
