package com.kh.cc.webnovel.model.vo;

public class WebnovelAttention implements java.io.Serializable{
	private int attentionId;
	private int wid;
	private String userId;
	
	public WebnovelAttention() {}

	public WebnovelAttention(int attentionId, int wid, String userId) {
		super();
		this.attentionId = attentionId;
		this.wid = wid;
		this.userId = userId;
	}

	public int getAttentionId() {
		return attentionId;
	}

	public int getWid() {
		return wid;
	}

	public String getUserId() {
		return userId;
	}

	public void setAttentionId(int attentionId) {
		this.attentionId = attentionId;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "WebnovelAttention [attentionId=" + attentionId + ", wid=" + wid + ", userId=" + userId + "]";
	}
	
	
}
