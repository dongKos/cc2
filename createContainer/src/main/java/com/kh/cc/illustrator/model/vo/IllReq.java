package com.kh.cc.illustrator.model.vo;

import java.sql.Date;

public class IllReq implements java.io.Serializable{
	private int reqCode;
	private String userId;
	private Date reqDate;
	private int illCode;
	private String illContent;
	private String reqStatus;
	private int totalPrice;
	
	public IllReq() {}

	public IllReq(int reqCode, String userId, Date reqDate, int illCode, String illContent, String reqStatus,
			int totalPrice) {
		super();
		this.reqCode = reqCode;
		this.userId = userId;
		this.reqDate = reqDate;
		this.illCode = illCode;
		this.illContent = illContent;
		this.reqStatus = reqStatus;
		this.totalPrice = totalPrice;
	}

	public int getReqCode() {
		return reqCode;
	}

	public void setReqCode(int reqCode) {
		this.reqCode = reqCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public int getIllCode() {
		return illCode;
	}

	public void setIllCode(int illCode) {
		this.illCode = illCode;
	}

	public String getIllContent() {
		return illContent;
	}

	public void setIllContent(String illContent) {
		this.illContent = illContent;
	}

	public String getReqStatus() {
		return reqStatus;
	}

	public void setReqStatus(String reqStatus) {
		this.reqStatus = reqStatus;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "IllReq [reqCode=" + reqCode + ", userId=" + userId + ", reqDate=" + reqDate + ", illCode=" + illCode
				+ ", illContent=" + illContent + ", reqStatus=" + reqStatus + ", totalPrice=" + totalPrice + "]";
	}
	
}
