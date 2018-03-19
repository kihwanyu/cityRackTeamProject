package com.kh.cityrack.member.admin.model.dto;

public class Payment implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8479341103198285771L;
	private int no;
	private String pg;
	private String payMethod;
	private String merchantUid;
	private String name;
	private String buyerName;
	private String buyerTel;
	private String buyerAddr;
	private String buyerPostcode;
	private String impUid;
	private int amount;
	private String applyNum;
	private String buyerEmail;
	private String status;
	
	
	public Payment(){}
	
	public Payment(int no, String pg, String payMethod, String merchantUid, String name, String buyerName,
			String buyerTel, String buyerAddr, String buyerPostcode, String impUid, int amount, String applyNum,
			String buyerEmail, String status) {
		super();
		this.no = no;
		this.pg = pg;
		this.payMethod = payMethod;
		this.merchantUid = merchantUid;
		this.name = name;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.buyerAddr = buyerAddr;
		this.buyerPostcode = buyerPostcode;
		this.impUid = impUid;
		this.amount = amount;
		this.applyNum = applyNum;
		this.buyerEmail = buyerEmail;
		this.status = status;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPg() {
		return pg;
	}
	public void setPg(String pg) {
		this.pg = pg;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerTel() {
		return buyerTel;
	}
	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}
	public String getBuyerAddr() {
		return buyerAddr;
	}
	public void setBuyerAddr(String buyerAddr) {
		this.buyerAddr = buyerAddr;
	}
	public String getBuyerPostcode() {
		return buyerPostcode;
	}
	public void setBuyerPostcode(String buyerPostcode) {
		this.buyerPostcode = buyerPostcode;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}
	public String getBuyerEmail() {
		return buyerEmail;
	}
	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Payment [no=" + no + ", pg=" + pg + ", payMethod=" + payMethod + ", merchantUid=" + merchantUid
				+ ", name=" + name + ", buyerName=" + buyerName + ", buyerTel=" + buyerTel + ", buyerAddr=" + buyerAddr
				+ ", buyerPostcode=" + buyerPostcode + ", impUid=" + impUid + ", amount=" + amount + ", applyNum="
				+ applyNum + ", buyerEmail=" + buyerEmail + ", status=" + status + "]";
	}
	
	
	
	

}
