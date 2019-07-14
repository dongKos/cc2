package com.kh.cc.mypage.model.vo;

import java.sql.Date;

public class Coin implements java.io.Serializable{
	private int coid;
	private int mno;
	private int cCategory;
	private int cCount;
	private int rid;
	private int illCode;
	private Date cDate;
	
	public Coin() {}

	public Coin(int coid, int mno, int cCategory, int cCount, int rid, int illCode, Date cDate) {
		super();
		this.coid = coid;
		this.mno = mno;
		this.cCategory = cCategory;
		this.cCount = cCount;
		this.rid = rid;
		this.illCode = illCode;
		this.cDate = cDate;
	}

	public int getCoid() {
		return coid;
	}

	public void setCoid(int coid) {
		this.coid = coid;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getcCategory() {
		return cCategory;
	}

	public void setcCategory(int cCategory) {
		this.cCategory = cCategory;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getIllCode() {
		return illCode;
	}

	public void setIllCode(int illCode) {
		this.illCode = illCode;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "Coin [coid=" + coid + ", mno=" + mno + ", cCategory=" + cCategory + ", cCount=" + cCount + ", rid="
				+ rid + ", illCode=" + illCode + ", cDate=" + cDate + "]";
	}
	
	
}
