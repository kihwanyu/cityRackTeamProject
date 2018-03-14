package com.kh.cityrack.order.admin.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5616929346867663487L;
	
	private String p_code; // 상품_코드
	private String p_name; // 상품_이름
	private int p_price; // 상품_가격
	private int o_amount; // 상품_수량
	private double p_discount; // 상품_할인율
	
	public Product() {
		super();
	}

	public Product(String p_code, String p_name, int p_price, int o_amount, double p_discount) {
		super();
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_price = p_price;
		this.o_amount = o_amount;
		this.p_discount = p_discount;
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

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getO_amount() {
		return o_amount;
	}

	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}

	public double getP_discount() {
		return p_discount;
	}

	public void setP_discount(double p_discount) {
		this.p_discount = p_discount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [p_code=" + p_code + ", p_name=" + p_name + ", p_price=" + p_price + ", s_amount=" + o_amount
				+ ", p_discount=" + p_discount + "]";
	}
	
		
}
