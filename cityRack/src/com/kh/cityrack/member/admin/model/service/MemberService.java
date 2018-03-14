package com.kh.cityrack.member.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cityrack.member.admin.model.dao.MemberDao;
import com.kh.cityrack.member.admin.model.dto.Member;
import com.kh.cityrack.member.admin.model.dto.Search;
import com.kh.cityrack.member.admin.model.dto.Withdraw;

import static com.kh.cityrack.common.JDBCTemplet.*;

public class MemberService {

	public ArrayList<Member> memberGetAll(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().memberGetAll(conn, currentPage);
		
		close(conn);
		return list;
	}

	public Member memberGet(int memberCode) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().memberGet(conn, memberCode);
		
		close(conn);
		return m;
	}

	public int memberUpdate(int memberCode, String memberStatus, String withdrawReason) {
		Connection conn = getConnection();
		int result1 = 0;
		int result2 = 0;
		int existence = 0;
		
		existence = new MemberDao().checkWithdraw(conn, memberCode);
		System.out.println(existence);
		
		if(existence == 0){
			result1 = new MemberDao().withdrawMemberInsert(conn, memberCode, withdrawReason);
		}else{
			result1 = new MemberDao().withdrawMemberUpdate(conn, memberCode, withdrawReason);
		}
		
		if(result1 > 0){
			result2 = new MemberDao().memberUpdate(conn, memberCode, memberStatus);
			
			if(result1 > 0 && result2 > 0){
				commit(conn);
			}else{
				rollback(conn);
			}
		}
		
		
		close(conn);
		return result1 + result2;
	}

	public ArrayList<Withdraw> withdrawMemberGetAll(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Withdraw> list = new MemberDao().withdrawMemberGetAll(conn, currentPage);
		
		close(conn);
		return list;
	}

	public int getTotalCount() {
		Connection conn = getConnection();
		
		int totalCount = new MemberDao().getTotalCount(conn);
		
		close(conn);
		return totalCount;
	}
	
	public int getWithdrawTotalCount() {
		Connection conn = getConnection();
		
		int totalCount = new MemberDao().getWithdrawTotalCount(conn);
		
		close(conn);
		return totalCount;
	}

	public HashMap memberSearch(Search search, int thrownCurrentPage) {
		Connection conn = getConnection();
		
		int result = new MemberDao().memberSearch(conn, search);
		
		int totalCount = result;
		int totalPage;
		int listCount = 10;
		int pageCount = 10;
		int startPage; 
		int endPage;
		int currentPage = 1;
		
		//현재 페이지 초기값 1
		currentPage = thrownCurrentPage;
		
		//총 페이지 수 설정
		totalPage = totalCount/listCount;
		
		//여유분 인덱스추가
		if(totalCount%listCount > 0){
			totalPage++;
		}
		
		//현재 페이지가 총 페이지보다 클 경우 치환 
		if(totalPage < currentPage){
			currentPage = totalPage;
		}
		
		//시작 페이지와 끝페이지 설정
		startPage = ((currentPage - 1) / pageCount) * pageCount + 1;
		endPage = startPage + pageCount - 1;
		
		//끝페이지가 총 페이지보다 클 경우 치환
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		ArrayList<Member> list = new MemberDao().memberSearch(conn, search, currentPage);
		HashMap hmap = new HashMap();
		hmap.put("list", list);
		hmap.put("startPage", startPage);
		hmap.put("endPage", endPage);
		hmap.put("totalPage", totalPage);
		
		close(conn);
		return hmap;
	}
	
	public HashMap withdrawMemberSearch(Search search, int thrownCurrentPage) {
		Connection conn = getConnection();
		
		int result = new MemberDao().withdrawMemberSearch(conn, search);
		
		int totalCount = result;
		int totalPage;
		int listCount = 10;
		int pageCount = 10;
		int startPage; 
		int endPage;
		int currentPage = 1;
		
		//현재 페이지 초기값 1
		currentPage = thrownCurrentPage;
		
		//총 페이지 수 설정
		totalPage = totalCount/listCount;
		
		//여유분 인덱스추가
		if(totalCount%listCount > 0){
			totalPage++;
		}
		
		//현재 페이지가 총 페이지보다 클 경우 치환 
		if(totalPage < currentPage){
			currentPage = totalPage;
		}
		
		//시작 페이지와 끝페이지 설정
		startPage = ((currentPage - 1) / pageCount) * pageCount + 1;
		endPage = startPage + pageCount - 1;
		
		//끝페이지가 총 페이지보다 클 경우 치환
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		ArrayList<Withdraw> list = new MemberDao().withdrawMemberSearch(conn, search, currentPage);
		HashMap hmap = new HashMap();
		hmap.put("list", list);
		hmap.put("startPage", startPage);
		hmap.put("endPage", endPage);
		hmap.put("totalPage", totalPage);
		
		close(conn);
		return hmap;
	}

	


}
