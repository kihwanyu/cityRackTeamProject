package com.kh.cityrack.board.admin.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2260798069377821589L;
	
	private int bo_no; // 게시판_번호
	private String bo_category; // 게시판_카테고리 문의게시판..
	private String bo_division; // 게시판_구분 게시글 답글 댓글
	private int bo_pno; // 게시판_부모번호 Self Join Not Null 조건 X
	private Date bo_date; // 게시판_작성일
	private int m_no; // 회원_번호
	private String m_email; // 회원_이메일
	private String bo_title; // 게시판_제목
	private String bo_content; // 게시판_내용
	private int bo_hit; // 게시판_조회수
	private int bo_recomm; // 게시판 추천수
	private String bo_status; // 삭제 여부
	private String bo_note; // 게시판_비고
	public Board() {
		super();
	}
	public Board(int bo_no, String bo_category, String bo_division, int bo_pno, Date bo_date, int m_no, String m_email,
			String bo_title, String bo_content, int bo_hit, int bo_recomm, String bo_status, String bo_note) {
		super();
		this.bo_no = bo_no;
		this.bo_category = bo_category;
		this.bo_division = bo_division;
		this.bo_pno = bo_pno;
		this.bo_date = bo_date;
		this.m_no = m_no;
		this.m_email = m_email;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.bo_hit = bo_hit;
		this.bo_recomm = bo_recomm;
		this.bo_status = bo_status;
		this.bo_note = bo_note;
	}

	public int getBo_no() {
		return bo_no;
	}
	public String getBo_category() {
		return bo_category;
	}
	public String getBo_division() {
		return bo_division;
	}
	public int getBo_pno() {
		return bo_pno;
	}
	public Date getBo_date() {
		return bo_date;
	}
	public int getM_no() {
		return m_no;
	}
	public String getM_email() {
		return m_email;
	}
	public String getBo_title() {
		return bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public int getBo_hit() {
		return bo_hit;
	}
	public int getBo_recomm() {
		return bo_recomm;
	}
	public String getBo_status() {
		return bo_status;
	}
	public String getBo_note() {
		return bo_note;
	}
	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}
	public void setBo_category(String bo_category) {
		this.bo_category = bo_category;
	}
	public void setBo_division(String bo_division) {
		this.bo_division = bo_division;
	}
	public void setBo_pno(int bo_pno) {
		this.bo_pno = bo_pno;
	}
	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public void setBo_hit(int bo_hit) {
		this.bo_hit = bo_hit;
	}
	public void setBo_recomm(int bo_recomm) {
		this.bo_recomm = bo_recomm;
	}
	public void setBo_status(String bo_status) {
		this.bo_status = bo_status;
	}
	public void setBo_note(String bo_note) {
		this.bo_note = bo_note;
	}
	@Override
	public String toString() {
		return "Board [bo_no=" + bo_no + ", bo_category=" + bo_category + ", bo_division=" + bo_division + ", bo_pno="
				+ bo_pno + ", bo_date=" + bo_date + ", m_no=" + m_no + ", m_email=" + m_email + ", bo_title=" + bo_title
				+ ", bo_content=" + bo_content + ", bo_hit=" + bo_hit + ", bo_recomm=" + bo_recomm + ", bo_status="
				+ bo_status + ", bo_note=" + bo_note + "]";
	}
	
	
}
