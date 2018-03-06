package com.kh.cityrack.board.user.model.dto;

import java.io.Serializable;

public class BoardFile implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4951141706085740914L;
	
	private int bf_no;
	private int bo_no;
	private String bf_name;
	private String bf_kind;
	
	public BoardFile() {
		super();
	}

	public BoardFile(int bf_no, int bo_no, String bf_name, String bf_kind) {
		super();
		this.bf_no = bf_no;
		this.bo_no = bo_no;
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

	@Override
	public String toString() {
		return "BoardFile [bf_no=" + bf_no + ", bo_no=" + bo_no + ", bf_name=" + bf_name + ", bf_kind=" + bf_kind + "]";
	}
	
	
	/*bf_no
	bo_no
	bf_name
	bf_kind*/
}
