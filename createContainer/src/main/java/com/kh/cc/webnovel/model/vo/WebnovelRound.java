package com.kh.cc.webnovel.model.vo;

import java.sql.Date;

public class WebnovelRound implements java.io.Serializable{
	private int rid;
	private String rTitle;
	private int vCount;
	private Date ruploadDate;
	private int approvalCode;
	private int wid;
	private String rContent;
	private String changeName;
	private int fid;
	private String workStatus;
	
	public WebnovelRound() {}

	public WebnovelRound(int rid, String rTitle, int vCount, Date ruploadDate, int approvalCode, int wid,
			String rContent, String changeName, int fid, String workStatus) {
		super();
		this.rid = rid;
		this.rTitle = rTitle;
		this.vCount = vCount;
		this.ruploadDate = ruploadDate;
		this.approvalCode = approvalCode;
		this.wid = wid;
		this.rContent = rContent;
		this.changeName = changeName;
		this.fid = fid;
		this.workStatus = workStatus;
	}

	public int getRid() {
		return rid;
	}

	public String getrTitle() {
		return rTitle;
	}

	public int getvCount() {
		return vCount;
	}

	public Date getRuploadDate() {
		return ruploadDate;
	}

	public int getApprovalCode() {
		return approvalCode;
	}

	public int getWid() {
		return wid;
	}

	public String getrContent() {
		return rContent;
	}

	public String getChangeName() {
		return changeName;
	}

	public int getFid() {
		return fid;
	}

	public String getWorkStatus() {
		return workStatus;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public void setvCount(int vCount) {
		this.vCount = vCount;
	}

	public void setRuploadDate(Date ruploadDate) {
		this.ruploadDate = ruploadDate;
	}

	public void setApprovalCode(int approvalCode) {
		this.approvalCode = approvalCode;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}

	@Override
	public String toString() {
		return "WebnovelRound [rid=" + rid + ", rTitle=" + rTitle + ", vCount=" + vCount + ", ruploadDate="
				+ ruploadDate + ", approvalCode=" + approvalCode + ", wid=" + wid + ", rContent=" + rContent
				+ ", changeName=" + changeName + ", fid=" + fid + ", workStatus=" + workStatus + "]";
	}

	

	
	
	
}
