package com.kh.cityrack.member.admin.model.dto;

import java.sql.Date;

public class Withdraw implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5938097769579355793L;
	private int memberCode;
	private String memberName;
	private Date withdrawDate;
	private String withdrawReason;
	
	public Withdraw(){}
	
	public Withdraw(int memberCode, String memberName, Date withdrawDate, String withdrawReason) {
		super();
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.withdrawDate = withdrawDate;
		this.withdrawReason = withdrawReason;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getWithdrawDate() {
		return withdrawDate;
	}

	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}

	public String getWithdrawReason() {
		return withdrawReason;
	}

	public void setWithdrawReason(String withdrawReason) {
		this.withdrawReason = withdrawReason;
	}

	@Override
	public String toString() {
		return "Withdraw [memberCode=" + memberCode + ", memberName=" + memberName + ", withdrawDate=" + withdrawDate
				+ ", withdrawReason=" + withdrawReason + "]";
	}
	
	
	
	
}
