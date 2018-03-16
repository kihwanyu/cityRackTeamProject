package com.kh.cityrack.order.user.model.dto;

import java.io.Serializable;

public class Payment implements Serializable{
	/**
	 * 
//	 */
	private static final long serialVersionUID = 9011085330244010946L;
	
	private String pg; // 결제_회사
	private String pay_method; // 결제_방법
	private String merchant_uid; // 결제_아이디
	private String name; // 결제_이름
	private int amount; // 결제_총금액
	private String buyer_name; // 구매자_이름
	private String buyer_tel; // 구매자_번호
	private String buyer_email; // 구매자이메일
	private String buyer_addr; // 구매자 주소
	private String buyer_postcode; // 구매자 우편번호
	private String pay_imp_uid; //  고유 아이디
	private String pay_apply_num; // 카드 승인번호
	
	public Payment() {
		super();
	}

	public Payment(String pg, String pay_method, String merchant_uid, String name, int amount,
			String buyer_name, String buyer_tel, String buyer_email, String buyer_addr, String buyer_postcode,
			String pay_imp_uid, String pay_apply_num) {
		super();
		this.pg = pg;
		this.pay_method = pay_method;
		this.merchant_uid = merchant_uid;
		this.name = name;
		this.amount = amount;
		this.buyer_name = buyer_name;
		this.buyer_tel = buyer_tel;
		this.buyer_email = buyer_email;
		this.buyer_addr = buyer_addr;
		this.buyer_postcode = buyer_postcode;
		this.pay_imp_uid = pay_imp_uid;
		this.pay_apply_num = pay_apply_num;
	}


	public String getPg() {
		return pg;
	}

	public void setPg(String pg) {
		this.pg = pg;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_tel() {
		return buyer_tel;
	}

	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}

	public String getbuyer_email() {
		return buyer_email;
	}

	public void setbuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getBuyer_addr() {
		return buyer_addr;
	}

	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}

	public String getBuyer_postcode() {
		return buyer_postcode;
	}

	public void setBuyer_postcode(String buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}

	public String getPay_imp_uid() {
		return pay_imp_uid;
	}

	public void setPay_imp_uid(String pay_imp_uid) {
		this.pay_imp_uid = pay_imp_uid;
	}

	public String getPay_apply_num() {
		return pay_apply_num;
	}

	public void setPay_apply_num(String pay_apply_num) {
		this.pay_apply_num = pay_apply_num;
	}

	@Override
	public String toString() {
		return "Payment [pg= " + pg + ", pay_method=" + pay_method + ", merchant_uid=" + merchant_uid
				+ ", name=" + name + ", amount=" + amount + ", buyer_name=" + buyer_name + ", buyer_tel=" + buyer_tel
				+ ", buyer_email=" + buyer_email + ", buyer_addr=" + buyer_addr + ", buyer_postcode="
				+ buyer_postcode + ", pay_imp_uid=" + pay_imp_uid + ", pay_apply_num=" + pay_apply_num + "]";
	}
	
}
