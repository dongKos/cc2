package com.kh.cc.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable{
	private int replyId;
	private Date replyDate;
	private String replyContent;
	private int rId;
	private int bId;
	private String userId;
	private String workType;
	
	public Reply() {}

	public Reply(int replyId, Date replyDate, String replyContent, int rId, int bId, String userId, String workType) {
		super();
		this.replyId = replyId;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.rId = rId;
		this.bId = bId;
		this.userId = userId;
		this.workType = workType;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
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

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", replyDate=" + replyDate + ", replyContent=" + replyContent + ", rId="
				+ rId + ", bId=" + bId + ", userId=" + userId + ", workType=" + workType + "]";
	}
	
}
