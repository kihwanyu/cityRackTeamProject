package com.kh.cityrack.question.user.model.dto;

import java.io.Serializable;

// 설문조사
public class Question implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6254300401093642429L;
	
	private int q_no; // 설문_번호
	private int m_no; // 회원_번호
	private String q_8constitution; // 설문_8체질
	
	public Question() {
		super();
	}
	
	public Question(int q_no, int m_no, String q_8constitution) {
		super();
		this.q_no = q_no;
		this.m_no = m_no;
		this.q_8constitution = q_8constitution;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getQ_8constitution() {
		return q_8constitution;
	}

	public void setQ_8constitution(String q_8constitution) {
		this.q_8constitution = q_8constitution;
	}

	@Override
	public String toString() {
		return "Question [q_no=" + q_no + ", m_no=" + m_no + ", q_8constitution=" + q_8constitution + "]";
	}
}
