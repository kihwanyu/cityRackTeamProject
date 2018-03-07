package com.kh.cityrack.product.admin.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5616929346867663487L;
	
	private String p_code; // 상품_코드
	private String ca_code; // 카테고리_코드
	private String ca_name; // 카테고리_이름
	private Date p_resisterDate; //등록일
	private String p_8constitution; // 상품_8체질
	private String p_name; // 상품_이름
	private String p_pic1; // 상품_사진1
	private String p_pic2; // 상품_사진2
	private int p_price; // 상품_가격
	private String p_event; // 상품_이벤트
	private double p_discount; // 상품_할인율
	private String p_status; // 상품_진열상태
	public Product() {
		super();
	}
	public Product(String p_code, String ca_code, String ca_name, Date p_resisterDate, String p_8constitution,
			String p_name, String p_pic1, String p_pic2, int p_price, String p_event, double p_discount,
			String p_status) {
		super();
		this.p_code = p_code;
		this.ca_code = ca_code;
		this.ca_name = ca_name;
		this.p_resisterDate = p_resisterDate;
		this.p_8constitution = p_8constitution;
		this.p_name = p_name;
		this.p_pic1 = p_pic1;
		this.p_pic2 = p_pic2;
		this.p_price = p_price;
		this.p_event = p_event;
		this.p_discount = p_discount;
		this.p_status = p_status;
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
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public Date getP_resisterDate() {
		return p_resisterDate;
	}
	public void setP_resisterDate(Date p_resisterDate) {
		this.p_resisterDate = p_resisterDate;
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
	public String getP_event() {
		return p_event;
	}
	public void setP_event(String p_event) {
		this.p_event = p_event;
	}
	public double getP_discount() {
		return p_discount;
	}
	public void setP_discount(double p_discount) {
		this.p_discount = p_discount;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Product [p_code=" + p_code + ", ca_code=" + ca_code + ", ca_name=" + ca_name + ", p_resisterDate="
				+ p_resisterDate + ", p_8constitution=" + p_8constitution + ", p_name=" + p_name + ", p_pic1=" + p_pic1
				+ ", p_pic2=" + p_pic2 + ", p_price=" + p_price + ", p_event=" + p_event + ", p_discount=" + p_discount
				+ ", p_status=" + p_status + "]";
	}
		
}
