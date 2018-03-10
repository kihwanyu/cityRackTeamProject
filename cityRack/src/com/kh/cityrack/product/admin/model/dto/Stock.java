package com.kh.cityrack.product.admin.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Stock implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6047792423436104872L;
	
	private String divsion; // 구분
	private String pcode; // 상품코드
	private String pname; // 상품이름
	private Date selflife; // 유통기한
	private String note; // 분류
	private int amount; // 수량
	public Stock() {
		super();
	}
	public Stock(String divsion, String pcode, String pname, Date selflife, String note, int amount) {
		super();
		this.divsion = divsion;
		this.pcode = pcode;
		this.pname = pname;
		this.selflife = selflife;
		this.note = note;
		this.amount = amount;
	}
	public String getDivsion() {
		return divsion;
	}
	public void setDivsion(String divsion) {
		this.divsion = divsion;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Date getSelflife() {
		return selflife;
	}
	public void setSelflife(Date selflife) {
		this.selflife = selflife;
	}
	public String getnote() {
		return note;
	}
	public void setnote(String note) {
		this.note = note;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "StockDao [divsion=" + divsion + ", pcode=" + pcode + ", pname=" + pname + ", selflife=" + selflife
				+ ", note=" + note + ", amount=" + amount + "]";
	}
}
