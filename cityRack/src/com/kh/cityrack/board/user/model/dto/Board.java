package com.kh.cityrack.board.user.model.dto;

import java.io.Serializable;

import java.sql.Date;

public class Board implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2260798069377821589L;
	
	private int bo_no; // 게시판_번호
	private int bo_pno; // 게시판_부모번호 Self Join Not Null 조건 X
	private String bo_division; // 게시판_구분 게시글 답글 댓글
	private String bo_category; // 게시판_카테고리 문의게시판..
	private int m_no; // 회원_번호
	private Date bo_date; // 게시판_작성일
	private String bo_title; // 게시판_제목
	private String bo_content; // 게시판_내용
	private int bo_hit; // 게시판_조회수
	private int bo_recomm; // 게시판 추천수
	
	
	
/*	BO_NO
	BO_PNO
	BO_DIVISION
	BO_CATEGORY
	M_NO
	BO_DATE
	BO_TITLE
	BO_CONTENT
	BO_HIT
	BO_RECOMM*/
	
	public Board() {
		super();
	}



public Board(int bo_no, int bo_pno, String bo_division, String bo_category, int m_no, Date bo_date, String bo_title,
		String bo_content, int bo_hit, int bo_recomm) {
	super();
	this.bo_no = bo_no;
	this.bo_pno = bo_pno;
	this.bo_division = bo_division;
	this.bo_category = bo_category;
	this.m_no = m_no;
	this.bo_date = bo_date;
	this.bo_title = bo_title;
	this.bo_content = bo_content;
	this.bo_hit = bo_hit;
	this.bo_recomm = bo_recomm;
}



public static long getSerialversionuid() {
	return serialVersionUID;
}



public int getBo_no() {
	return bo_no;
}



public int getBo_pno() {
	return bo_pno;
}



public String getBo_division() {
	return bo_division;
}



public String getBo_category() {
	return bo_category;
}



public int getM_no() {
	return m_no;
}



public Date getBo_date() {
	return bo_date;
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



public void setBo_no(int bo_no) {
	this.bo_no = bo_no;
}



public void setBo_pno(int bo_pno) {
	this.bo_pno = bo_pno;
}



public void setBo_division(String bo_division) {
	this.bo_division = bo_division;
}



public void setBo_category(String bo_category) {
	this.bo_category = bo_category;
}



public void setM_no(int m_no) {
	this.m_no = m_no;
}



public void setBo_date(Date bo_date) {
	this.bo_date = bo_date;
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



@Override
public String toString() {
	return "Board [bo_no=" + bo_no + ", bo_pno=" + bo_pno + ", bo_division=" + bo_division + ", bo_category="
			+ bo_category + ", m_no=" + m_no + ", bo_date=" + bo_date + ", bo_title=" + bo_title + ", bo_content="
			+ bo_content + ", bo_hit=" + bo_hit + ", bo_recomm=" + bo_recomm + "]";
}


	
	
	
}
