package com.kh.cc.mypage.model.vo;

import java.sql.Date;

public class Closed implements java.io.Serializable{
	
	private int closedCode;
	private int wid;
	private Date startDate;
	private Date closedDate;
	private Date uploadDate;
	private String status;
	private String closedReason;
	private String wTitle;
	private String workType;
	
	public Closed() {}

	public Closed(int closedCode, int wid, Date startDate, Date closedDate, Date uploadDate, String status,
			String closedReason, String wTitle, String workType) {
		super();
		this.closedCode = closedCode;
		this.wid = wid;
		this.startDate = startDate;
		this.closedDate = closedDate;
		this.uploadDate = uploadDate;
		this.status = status;
		this.closedReason = closedReason;
		this.wTitle = wTitle;
		this.workType = workType;
	}

	public int getClosedCode() {
		return closedCode;
	}

	public void setClosedCode(int closedCode) {
		this.closedCode = closedCode;
	}

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getClosedDate() {
		return closedDate;
	}

	public void setClosedDate(Date closedDate) {
		this.closedDate = closedDate;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getClosedReason() {
		return closedReason;
	}

	public void setClosedReason(String closedReason) {
		this.closedReason = closedReason;
	}

	public String getwTitle() {
		return wTitle;
	}

	public void setwTitle(String wTitle) {
		this.wTitle = wTitle;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	@Override
	public String toString() {
		return "Closed [closedCode=" + closedCode + ", wid=" + wid + ", startDate=" + startDate + ", closedDate="
				+ closedDate + ", uploadDate=" + uploadDate + ", status=" + status + ", closedReason=" + closedReason
				+ ", wTitle=" + wTitle + ", workType=" + workType + "]";
	}
	
	
}
