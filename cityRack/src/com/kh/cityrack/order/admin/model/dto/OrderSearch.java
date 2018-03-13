package com.kh.cityrack.order.admin.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class OrderSearch implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4425363131316612363L;
	
	private String search_oono;
	private String oono_order;
	private String search_email;
	private String email_order;
	private Date beforeDate;
	private Date afterDate;
	private String search_pname;
	private String pname_order;
	private String search_status;
	
	
	public OrderSearch() {
		super();
	}


	public OrderSearch(String search_oono, String oono_order, String search_email, String email_order, Date beforeDate,
			Date afterDate, String search_pname, String pname_order, String search_status) {
		super();
		this.search_oono = search_oono;
		this.oono_order = oono_order;
		this.search_email = search_email;
		this.email_order = email_order;
		this.beforeDate = beforeDate;
		this.afterDate = afterDate;
		this.search_pname = search_pname;
		this.pname_order = pname_order;
		this.search_status = search_status;
	}


	public String getSearch_oono() {
		return search_oono;
	}


	public void setSearch_oono(String search_oono) {
		this.search_oono = search_oono;
	}


	public String getOono_order() {
		return oono_order;
	}


	public void setOono_order(String oono_order) {
		this.oono_order = oono_order;
	}


	public String getSearch_email() {
		return search_email;
	}


	public void setSearch_email(String search_email) {
		this.search_email = search_email;
	}


	public String getEmail_order() {
		return email_order;
	}


	public void setEmail_order(String email_order) {
		this.email_order = email_order;
	}


	public Date getBeforeDate() {
		return beforeDate;
	}


	public void setBeforeDate(Date beforeDate) {
		this.beforeDate = beforeDate;
	}


	public Date getAfterDate() {
		return afterDate;
	}


	public void setAfterDate(Date afterDate) {
		this.afterDate = afterDate;
	}


	public String getSearch_pname() {
		return search_pname;
	}


	public void setSearch_pname(String search_pname) {
		this.search_pname = search_pname;
	}


	public String getPname_order() {
		return pname_order;
	}


	public void setPname_order(String pname_order) {
		this.pname_order = pname_order;
	}


	public String getSearch_status() {
		return search_status;
	}


	public void setSearch_status(String search_status) {
		this.search_status = search_status;
	}


	@Override
	public String toString() {
		return "OrderSearch [search_oono=" + search_oono + ", oono_order=" + oono_order + ", search_email="
				+ search_email + ", email_order=" + email_order + ", beforeDate=" + beforeDate + ", afterDate="
				+ afterDate + ", search_pname=" + search_pname + ", pname_order=" + pname_order + ", search_status="
				+ search_status + "]";
	}

	
}
