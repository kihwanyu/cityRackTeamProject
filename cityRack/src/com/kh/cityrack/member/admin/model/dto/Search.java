package com.kh.cityrack.member.admin.model.dto;

public class Search implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1790192340946198024L;
	private String gender;
	private String searchCondition;
	private String searchText;
	private String beforeDate;
	private String afterDate;
	private String grade;
	private String status;
	
	public Search(){}
	
	public Search(String gender, String searchCondition, String searchText, String beforeDate, String afterDate,
			String grade, String status) {
		super();
		this.gender = gender;
		this.searchCondition = searchCondition;
		this.searchText = searchText;
		this.beforeDate = beforeDate;
		this.afterDate = afterDate;
		this.grade = grade;
		this.status = status;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getBeforeDate() {
		return beforeDate;
	}

	public void setBeforeDate(String beforeDate) {
		this.beforeDate = beforeDate;
	}

	public String getAfterDate() {
		return afterDate;
	}

	public void setAfterDate(String afterDate) {
		this.afterDate = afterDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Search [gender=" + gender + ", searchCondition=" + searchCondition + ", searchText=" + searchText
				+ ", beforeDate=" + beforeDate + ", afterDate=" + afterDate + ", grade=" + grade + ", status=" + status
				+ "]";
	}
	
	
	
	
}
