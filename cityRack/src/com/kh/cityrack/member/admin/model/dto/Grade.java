package com.kh.cityrack.member.admin.model.dto;

import java.io.Serializable;

public class Grade implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4089354167481914852L;
	
	private String gradeName;
	private int gradeDiscount;
	private int gradeCode;
	
	public Grade() {}
	
	public Grade(String gradeName, int gradeDiscount, int gradeCode) {
		super();
		this.gradeName = gradeName;
		this.gradeDiscount = gradeDiscount;
		this.gradeCode = gradeCode;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getGradeDiscount() {
		return gradeDiscount;
	}

	public void setGradeDiscount(int gradeDiscount) {
		this.gradeDiscount = gradeDiscount;
	}

	public int getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(int gradeCode) {
		this.gradeCode = gradeCode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Grade [gradeName=" + gradeName + ", gradeDiscount=" + gradeDiscount + ", gradeCode=" + gradeCode + "]";
	}
	
	
	
	
}
