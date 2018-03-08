package com.kh.cityrack.member.common.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Withdraw implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2598590760723053425L;
	
	private int w_no; // 탈퇴정보_번호asdasd
	private int m_no; // 회원_번호
	private Date w_date; // 탈퇴정보_탈퇴일자
	private String w_reason; // 탈퇴정보_탈퇴사유
	private String w_note; // 탈퇴정보_비고
	
	public Withdraw() {
		super();
	}

	public Withdraw(int w_no, int m_no, Date w_date, String w_reason, String w_note) {
		super();
		this.w_no = w_no;
		this.m_no = m_no;
		this.w_date = w_date;
		this.w_reason = w_reason;
		this.w_note = w_note;
	}

	public int getW_no() {
		return w_no;
	}

	public void setW_no(int w_no) {
		this.w_no = w_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public Date getW_date() {
		return w_date;
	}

	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}

	public String getW_reason() {
		return w_reason;
	}

	public void setW_reason(String w_reason) {
		this.w_reason = w_reason;
	}

	public String getW_note() {
		return w_note;
	}

	public void setW_note(String w_note) {
		this.w_note = w_note;
	}

	@Override
	public String toString() {
		return "Withdraw [w_no=" + w_no + ", m_no=" + m_no + ", w_date=" + w_date + ", w_reason=" + w_reason
				+ ", w_note=" + w_note + "]";
	}
		
}
