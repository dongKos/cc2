package com.kh.cc.mypage.model.vo;

import java.sql.Date;

public class PaymentCC {
	private int pid;
	private int pAmount;
	private Date pDate;
	private String userId;
	
	public PaymentCC() {}

	public PaymentCC(int pid, int pAmount, Date pDate, String userId) {
		super();
		this.pid = pid;
		this.pAmount = pAmount;
		this.pDate = pDate;
		this.userId = userId;
	}

	public int getPid() {
		return pid;
	}

	public int getpAmount() {
		return pAmount;
	}

	public Date getpDate() {
		return pDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "PaymentCC [pid=" + pid + ", pAmount=" + pAmount + ", pDate=" + pDate + ", userId=" + userId + "]";
	}
	
	
	
}
