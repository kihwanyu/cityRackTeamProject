package com.kh.cityrack.order.user.model.dto;

import java.io.Serializable;

public class Payment implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9011085330244010946L;
	
	private int pay_no; // 결제_번호
	private String pay_pg; // 결제_회사
	private String pay_method; // 결제_방법
	private String merchant_uid; // 결제_아이디
	private String pay_name; // 결제_이름
	private String pay_amount; // 결제_총금액
	
	public Payment() {
		super();
	}
	public Payment(int pay_no, String pay_pg, String pay_method, String merchant_uid, String pay_name,
			String pay_amount) {
		super();
		this.pay_no = pay_no;
		this.pay_pg = pay_pg;
		this.pay_method = pay_method;
		this.merchant_uid = merchant_uid;
		this.pay_name = pay_name;
		this.pay_amount = pay_amount;
	}
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getPay_pg() {
		return pay_pg;
	}
	public void setPay_pg(String pay_pg) {
		this.pay_pg = pay_pg;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public String getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}
	@Override
	public String toString() {
		return "PayMent [pay_no=" + pay_no + ", pay_pg=" + pay_pg + ", pay_method=" + pay_method + ", merchant_uid="
				+ merchant_uid + ", pay_name=" + pay_name + ", pay_amount=" + pay_amount + "]";
	}
	
	
	/*결제_번호	pay_no
	결제_회사	pay_pg
	결제_방법	pay_method
	결제_아이디	merchant_uid
	결제_이름	pay_name
	결제_총금액	pay_amount*/
}
