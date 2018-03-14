package com.kh.cityrack.board.user.model.dto;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4501312931378319490L;
	
	
	private int fid;
	private int bid;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private int downloadCount;
	private String status;
	
	public Attachment() {}

	public Attachment(int fid, int bid, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel, int downloadCount, String status) {
		super();
		this.fid = fid;
		this.bid = bid;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.status = status;
	}

	public int getFid() {
		return fid;
	}

	public int getBid() {
		return bid;
	}

	public String getOriginName() {
		return originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public String getStatus() {
		return status;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fid=" + fid + ", bid=" + bid + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", downloadCount=" + downloadCount + ", status=" + status + "]";
	}
	
	
}
