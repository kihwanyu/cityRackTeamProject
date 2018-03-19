package com.kh.cityrack.order.user.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8146957136130411643L;
	
	private int o_no; // 주문_번호
	private String o_ono; // 주문_번호
	private Date o_orderDate; // 주문_주문일자
	private String m_email; // 회원_이메일
	private String p_code; // 상품_코드
	private String p_name; // 상품명
	private int pCount; // 상품 주문 개수
	private int pa_amount; // 결제_총액
	private int d_no; // 배송_번호
	private String invoice_no; // 운송장_번호
	private int pay_no; // 결제_번호
	private String o_state; // 주문_상태
	private Double c_discount; // 등급 할인율
	private String o_note; //주문_비고

	public Order() {
		super();
	}

	public Order(int o_no, String o_ono, Date o_orderDate, String m_email, String p_code, String p_name, int pCount,
			int pa_amount, int d_no, String invoice_no, int pay_no, String o_state, Double c_discount, String o_note) {
		super();
		this.o_no = o_no;
		this.o_ono = o_ono;
		this.o_orderDate = o_orderDate;
		this.m_email = m_email;
		this.p_code = p_code;
		this.p_name = p_name;
		this.pCount = pCount;
		this.pa_amount = pa_amount;
		this.d_no = d_no;
		this.invoice_no = invoice_no;
		this.pay_no = pay_no;
		this.o_state = o_state;
		this.c_discount = c_discount;
		this.o_note = o_note;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getO_ono() {
		return o_ono;
	}

	public void setO_ono(String o_ono) {
		this.o_ono = o_ono;
	}

	public Date getO_orderDate() {
		return o_orderDate;
	}

	public void setO_orderDate(Date o_orderDate) {
		this.o_orderDate = o_orderDate;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public int getPa_amount() {
		return pa_amount;
	}

	public void setPa_amount(int pa_amount) {
		this.pa_amount = pa_amount;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
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

	public Double getC_discount() {
		return c_discount;
	}

	public void setC_discount(Double c_discount) {
		this.c_discount = c_discount;
	}

	public String getO_note() {
		return o_note;
	}

	public void setO_note(String o_note) {
		this.o_note = o_note;
	}
	/**/
	@Override
	public String toString() {
		return "Order [o_no=" + o_no + ", o_ono=" + o_ono + ", o_orderDate=" + o_orderDate + ", m_email=" + m_email
				+ ", p_code=" + p_code + ", p_name=" + p_name + ", pCount=" + pCount + ", pa_amount=" + pa_amount
				+ ", d_no=" + d_no + ", invoice_no=" + invoice_no + ", pay_no=" + pay_no + ", o_state=" + o_state
				+ ", c_discount=" + c_discount + ", o_note=" + o_note + "]";
	}
	
	
	
}