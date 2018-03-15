package com.kh.cityrack.board.user.model.dto;

import java.io.Serializable;

public class BoardFile implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4951141706085740914L;
	
	private int bf_no;	// 파일번호
	private int bo_no;	// 게시판 번호
	private String bf_originname;	// 원본파일이름
	private String bf_name;	// 변경된파일이름
	private String bf_kind;	// 파일종류(확장자)
	
	public BoardFile() {
		super();
	}

	public BoardFile(int bf_no, int bo_no, String bf_originname, String bf_name, String bf_kind) {
		super();
		this.bf_no = bf_no;
		this.bo_no = bo_no;
		this.bf_originname = bf_originname;
		this.bf_name = bf_name;
		this.bf_kind = bf_kind;
	}

	public int getBf_no() {
		return bf_no;
	}

	public void setBf_no(int bf_no) {
		this.bf_no = bf_no;
	}

	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}

	public String getBf_name() {
		return bf_name;
	}

	public void setBf_name(String bf_name) {
		this.bf_name = bf_name;
	}

	public String getBf_kind() {
		return bf_kind;
	}

	public void setBf_kind(String bf_kind) {
		this.bf_kind = bf_kind;
	}

	public String getBf_originname() {
		return bf_originname;
	}

	public void setBf_originname(String bf_originname) {
		this.bf_originname = bf_originname;
	}
	@Override
	public String toString() {
		return "BoardFile [bf_no=" + bf_no + ", bo_no=" + bo_no + ", bf_originname=" + bf_originname + ", bf_name=" + bf_name + ", bf_kind=" + bf_kind + "]";
	}
	
	
	/*bf_no
	bo_no
	bf_originname
	bf_name
	bf_kind*/
}
