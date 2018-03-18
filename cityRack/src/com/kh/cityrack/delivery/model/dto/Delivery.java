package com.kh.cityrack.delivery.model.dto;

public class Delivery implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7214447561377639051L;
	private int d_no;
	private String d_invoice_no;
	private String d_addr_name;
	private String d_addr_tel;
	private String d_addr_phone;
	private String d_addr_address;
	private String d_addr_msg;
	
	public Delivery(){}
	
	public Delivery(int d_no, String d_invoice_no, String d_addr_name, String d_addr_tel, String d_addr_phone,
			String d_addr_address, String d_addr_msg) {
		super();
		this.d_no = d_no;
		this.d_invoice_no = d_invoice_no;
		this.d_addr_name = d_addr_name;
		this.d_addr_tel = d_addr_tel;
		this.d_addr_phone = d_addr_phone;
		this.d_addr_address = d_addr_address;
		this.d_addr_msg = d_addr_msg;
	}

	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public String getD_invoice_no() {
		return d_invoice_no;
	}

	public void setD_invoice_no(String d_invoice_no) {
		this.d_invoice_no = d_invoice_no;
	}

	public String getD_addr_name() {
		return d_addr_name;
	}

	public void setD_addr_name(String d_addr_name) {
		this.d_addr_name = d_addr_name;
	}

	public String getD_addr_tel() {
		return d_addr_tel;
	}

	public void setD_addr_tel(String d_addr_tel) {
		this.d_addr_tel = d_addr_tel;
	}

	public String getD_addr_phone() {
		return d_addr_phone;
	}

	public void setD_addr_phone(String d_addr_phone) {
		this.d_addr_phone = d_addr_phone;
	}

	public String getD_addr_address() {
		return d_addr_address;
	}

	public void setD_addr_address(String d_addr_address) {
		this.d_addr_address = d_addr_address;
	}

	public String getD_addr_msg() {
		return d_addr_msg;
	}

	public void setD_addr_msg(String d_addr_msg) {
		this.d_addr_msg = d_addr_msg;
	}

	@Override
	public String toString() {
		return "Delivery [d_no=" + d_no + ", d_invoice_no=" + d_invoice_no + ", d_addr_name=" + d_addr_name
				+ ", d_addr_tel=" + d_addr_tel + ", d_addr_phone=" + d_addr_phone + ", d_addr_address=" + d_addr_address
				+ ", d_addr_msg=" + d_addr_msg + "]";
	}
	
	
	
	
}
