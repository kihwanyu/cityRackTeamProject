package com.kh.cityrack.product.admin.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.cityrack.product.admin.model.dto.Product;
import com.kh.cityrack.product.admin.model.service.ProductService;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/productDelete.pr")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pcode = request.getParameter("pcode");

		int result = 0;
		// 파일을 삭제하기위해서 객체 생성.
		Product p = new ProductService().productGet(pcode);
		
		//컨테이너의 루트 경로 추출
		String root = request.getSession().getServletContext().getRealPath("/");
		
		System.out.println("root:"+ root);
		
		//파일 저장할 경로 지정
		String savePath = root + "product_download_imgFiles/";
		
		result = new ProductService().productDelete(pcode);
		
		if(result > 0){
				//파일 삭제.
				new File(savePath + p.getP_pic1()).delete();
				new File(savePath + p.getP_pic2()).delete();
				
				response.sendRedirect(request.getContextPath()+"/productGetAll.pr");
		} else {
			request.setAttribute("msg", "상품 삭제 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
