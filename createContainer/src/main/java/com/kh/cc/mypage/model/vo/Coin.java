package com.kh.cc.mypage.model.vo;

import java.sql.Date;

public class Coin implements java.io.Serializable{
	private int coid;
	private int mno;
	private int cCategory;
	private int cCount;
	private int rid;
	private Date cDate;
	
	public Coin() {}

	public Coin(int coid, int mno, int cCategory, int cCount, int rid, Date cDate) {
		super();
		this.coid = coid;
		this.mno = mno;
		this.cCategory = cCategory;
		this.cCount = cCount;
		this.rid = rid;
		this.cDate = cDate;
	}

	public int getCoid() {
		return coid;
	}

	public int getMno() {
		return mno;
	}

	public int getcCategory() {
		return cCategory;
	}

	public int getcCount() {
		return cCount;
	}

	public int getRid() {
		return rid;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setCoid(int coid) {
		this.coid = coid;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public void setcCategory(int cCategory) {
		this.cCategory = cCategory;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "Coin [coid=" + coid + ", mno=" + mno + ", cCategory=" + cCategory + ", cCount=" + cCount + ", rid="
				+ rid + ", cDate=" + cDate + "]";
	}
	
	
}
