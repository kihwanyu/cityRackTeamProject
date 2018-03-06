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
	private String ca_note; // 카테고리_비고
	public Pcategory() {
		super();
	}
	public Pcategory(String ca_code, String ca_name, String ca_note) {
		super();
		this.ca_code = ca_code;
		this.ca_name = ca_name;
		this.ca_note = ca_note;
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
	public String getCa_note() {
		return ca_note;
	}
	public void setCa_note(String ca_note) {
		this.ca_note = ca_note;
	}
	@Override
	public String toString() {
		return "Pcategory [ca_code=" + ca_code + ", ca_name=" + ca_name + ", ca_note=" + ca_note + "]";
	}
	
	
}
