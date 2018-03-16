 package com.kh.cityrack.order.user.model.dto;

public class Cart {
	private String pcode;
	private int cart_amount;
	///
	
	
	public Cart() {
		super();
	}
	public Cart(String pcode, int cart_amount) {
		super();
		this.pcode = pcode;
		this.cart_amount = cart_amount;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	@Override
	public String toString() {
		return "Cart [pcode=" + pcode + ", cart_amount=" + cart_amount + "]";
	}
	
	
}
