package com.kh.cc.webtoon.model.vo;

import java.sql.Date;

public class WebtoonRound implements java.io.Serializable{
	private int rid;
	private String rTitle;
	private int vCount;
	private Date ruploadDate;
	private int approvalCode;
	private int wid;
	private String rContent;
	private String wrComment;
	private String changeName;
	private int fid;
	private String workStatus;
	
	
	public WebtoonRound() {}

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

	public String getWrComment() {
		return wrComment;
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

	public void setWrComment(String wrComment) {
		this.wrComment = wrComment;
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
		return "WebtoonRound [rid=" + rid + ", rTitle=" + rTitle + ", vCount=" + vCount + ", ruploadDate=" + ruploadDate
				+ ", approvalCode=" + approvalCode + ", wid=" + wid + ", rContent=" + rContent + ", wrComment="
				+ wrComment + ", changeName=" + changeName + ", fid=" + fid + ", workStatus=" + workStatus + "]";
	}
	
	
}
