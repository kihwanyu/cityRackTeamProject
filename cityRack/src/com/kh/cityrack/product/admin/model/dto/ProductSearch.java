package com.kh.cityrack.product.admin.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class ProductSearch implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4425363131316612363L;
	
	private String search_pcode;
	private String pcode_order;
	private Date beforeDate;
	private Date afterDate;
	private String search_pcname;
	private String search_constitution;
	private String search_pname;
	private String pname_order;
	private String search_status;
	private String event;
	
	public ProductSearch() {
		super();
	}

	public ProductSearch(String search_pcode, String pcode_order, Date beforeDate, Date afterDate, String search_pcname,
			String search_constitution, String search_pname, String pname_order, String search_status, String event) {
		super();
		this.search_pcode = search_pcode;
		this.pcode_order = pcode_order;
		this.beforeDate = beforeDate;
		this.afterDate = afterDate;
		this.search_pcname = search_pcname;
		this.search_constitution = search_constitution;
		this.search_pname = search_pname;
		this.pname_order = pname_order;
		this.search_status = search_status;
		this.event = event;
	}

	public String getSearch_pcode() {
		return search_pcode;
	}

	public void setSearch_pcode(String search_pcode) {
		this.search_pcode = search_pcode;
	}

	public String getPcode_order() {
		return pcode_order;
	}

	public void setPcode_order(String pcode_order) {
		this.pcode_order = pcode_order;
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

	public String getSearch_pcname() {
		return search_pcname;
	}

	public void setSearch_pcname(String search_pcname) {
		this.search_pcname = search_pcname;
	}

	public String getSearch_constitution() {
		return search_constitution;
	}

	public void setSearch_constitution(String search_constitution) {
		this.search_constitution = search_constitution;
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

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "ProductSearch [search_pcode=" + search_pcode + ", pcode_order=" + pcode_order + ", beforeDate="
				+ beforeDate + ", afterDate=" + afterDate + ", search_pcno=" + search_pcname + ", search_constitution="
				+ search_constitution + ", search_pname=" + search_pname + ", pname_order=" + pname_order
				+ ", search_status=" + search_status + ", event=" + event + "]";
	}
}
