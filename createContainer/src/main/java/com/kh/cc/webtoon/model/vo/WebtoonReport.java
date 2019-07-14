package com.kh.cc.webtoon.model.vo;

import java.sql.Date;

public class WebtoonReport implements java.io.Serializable {
	private int reportId;
	private String reportType;
	private Date reportDate;
	private String reportReason;
	private String reportCategory;
	private String status;
	private String userId;
	private int wid;
	private int rid;
	private int commentId;
	private int bid;
	
	public WebtoonReport() {}

	public WebtoonReport(int reportId, String reportType, Date reportDate, String reportReason, String reportCategory,
			String status, String userId, int wid, int rid, int commentId, int bid) {
		super();
		this.reportId = reportId;
		this.reportType = reportType;
		this.reportDate = reportDate;
		this.reportReason = reportReason;
		this.reportCategory = reportCategory;
		this.status = status;
		this.userId = userId;
		this.wid = wid;
		this.rid = rid;
		this.commentId = commentId;
		this.bid = bid;
	}

	public int getReportId() {
		return reportId;
	}

	public String getReportType() {
		return reportType;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public String getReportReason() {
		return reportReason;
	}

	public String getReportCategory() {
		return reportCategory;
	}

	public String getStatus() {
		return status;
	}

	public String getUserId() {
		return userId;
	}

	public int getWid() {
		return wid;
	}

	public int getRid() {
		return rid;
	}

	public int getCommentId() {
		return commentId;
	}

	public int getBid() {
		return bid;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	@Override
	public String toString() {
		return "WebtoonReport [reportId=" + reportId + ", reportType=" + reportType + ", reportDate=" + reportDate
				+ ", reportReason=" + reportReason + ", reportCategory=" + reportCategory + ", status=" + status
				+ ", userId=" + userId + ", wid=" + wid + ", rid=" + rid + ", commentId=" + commentId + ", bid=" + bid
				+ "]";
	}
	
	
}
