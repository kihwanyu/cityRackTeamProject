package com.kh.cityrack.order.user.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8146957136130411643L;
	
	private int o_no; // 주문_번호
	private int o_ono; // 주문_주문번호
	private Date o_orderDate; // 주문_주문일자
	private int m_no; // 회원_번호
	private String p_code; // 상품_코드
	private int d_no; // 배송_번호
	private int pay_no; // 결제_번호
	private String o_state; // 주문_상태
	private String o_note; //주문_비고
	
	
	
	public Order() {
		super();
	}
	public Order(int o_no, int o_ono, Date o_orderDate, int m_no, String p_code, int d_no, int pay_no, String o_state,
			String o_note) {
		super();
		this.o_no = o_no;
		this.o_ono = o_ono;
		this.o_orderDate = o_orderDate;
		this.m_no = m_no;
		this.p_code = p_code;
		this.d_no = d_no;
		this.pay_no = pay_no;
		this.o_state = o_state;
		this.o_note = o_note;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getO_ono() {
		return o_ono;
	}
	public void setO_ono(int o_ono) {
		this.o_ono = o_ono;
	}
	public Date getO_orderDate() {
		return o_orderDate;
	}
	public void setO_orderDate(Date o_orderDate) {
		this.o_orderDate = o_orderDate;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	public String getO_note() {
		return o_note;
	}
	public void setO_note(String o_note) {
		this.o_note = o_note;
	}
	@Override
	public String toString() {
		return "Order [o_no=" + o_no + ", o_ono=" + o_ono + ", o_orderDate=" + o_orderDate + ", m_no=" + m_no
				+ ", p_code=" + p_code + ", d_no=" + d_no + ", pay_no=" + pay_no + ", o_state=" + o_state + ", o_note="
				+ o_note + "]";
	}
	
	
}
