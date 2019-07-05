package com.kh.cc.webnovel.model.vo;

import java.sql.Date;

public class WebnovelReply implements java.io.Serializable{
	private int replyId;
	private Date replyDate;
	private String replyContent;
	private int rid;
	private int bid;
	private String userId;
	private String nickname;
	
	public WebnovelReply() {}

	public WebnovelReply(int replyId, Date replyDate, String replyContent, int rid, int bid, String userId,
			String nickname) {
		super();
		this.replyId = replyId;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.rid = rid;
		this.bid = bid;
		this.userId = userId;
		this.nickname = nickname;
	}

	public int getReplyId() {
		return replyId;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public int getRid() {
		return rid;
	}

	public int getBid() {
		return bid;
	}

	public String getUserId() {
		return userId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "WebnovelReply [replyId=" + replyId + ", replyDate=" + replyDate + ", replyContent=" + replyContent
				+ ", rid=" + rid + ", bid=" + bid + ", userId=" + userId + ", nickname=" + nickname + "]";
	}

	
	

}
