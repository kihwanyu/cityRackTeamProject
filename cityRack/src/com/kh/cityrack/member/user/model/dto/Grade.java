package com.kh.cityrack.member.user.model.dto;

import java.io.Serializable;

public class Grade implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4089354167481914852L;
	
	private String c_code; // 등급_코드
	private String c_name; // 등급_이름
	private double c_discount; // 등급_할인율
	private String c_note; // 등급_비고
	
	public Grade() {
		super();
	}

	public Grade(String c_code, String c_name, double c_discount, String c_note) {
		super();
		this.c_code = c_code;
		this.c_name = c_name;
		this.c_discount = c_discount;
		this.c_note = c_note;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public double getC_discount() {
		return c_discount;
	}

	public void setC_discount(double c_discount) {
		this.c_discount = c_discount;
	}

	public String getC_note() {
		return c_note;
	}

	public void setC_note(String c_note) {
		this.c_note = c_note;
	}

	@Override
	public String toString() {
		return "Grade [c_code=" + c_code + ", c_name=" + c_name + ", c_discount=" + c_discount + ", c_note=" + c_note
				+ "]";
	}
	
	
}
