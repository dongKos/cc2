package com.kh.cc.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable{
	private int reportId;
	private String reportType;
	private Date ReportDate;
	private String reportReason;
	private String reportCategory;
	private String status;
	private String userId;
	private int wid;
	private int rid;
	private int commentId;
	private int bid;
	
	public Report() {}
	
	public Report(int reportId, String reportType, Date reportDate, String reportReason, String reportCategory,
			String status, String userId, int wid, int rid, int commentId, int bid) {
		super();
		this.reportId = reportId;
		this.reportType = reportType;
		ReportDate = reportDate;
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
	
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	
	public String getReportType() {
		return reportType;
	}
	
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	
	public Date getReportDate() {
		return ReportDate;
	}
	
	public void setReportDate(Date reportDate) {
		ReportDate = reportDate;
	}
	
	public String getReportReason() {
		return reportReason;
	}
	
	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}
	
	public String getReportCategory() {
		return reportCategory;
	}
	
	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getWid() {
		return wid;
	}
	
	public void setWid(int wid) {
		this.wid = wid;
	}
	
	public int getRid() {
		return rid;
	}
	
	public void setRid(int rid) {
		this.rid = rid;
	}
	
	public int getCommentId() {
		return commentId;
	}
	
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	
	public int getBid() {
		return bid;
	}
	
	public void setBid(int bid) {
		this.bid = bid;
	}
	
	@Override
	public String toString() {
		return "Report [reportId=" + reportId + ", reportType=" + reportType + ", ReportDate=" + ReportDate
				+ ", reportReason=" + reportReason + ", reportCategory=" + reportCategory + ", status=" + status
				+ ", userId=" + userId + ", wid=" + wid + ", rid=" + rid + ", commentId=" + commentId + ", bid=" + bid
				+ "]";
	}
	
	
	
}
