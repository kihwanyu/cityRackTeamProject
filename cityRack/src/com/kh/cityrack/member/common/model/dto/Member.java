package com.kh.cityrack.member.common.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3800234867879954102L;
	
	private int m_no; // 회원_번호
	private String m_email; // 회원_이메일
	private String c_name; // 등급_이름
	private String m_password; // 회원_비밀번호
	private String m_name; // 회원_이름
	private String m_gender; // 회원_성별
	private Date m_birthDay; // 회원_생년월일
	private String m_address; // 회원_주소
	private String m_tel; // 회원_전화번호
	private String m_phone; // 회원_휴대폰번호
	private Date m_enorll_date; // 회원_가입일
	private String m_stuts; // 회원_탈퇴여부
	
	public Member() {
		super();
	}

	public Member(int m_no, String m_mail, String c_name, String m_password, String m_name, String m_gender,
			Date m_birthDay, String m_address, String m_tel, String m_phone, Date m_enorll_date, String m_stuts) {
		super();
		this.m_no = m_no;
		this.m_email = m_mail;
		this.c_name = c_name;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_birthDay = m_birthDay;
		this.m_address = m_address;
		this.m_tel = m_tel;
		this.m_phone = m_phone;
		this.m_enorll_date = m_enorll_date;
		this.m_stuts = m_stuts;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_mail) {
		this.m_email = m_mail;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public Date getM_birthDay() {
		return m_birthDay;
	}

	public void setM_birthDay(Date m_birthDay) {
		this.m_birthDay = m_birthDay;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public Date getM_enorll_date() {
		return m_enorll_date;
	}

	public void setM_enorll_date(Date m_enorll_date) {
		this.m_enorll_date = m_enorll_date;
	}

	public String getM_stuts() {
		return m_stuts;
	}

	public void setM_stuts(String m_stuts) {
		this.m_stuts = m_stuts;
	}

	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", m_mail=" + m_email + ", c_name=" + c_name + ", m_password=" + m_password
				+ ", m_name=" + m_name + ", m_gender=" + m_gender + ", m_birthDay=" + m_birthDay + ", m_address="
				+ m_address + ", m_tel=" + m_tel + ", m_phone=" + m_phone + ", m_enorll_date=" + m_enorll_date
				+ ", m_stuts=" + m_stuts + "]";
	}

	
	
	
}
