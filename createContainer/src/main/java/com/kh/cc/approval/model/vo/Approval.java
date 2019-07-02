package com.kh.cc.approval.model.vo;

import java.sql.Date;

public class Approval {
	
	private int apNo;
	private Date uploadDate;
	private String status;
	private String wType;
	private int wid;
	private int rid;
	private Date wishDate;
	private int illcode;
	
	public Approval() {
		
	}

	public Approval(int apNo, Date uploadDate, String status, String wType, int wid, int rid, Date wishDate,
			int illcode) {
		super();
		this.apNo = apNo;
		this.uploadDate = uploadDate;
		this.status = status;
		this.wType = wType;
		this.wid = wid;
		this.rid = rid;
		this.wishDate = wishDate;
		this.illcode = illcode;
	}

	public int getApNo() {
		return apNo;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public String getwType() {
		return wType;
	}

	public int getWid() {
		return wid;
	}

	public int getRid() {
		return rid;
	}

	public Date getWishDate() {
		return wishDate;
	}

	public int getIllcode() {
		return illcode;
	}

	public void setApNo(int apNo) {
		this.apNo = apNo;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setwType(String wType) {
		this.wType = wType;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setWishDate(Date wishDate) {
		this.wishDate = wishDate;
	}

	public void setIllcode(int illcode) {
		this.illcode = illcode;
	}

	@Override
	public String toString() {
		return "Approval [apNo=" + apNo + ", uploadDate=" + uploadDate + ", status=" + status + ", wType=" + wType
				+ ", wid=" + wid + ", rid=" + rid + ", wishDate=" + wishDate + ", illcode=" + illcode + "]";
	}
	
	
}
