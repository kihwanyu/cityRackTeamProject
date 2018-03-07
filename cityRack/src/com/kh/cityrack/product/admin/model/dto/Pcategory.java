package com.kh.cityrack.product.admin.model.dto;

import java.io.Serializable;

// 상품 카테고리
public class Pcategory implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2762318666606013694L;
	
	private String ca_code; // 카테고리_코드
	private String ca_name; // 카테고리_이름
	
	
	public Pcategory() {
		super();
	}
	public Pcategory(String ca_code, String ca_name) {
		super();
		this.ca_code = ca_code;
		this.ca_name = ca_name;
	}
	public String getCa_code() {
		return ca_code;
	}
	public void setCa_code(String ca_code) {
		this.ca_code = ca_code;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	@Override
	public String toString() {
		return "Pcategory [ca_code=" + ca_code + ", ca_name=" + ca_name + "]";
	}
	
	
}
