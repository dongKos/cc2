package com.kh.cc.webnovel.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{

	private int bId;
	private String userId;
	private String boardCategory;
	private int bCount;
	private Date uploadDate;
	private Date updateDate;
	private String bContent;
	private String bTitle;
	private String status;
	private String subCategory;
	
	public Board() {}

	public Board(int bId, String userId, String boardCategory, int bCount, Date uploadDate, Date updateDate, String bContent,
			String bTitle, String status, String subCategory) {
		super();
		this.bId = bId;
		this.userId = userId;
		this.boardCategory = boardCategory;
		this.bCount = bCount;
		this.uploadDate = uploadDate;
		this.updateDate = updateDate;
		this.bContent = bContent;
		this.bTitle = bTitle;
		this.status = status;
		this.subCategory = subCategory;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public int getbCount() {
		return bCount;
	}
	
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	
	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getsubCategory() {
		return subCategory;
	}

	public void setsubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", userId=" + userId + ", boardCategory=" + boardCategory + ", bCount=" + bCount + ", uploadDate="
				+ uploadDate + ", updateDate=" + updateDate + ", bContent=" + bContent + ", bTitle=" + bTitle
				+ ", status=" + status + ", subCategory=" + subCategory + "]";
	}
	
	
}
