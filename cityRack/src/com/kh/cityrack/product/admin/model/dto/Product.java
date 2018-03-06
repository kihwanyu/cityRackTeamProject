package com.kh.cityrack.product.admin.model.dto;

import java.io.Serializable;

public class Product implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5616929346867663487L;
	
	private String p_code; // 상품_코드
	private String ca_code; // 카테고리_코드 
	private String p_8constitution; // 상품_8체질
	private String p_name; // 상품_이름
	private String p_pic1; // 상품_사진1
	private String p_pic2; // 상품_사진2
	private int p_price; // 상품_가격
	private String p_new_check; // 상품_NEW 
	private String p_sale_check; // 상품_SALE
	private String p_hit_check; // 상품_HIT
	private double p_discount; // 상품_할인율
	private String p_note; // 상품_비고
	
	public Product() {
		super();
	}

	public Product(String p_code, String ca_code, String p_8constitution, String p_name, String p_pic1, String p_pic2,
			int p_price, String p_new_check, String p_sale_check, String p_hit_check, double p_discount,
			String p_note) {
		super();
		this.p_code = p_code;
		this.ca_code = ca_code;
		this.p_8constitution = p_8constitution;
		this.p_name = p_name;
		this.p_pic1 = p_pic1;
		this.p_pic2 = p_pic2;
		this.p_price = p_price;
		this.p_new_check = p_new_check;
		this.p_sale_check = p_sale_check;
		this.p_hit_check = p_hit_check;
		this.p_discount = p_discount;
		this.p_note = p_note;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getCa_code() {
		return ca_code;
	}

	public void setCa_code(String ca_code) {
		this.ca_code = ca_code;
	}

	public String getP_8constitution() {
		return p_8constitution;
	}

	public void setP_8constitution(String p_8constitution) {
		this.p_8constitution = p_8constitution;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_pic1() {
		return p_pic1;
	}

	public void setP_pic1(String p_pic1) {
		this.p_pic1 = p_pic1;
	}

	public String getP_pic2() {
		return p_pic2;
	}

	public void setP_pic2(String p_pic2) {
		this.p_pic2 = p_pic2;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_new_check() {
		return p_new_check;
	}

	public void setP_new_check(String p_new_check) {
		this.p_new_check = p_new_check;
	}

	public String getP_sale_check() {
		return p_sale_check;
	}

	public void setP_sale_check(String p_sale_check) {
		this.p_sale_check = p_sale_check;
	}

	public String getP_hit_check() {
		return p_hit_check;
	}

	public void setP_hit_check(String p_hit_check) {
		this.p_hit_check = p_hit_check;
	}

	public double getP_discount() {
		return p_discount;
	}

	public void setP_discount(double p_discount) {
		this.p_discount = p_discount;
	}

	public String getP_note() {
		return p_note;
	}

	public void setP_note(String p_note) {
		this.p_note = p_note;
	}

	@Override
	public String toString() {
		return "Product [p_code=" + p_code + ", ca_code=" + ca_code + ", p_8constitution=" + p_8constitution
				+ ", p_name=" + p_name + ", p_pic1=" + p_pic1 + ", p_pic2=" + p_pic2 + ", p_price=" + p_price
				+ ", p_new_check=" + p_new_check + ", p_sale_check=" + p_sale_check + ", p_hit_check=" + p_hit_check
				+ ", p_discount=" + p_discount + ", p_note=" + p_note + "]";
	}
	
	
	
}
