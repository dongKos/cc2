package com.kh.cc.webnovel.model.vo;

public class AttentionAuthor implements java.io.Serializable{
	private int aaId;
	private String userId;
	private String aaType;
	private String authorId;
	
	public AttentionAuthor() {}

	public AttentionAuthor(int aaId, String userId, String aaType, String authorid) {
		super();
		this.aaId = aaId;
		this.userId = userId;
		this.aaType = aaType;
		this.authorId = authorid;
	}

	public int getAaId() {
		return aaId;
	}

	public String getUserId() {
		return userId;
	}

	public String getAaType() {
		return aaType;
	}

	public String getAuthorId() {
		return authorId;
	}

	public void setAaId(int aaId) {
		this.aaId = aaId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setAaType(String aaType) {
		this.aaType = aaType;
	}

	public void setAuthorId(String authorid) {
		this.authorId = authorid;
	}

	@Override
	public String toString() {
		return "AttentionAuthor [aaId=" + aaId + ", userId=" + userId + ", aaType=" + aaType + ", authorid=" + authorId
				+ "]";
	}

	
}
