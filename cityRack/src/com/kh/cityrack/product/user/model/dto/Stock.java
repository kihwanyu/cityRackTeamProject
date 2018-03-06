package com.kh.cityrack.product.user.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Stock implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7195783849037716272L;
	
	private int s_no; // 재고 번호
	private String s_division; // 재고_구분
	private String p_code; // 상품_코드
	private Date s_receivingDate; // 재고_입고일
	private Date s_selfLife; // 재고_유통기한
	private int s_amount; // 재고_수량
	private String s_state; // 재고_상태
	private String s_note; // 재고_비고
	
	/*재고_번호	s_no
	재고_구분	s_division
	상품_코드	p_code
	재고_입고일	s_receivingdate
	재고_유통기한	s_selflife
	재고_수량	s_amount
	재고_상태	s_state
	재고_비고	s_note*/
	
	public Stock() {
		super();
	}
	public Stock(int s_no, String s_division, String p_code, Date s_receivingDate, Date s_selfLife, int s_amount,
			String s_state, String s_note) {
		super();
		this.s_no = s_no;
		this.s_division = s_division;
		this.p_code = p_code;
		this.s_receivingDate = s_receivingDate;
		this.s_selfLife = s_selfLife;
		this.s_amount = s_amount;
		this.s_state = s_state;
		this.s_note = s_note;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_division() {
		return s_division;
	}
	public void setS_division(String s_division) {
		this.s_division = s_division;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public Date getS_receivingDate() {
		return s_receivingDate;
	}
	public void setS_receivingDate(Date s_receivingDate) {
		this.s_receivingDate = s_receivingDate;
	}
	public Date getS_selfLife() {
		return s_selfLife;
	}
	public void setS_selfLife(Date s_selfLife) {
		this.s_selfLife = s_selfLife;
	}
	public int getS_amount() {
		return s_amount;
	}
	public void setS_amount(int s_amount) {
		this.s_amount = s_amount;
	}
	public String getS_state() {
		return s_state;
	}
	public void setS_state(String s_state) {
		this.s_state = s_state;
	}
	public String getS_note() {
		return s_note;
	}
	public void setS_note(String s_note) {
		this.s_note = s_note;
	}
	@Override
	public String toString() {
		return "Stock [s_no=" + s_no + ", s_division=" + s_division + ", p_code=" + p_code + ", s_receivingDate="
				+ s_receivingDate + ", s_selfLife=" + s_selfLife + ", s_amount=" + s_amount + ", s_state=" + s_state
				+ ", s_note=" + s_note + "]";
	}
}
