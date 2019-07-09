package com.kh.cc.admin.model.vo;

import java.sql.Date;

public class Purchase {
	private int pCode;
	private String userId;
	private int pPrice;
	private Date pDate;
	private String pType;
	private int rId;
	private int illCode;
	
	public Purchase() {}

	public Purchase(int pCode, String userId, int pPrice, Date pDate, String pType, int rId, int illCode) {
		super();
		this.pCode = pCode;
		this.userId = userId;
		this.pPrice = pPrice;
		this.pDate = pDate;
		this.pType = pType;
		this.rId = rId;
		this.illCode = illCode;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getIllCode() {
		return illCode;
	}

	public void setIllCode(int illCode) {
		this.illCode = illCode;
	}

	@Override
	public String toString() {
		return "Purchase [pCode=" + pCode + ", userId=" + userId + ", pPrice=" + pPrice + ", pDate=" + pDate
				+ ", pType=" + pType + ", rId=" + rId + ", illCode=" + illCode + "]";
	}
	
}
