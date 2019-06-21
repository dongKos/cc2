package com.kh.cc.admin.model.vo;

import java.sql.Date;

public class Refund implements java.io.Serializable{
	private int refundCode;
	private Date requestDate;
	private Date completeDate;
	private int price;
	private String status;
	private String refundReason;
	private String userId;
	
	public Refund() {}

	public Refund(int refundCode, Date requestDate, Date completeDate, int price, String status, String refundReason,
			String userId) {
		super();
		this.refundCode = refundCode;
		this.requestDate = requestDate;
		this.completeDate = completeDate;
		this.price = price;
		this.status = status;
		this.refundReason = refundReason;
		this.userId = userId;
	}

	public int getRefundCode() {
		return refundCode;
	}

	public void setRefundCode(int refundCode) {
		this.refundCode = refundCode;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRefundReason() {
		return refundReason;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Refund [refundCode=" + refundCode + ", requestDate=" + requestDate + ", completeDate=" + completeDate
				+ ", price=" + price + ", status=" + status + ", refundReason=" + refundReason + ", userId=" + userId
				+ "]";
	}
	
}
