package com.kh.cc.webtoon.model.vo;

import java.sql.Date;

public class WebtoonPhoto implements java.io.Serializable {
	private int fid;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private String aCategory;
	private int rid;
	private int illCode;
	private int spCode;
	private int wid;
	private String userId;
	
	public WebtoonPhoto() {}

	public WebtoonPhoto(int fid, String originName, String changeName, String filePath, Date uploadDate, String status,
			String aCategory, int rid, int illCode, int spCode, int wid, String userId) {
		super();
		this.fid = fid;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.aCategory = aCategory;
		this.rid = rid;
		this.illCode = illCode;
		this.spCode = spCode;
		this.wid = wid;
		this.userId = userId;
	}

	public int getFid() {
		return fid;
	}

	public String getOriginName() {
		return originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public String getaCategory() {
		return aCategory;
	}

	public int getRid() {
		return rid;
	}

	public int getIllCode() {
		return illCode;
	}

	public int getSpCode() {
		return spCode;
	}

	public int getWid() {
		return wid;
	}

	public String getUserId() {
		return userId;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setaCategory(String aCategory) {
		this.aCategory = aCategory;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setIllCode(int illCode) {
		this.illCode = illCode;
	}

	public void setSpCode(int spCode) {
		this.spCode = spCode;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "WebtoonPhoto [fid=" + fid + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", status=" + status + ", aCategory=" + aCategory + ", rid="
				+ rid + ", illCode=" + illCode + ", spCode=" + spCode + ", wid=" + wid + ", userId=" + userId + "]";
	}
	

	}
