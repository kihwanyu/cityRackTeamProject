package com.kh.cityrack.order.user.model.dto;

import java.io.Serializable;

public class Delivery implements Serializable{
	/**
	 *
	 *///
	private static final long serialVersionUID = 1819006040304224696L;
	
	private String d_addrName;
	private String d_addrTel;
	private String d_addrPhone;
	private String d_addrAddress;
	private String d_addrMSg;
	
	/*배송_번호	d_no
	배송_송장번호	d_invoice_no
	배송_수취인	d_ addr_name
	배송_수취인_전화번호	d_ addr_tel
	배송_수취인_핸드폰	d_addr_phone
	배송_수취인_주소	d_addr_address
	배송_수취인_메세지	d_addr_msg*/
	
	public Delivery() {
		super();
	}

	public Delivery(String d_addrName, String d_addrTel, String d_addrPhone, String d_addrAddress, String d_addrMSg) {
		super();
		this.d_addrName = d_addrName;
		this.d_addrTel = d_addrTel;
		this.d_addrPhone = d_addrPhone;
		this.d_addrAddress = d_addrAddress;
		this.d_addrMSg = d_addrMSg;
	}

	public String getD_addrName() {
		return d_addrName;
	}

	public void setD_addrName(String d_addrName) {
		this.d_addrName = d_addrName;
	}

	public String getD_addrTel() {
		return d_addrTel;
	}

	public void setD_addrTel(String d_addrTel) {
		this.d_addrTel = d_addrTel;
	}

	public String getD_addrPhone() {
		return d_addrPhone;
	}

	public void setD_addrPhone(String d_addrPhone) {
		this.d_addrPhone = d_addrPhone;
	}

	public String getD_addrAddress() {
		return d_addrAddress;
	}

	public void setD_addrAddress(String d_addrAddress) {
		this.d_addrAddress = d_addrAddress;
	}

	public String getD_addrMSg() {
		return d_addrMSg;
	}

	public void setD_addrMSg(String d_addrMSg) {
		this.d_addrMSg = d_addrMSg;
	}

	@Override
	public String toString() {
		return "Delivery [d_addrName=" + d_addrName + ", d_addrTel=" + d_addrTel + ", d_addrPhone=" + d_addrPhone
				+ ", d_addrAddress=" + d_addrAddress + ", d_addrMSg=" + d_addrMSg + "]";
	}
	
}
