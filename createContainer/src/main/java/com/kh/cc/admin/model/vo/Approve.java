package com.kh.cc.admin.model.vo;

import java.sql.Date;

public class Approve implements java.io.Serializable{
	private int aCode;
	private Date upDate;
	private String status;
	private String workType;
	private int wId;
	private int rId;
	private Date wishDate;
	private int illCode;
	private String userId;
	private String workTitle;
	private String illTitle;
	private String changeName;
	private int fId;
	private String aCategory;
	
	public Approve () {}
	
	public Approve(int aCode, Date upDate, String status, String workType, int wId, int rId, Date wishDate, int illCode,
			String userId, String workTitle, String illTitle, String changeName, int fId, String aCategory) {
		super();
		this.aCode = aCode;
		this.upDate = upDate;
		this.status = status;
		this.workType = workType;
		this.wId = wId;
		this.rId = rId;
		this.wishDate = wishDate;
		this.illCode = illCode;
		this.userId = userId;
		this.workTitle = workTitle;
		this.illTitle = illTitle;
		this.changeName = changeName;
		this.fId = fId;
		this.aCategory = aCategory;
	}

	public int getaCode() {
		return aCode;
	}

	public void setaCode(int aCode) {
		this.aCode = aCode;
	}

	public Date getUpDate() {
		return upDate;
	}

	public void setUpDate(Date upDate) {
		this.upDate = upDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public int getwId() {
		return wId;
	}

	public void setwId(int wId) {
		this.wId = wId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public Date getWishDate() {
		return wishDate;
	}

	public void setWishDate(Date wishDate) {
		this.wishDate = wishDate;
	}

	public int getIllCode() {
		return illCode;
	}

	public void setIllCode(int illCode) {
		this.illCode = illCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public String getIllTitle() {
		return illTitle;
	}

	public void setIllTitle(String illTitle) {
		this.illTitle = illTitle;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getaCategory() {
		return aCategory;
	}

	public void setaCategory(String aCategory) {
		this.aCategory = aCategory;
	}

	@Override
	public String toString() {
		return "Approve [aCode=" + aCode + ", upDate=" + upDate + ", status=" + status + ", workType=" + workType
				+ ", wId=" + wId + ", rId=" + rId + ", wishDate=" + wishDate + ", illCode=" + illCode + ", userId="
				+ userId + ", workTitle=" + workTitle + ", illTitle=" + illTitle + ", changeName=" + changeName
				+ ", fId=" + fId + ", aCategory=" + aCategory + "]";
	}

	
}
