package com.kh.cityrack.order.admin.model.dto;

import java.sql.Date;

public class TodayOrder {
  private String o_ono;
  private String p_name;
  private int o_amount;
  private Date o_orderdate;
  
  public TodayOrder(){}
  
public TodayOrder(String o_ono, String p_name, int o_amount, Date o_orderdate) {
	super();
	this.o_ono = o_ono;
	this.p_name = p_name;
	this.o_amount = o_amount;
	this.o_orderdate = o_orderdate;
}
public String getO_ono() {
	return o_ono;
}
public void setO_ono(String o_ono) {
	this.o_ono = o_ono;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public int getO_amount() {
	return o_amount;
}
public void setO_amount(int o_amount) {
	this.o_amount = o_amount;
}
public Date getO_orderdate() {
	return o_orderdate;
}
public void setO_orderdate(Date o_orderdate) {
	this.o_orderdate = o_orderdate;
}

@Override
public String toString() {
	return "TodayOrder [o_ono=" + o_ono + ", p_name=" + p_name + ", o_amount=" + o_amount + ", o_orderdate="
			+ o_orderdate + "]";
}


  
  
}