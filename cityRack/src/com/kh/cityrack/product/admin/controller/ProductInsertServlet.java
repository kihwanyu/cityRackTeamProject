package com.kh.cityrack.product.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.cityrack.common.ProductRenamePolicy;
import com.kh.cityrack.product.admin.model.dto.Product;
import com.kh.cityrack.product.admin.model.service.ProductService;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductInsertServlet
 */
@WebServlet("/productResister.pr")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//폼전송을 multipart/form-data로 전송하는 경우에는
		//기존처럼request.getParameter로 값을 받을 수 없다.
		//cos.jar가 파일도 받고 폼의 다른값을 도 받아주는 역할을 한다.
		//com.orelilly.serbvlet의 약자
		//http://www.servlets.com/cos/
		
		if(ServletFileUpload.isMultipartContent(request)){
			//전송 파일 용량 제한 : 10Mbyte 제한한 경우
			int maxSize = 1024 * 1024 * 10;
			
			//컨테이너의 루트 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println("root:"+ root);
			
			//파일 저장할 경로 지정
			String savePath = root + "product_download_imgFiles/";
			//객체 생성시 파일을 저장하고 그에 대한정보를 가져오는 형태
			//즉, 파일의 정보를 검사하여 저장하는 형태가 아닌
			//저장한 다음 검사 후 삭제를 해야 한다.
			
			//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			//1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸수 있음
			//2. 한글로 된 파일명, 특수 기호나 띄어쓰기 등은
			// 	  서버에 따라 문제가 생길수 도 있다.
			
			//DefaultFileRenamePolicy는 cos.jar안에 존재하는 클래스
			//같은 파일명이 존재하는지를 검사하고 있는경우에는
			//파일명 뒤에 숫자를 붙여준다.
			//ex : aaa.zip, aaa1.zip, aaa2,zip
			
			//DefaultFileRenamePolicy
			//MultipartRequst multiRequest
			
			//MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			// DefaultFileRenamePolicy() 리네임 객체 같은이름이 있을시 뒤에 번호를 붙여줌.
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new ProductRenamePolicy());
			
			//다중파일을 묶어서 업로드를 하기 위해서 컬렉션을 사용한다.
			//저장한 파일 이름을 저장할 arrayList 생성
			ArrayList<String> productFilesName = new ArrayList<String>();
			
			//파일이 전송된 폼의 이름을 반환한다.
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while (files.hasMoreElements()) {
				String string = (String) files.nextElement();

				//System.out.println(string);
				
				// 지정한 경로에 저장된 파일 시스템의 이름을 가져와서 
				// arrayList에 담는다.
				//세이브파일과 오리진 파일을 객체로 만들면 편할거같음..
				productFilesName.add(multipartRequest.getFilesystemName(string));
			}
			
			//multipartRequest객체에서 파일 외의 값도 꺼내온다.
			String status = multipartRequest.getParameter("status");
			String categoryNo = multipartRequest.getParameter("category");
			String constitution = multipartRequest.getParameter("constitution");
			String pname = multipartRequest.getParameter("pname");
			String price = multipartRequest.getParameter("price");
			String saleValues = null;
					
			String[] eventArr = multipartRequest.getParameterValues("event");
			String event = "";
			
			/*System.out.println("status: "+ status);
			System.out.println("category: "+ categoryNo);
			System.out.println("constitution: "+ constitution);
			System.out.println("pname: "+ pname);
			System.out.println("price: "+ price);*/
			
			Product p = new Product();
			
			for(int i = 0; i < eventArr.length; i++){
				if(eventArr[i].equals("sale")){
					saleValues = multipartRequest.getParameter("saleValues");
					p.setP_discount(Double.parseDouble(saleValues));
				}
				if(i < eventArr.length-1){
					event += eventArr[i] + " ";
				} else {
					event += eventArr[i];
				}
			}
			
			/*System.out.println("event: "+ event);
			System.out.println("saleValues: "+ saleValues);*/
			
			
			p.setP_name(pname);
			p.setP_price(Integer.parseInt(price));
			p.setCa_code(categoryNo);
			p.setP_8constitution(constitution);
			p.setP_event(event);
			p.setP_status(status);
			// 첨부파일의 정보를 저장할 arrayList객체를 생성
			//전송 순서를 역순으로 파일이 Enumeration에 저장되기 때문에 
			//반복문을 역으로 수행한다.
			p.setP_pic1(productFilesName.get(1));
			p.setP_pic2(productFilesName.get(0));
			
			
			int result = new ProductService().productInsert(p);
			
			//System.out.println("result : " + result);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/productGetAll.pr");
				
			} else {
				//실패시 저장된 사진 삭제.
				for (int i = 0; i < productFilesName.size(); i++) {
					//파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(savePath + productFilesName.get(i));
					
					System.out.println(failedFile);
					//true, false 리턴함
					//System.out.println("failedFile[" + i + "] : " + failedFile.delete());
				}
				// 에러 페이지 로 전달.
				request.setAttribute("msg", "상품 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
