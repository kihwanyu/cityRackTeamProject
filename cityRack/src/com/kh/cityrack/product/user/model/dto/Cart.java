package com.kh.cityrack.product.user.model.dto;

import java.io.Serializable;

public class Cart implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8077554781451084317L;
	
	private int cart_no; // 장바구니_번호
	private int m_no; // 회원_번호
	private String product_code; // 상품_코드
	private int cart_amount; // 장바구니_상품수량
	private String pic1; //
	private double discount;
	private int price;
	private String pName;
	
	
	public Cart() {
		super();
	}
	public Cart(int cart_no, int m_no, String product_code, int cart_amount, String pic1, double discount, int price, String pName) {
		super();
		this.cart_no = cart_no;
		this.m_no = m_no;
		this.product_code = product_code;
		this.cart_amount = cart_amount;
		this.price = price;
		this.pic1 = pic1;
		this.discount = discount;
		this.price =price;
		this.pName = pName;
		
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	
	
	public int getPrice(){
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPic1() {
		return pic1;
	}
	public double getDiscount() {
		return discount;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	
	
	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", m_no=" + m_no + ", product_code=" + product_code + ", cart_amount="
				+ cart_amount +"discount = "+ discount +"pic1 : " + pic1 + "price = " + price+ "]";
	}
	
	
}
