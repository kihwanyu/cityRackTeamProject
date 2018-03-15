package com.kh.cityrack.board.user.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.cityrack.board.user.model.dto.BoardFile;
import com.kh.cityrack.board.user.model.dto.Board;
import com.kh.cityrack.board.user.model.service.BoardService;
import com.kh.cityrack.board.user.model.service.ThumbBoardService;
import com.kh.cityrack.common.MyFileRenamePolicy;
import com.kh.cityrack.member.common.model.dto.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/insertThumb")
public class InsertThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertThumbnailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 폼전송을 multipart/form-data로 전송하는 경우에는 기존처럼 request.getParameter로 값을 받을 수 없다..!
		// con.jar가 파일도 받고 폼의 다른 값들도 받아주는 역할을 한다.
		// com.orelilly.servlet의 약자이며 클래스 파일이다
		// cos다운받고 lib에 cos.jar파일 넣어주기
		if(ServletFileUpload.isMultipartContent(request)) {

			// 전송 파일 용량 제한 : 10Mbyte 제한한 경우
			// 전송된 파일의 사이즈 지정 (bit기준)
			int maxSize = 1024 * 1024 * 10; // 10메가

			// 컨테이너의 루트 경로 추출 (/는 마지막에 오는 /까지 포함)
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("InsertThumbnailServlet's root : " + root); 
			// 출력결과 -> D:\JSPworkspace\jspProject\web\ (실제경로로 출력 됨 -> 상대위치가 아닌 절대위치가 필요)

			// 가져온 루트밑에 파일을 저장할 경로 설정
			String savePath = root + "thumbnail_uploadFiles/";

			// 사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			// 이유 1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있음
			// 2. 한글 또는 특수기호, 띄어쓰기가 포함된 이름이면 서버에 따라 문제가 생길수도 있다.
			// DefaultFileRenamePolicy는 cos.jar안에 존재하는 클래스이며,
			// 같은 파일이 있는지 확인하고, 만약 있다면 파일명 뒤에 숫자를 붙여준다.
			// ex) aaa.zip, aaa1.zip, aaa2.zip... 이런식으로

			// < DefaultFileRenamePolicy > 
			//MultipartRequest multiRequest 						// 인코딩 뒤에 파일리네임 객체까지
			//= new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			// 이렇게하면 내가 지정한 경로에 업로드된 사진들이 저장됨

			// < FileRenamePolicy를 상속 후 오버라이딩 >
			MultipartRequest multiRequest 						// 인코딩 뒤에 파일리네임 객체까지
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			// 다중 파일을 묶어서 업로드하기위해 컬렉션사용
			// 리네임되어 저장한 파일 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();

			// 사용자가 올린 진짜 원본이름을 저장할 arrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();

			// 파일이 전송된 폼의 이름을 반환
			// 디비에는 원래이름과 저장된이름을 저장 (Enumeration라는 반복을 할 수 있게 나열해놓은 객체배열을 사용)
			Enumeration<String> files = multiRequest.getFileNames(); // multipart로 전송된 파일들의 이름을 가져옴

			// 값꺼내기 (set처럼 순서상관없음) 네임속성으로 하나씩 꺼내기위해서 이렇게 가져옴
			while(files.hasMoreElements()) {
				String name = files.nextElement();

				// 잘가져오나 확인
				System.out.println("InsertThumbnailServlet's fileName : " + name);

				// 지정한 경로에 저장된 파일 시스템의 이름을 가져와서 arrayList에 담는다
				saveFiles.add(multiRequest.getFilesystemName(name)); // 변경된 이름만 가져옴
				originFiles.add(multiRequest.getOriginalFileName(name));

				System.out.println("filesystem : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
			}


			// multipartRequest 객체에서 파일 외의 값도 가져옴
			String multiTile = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");

			System.out.println(multiTile + " / " + multiContent);

			// Board 객체 생성
			Board b = new Board();
			b.setBo_title(multiTile);
			b.setBo_content(multiContent);
			
			
	/*		private int bo_no; // 게시판_번호
			private int bo_pno; // 게시판_부모번호 Self Join Not Null 조건 X
			private String bo_division; // 게시판_구분 게시글 답글 댓글
			private String bo_category; // 게시판_카테고리 문의게시판..
			private int m_no; // 회원_번호
			private Date bo_date; // 게시판_작성일
			private String bo_title; // 게시판_제목
			private String bo_content; // 게시판_내용
			private int bo_hit; // 게시판_조회수
			private int bo_recomm; // 게시판 추천수
			private String m_name; //게시판_작성자이름
			private String bo_status; //답변상태		
			*/
			

			HttpSession session = request.getSession();
			Member m = (Member)session.getAttribute("loginUser");
			String uno = String.valueOf(m.getM_no());
			b.setM_name(uno);
			System.out.println("uno : " + uno);
			// 위에 네줄을 한줄로도 쓸 수 있음
			// b.setbWriter(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUno()));

			// 첨부파일의 정보를 저장할 arrayList객체 생성
			ArrayList<BoardFile> fileList = new ArrayList<BoardFile>();

			// 전송 순서가 역순으로 파일이 Enumeration에 저장되기 때문에 반복문을 역으로 수행
			// 디폴트는 역순저장이라서 반복문을 반대로해서 오름차순 저장으로
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				BoardFile at = new BoardFile();
				at.setBf_originname(originFiles.get(i));
				at.setBf_name(saveFiles.get(i));
				
				System.out.println("at : " + at);
				fileList.add(at);
				
			}
			
			System.out.println("fileList : " + fileList);
			
			// 가공한 데이터들을 service로 전송
			int result = new ThumbBoardService().insertThumb(m, b, fileList);
				
			System.out.println("insertThumbnailServlet's result : " + result);
			
			// 업로드 실패했을때는 업로드파일에 사진저장 안되게
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectThumbList");
			} else {
				
				for(int i = 0; i < saveFiles.size(); i++) {
					// 파일시스템에 저장된 이름으로 파일 객체 생성
					// 오리지널 네임으로는 못하고 리네임된걸로 해야함
					File failedFile = new File(savePath + saveFiles.get(i));
					
					System.out.println("failedFile : " + failedFile);
					
					//failedFile.delete(); //결과를 t/f로 리턴(삭제성공은 t/실패면 f)
					System.out.println(failedFile.delete()); // 이렇게하면 삭제도 하면서 출력도 함
					
				}
				
				// 실패한사진들 지우고 에러페이지로 이동
				request.setAttribute("msg", "사진 업로드 실패...");
				request.getRequestDispatcher("views/user/common/errorPage.jsp").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
