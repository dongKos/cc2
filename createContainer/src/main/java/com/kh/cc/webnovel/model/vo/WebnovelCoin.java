package com.kh.cc.webnovel.model.vo;

import java.sql.Date;

public class WebnovelCoin implements java.io.Serializable{
	private int coinCode;
	private int mno;
	private String coinCategory;
	private int coinCount;
	private int rid;
	private int illCode;
	private Date cDate;
	
	public WebnovelCoin() {}

	public WebnovelCoin(int coinCode, int mno, String coinCategory, int coinCount, int rid, int illCode, Date cDate) {
		super();
		this.coinCode = coinCode;
		this.mno = mno;
		this.coinCategory = coinCategory;
		this.coinCount = coinCount;
		this.rid = rid;
		this.illCode = illCode;
		this.cDate = cDate;
	}

	public int getCoinCode() {
		return coinCode;
	}

	public int getMno() {
		return mno;
	}

	public String getCoinCategory() {
		return coinCategory;
	}

	public int getCoinCount() {
		return coinCount;
	}

	public int getRid() {
		return rid;
	}

	public int getIllCode() {
		return illCode;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setCoinCode(int coinCode) {
		this.coinCode = coinCode;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public void setCoinCategory(String coinCategory) {
		this.coinCategory = coinCategory;
	}

	public void setCoinCount(int coinCount) {
		this.coinCount = coinCount;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setIllCode(int illCode) {
		this.illCode = illCode;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "WebnovelCoin [coinCode=" + coinCode + ", mno=" + mno + ", coinCategory=" + coinCategory + ", coinCount="
				+ coinCount + ", rid=" + rid + ", illCode=" + illCode + ", cDate=" + cDate + "]";
	}


	
	

}
