package com.kh.cc.message.model.vo;

import java.sql.Date;

public class Message {
	private int mcode;				//쪽지번호
	private Date uploadDate;		//작성일시
	private String mcontent;		//내용
	private String status;			//상태
	private String userId;			//작성자
	private String targetUser;		//대상자
	
	public Message() {}

	public Message(int mcode, Date uploadDate, String mcontent, String status, String userId, String targetUser) {
		super();
		this.mcode = mcode;
		this.uploadDate = uploadDate;
		this.mcontent = mcontent;
		this.status = status;
		this.userId = userId;
		this.targetUser = targetUser;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTargetUser() {
		return targetUser;
	}

	public void setTargetUser(String targetUser) {
		this.targetUser = targetUser;
	}

	@Override
	public String toString() {
		return "Message [mcode=" + mcode + ", uploadDate=" + uploadDate + ", mcontent=" + mcontent + ", status="
				+ status + ", userId=" + userId + ", targetUser=" + targetUser + "]";
	}
	
	
}
