package com.kh.cityrack.order.user.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Stock implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6047792423436104872L;
	
	private String divsion; // 구분
	private String pcode; // 상품코드
	private int scode; // 재고번호
	private String pname; // 상품이름
	private Date resisterDate; // 등록 일자
	private Date selflife; // 유통기한
	private String note; // 분류
	private int amount; // 수량
	public Stock() {
		super();
	}
	public Stock(String divsion, String pcode, int scode, String pname, Date resisterDate, Date selflife, String note,
			int amount) {
		super();
		this.divsion = divsion;
		this.pcode = pcode;
		this.scode = scode;
		this.pname = pname;
		this.resisterDate = resisterDate;
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
	public int getScode() {
		return scode;
	}
	public void setScode(int scode) {
		this.scode = scode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Date getResisterDate() {
		return resisterDate;
	}
	public void setResisterDate(Date resisterDate) {
		this.resisterDate = resisterDate;
	}
	public Date getSelflife() {
		return selflife;
	}
	public void setSelflife(Date selflife) {
		this.selflife = selflife;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
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
		return "Stock [divsion=" + divsion + ", pcode=" + pcode + ", scode=" + scode + ", pname=" + pname
				+ ", resisterDate=" + resisterDate + ", selflife=" + selflife + ", note=" + note + ", amount=" + amount
				+ "]";
	}
	
}
