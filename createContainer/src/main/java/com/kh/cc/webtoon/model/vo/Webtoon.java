package com.kh.cc.webtoon.model.vo;

import java.sql.Date;

public class Webtoon {
	private int wId;
	private String userId;
	private Date wUploadDate;
	private String wIntro;
	private String wTitle;
	private int vCount;
	private String wCycle;
	private String gradeType;
	private String workType;
	private String workStatus;
	private Date workDate;
	private String ageGrade;
	private String genre;

	public Webtoon(int wId, String userId, Date wUploadDate, String wIntro, String wTitle, int vCount, String wCycle,
			String gradeType, String workType, String workStatus, Date workDate, String ageGrade, String genre) {
		super();
		this.wId = wId;
		this.userId = userId;
		this.wUploadDate = wUploadDate;
		this.wIntro = wIntro;
		this.wTitle = wTitle;
		this.vCount = vCount;
		this.wCycle = wCycle;
		this.gradeType = gradeType;
		this.workType = workType;
		this.workStatus = workStatus;
		this.workDate = workDate;
		this.ageGrade = ageGrade;
		this.genre = genre;
	}

	public int getwId() {
		return wId;
	}

	public void setwId(int wId) {
		this.wId = wId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getwUploadDate() {
		return wUploadDate;
	}

	public void setwUploadDate(Date wUploadDate) {
		this.wUploadDate = wUploadDate;
	}

	public String getwIntro() {
		return wIntro;
	}

	public void setwIntro(String wIntro) {
		this.wIntro = wIntro;
	}

	public String getwTitle() {
		return wTitle;
	}

	public void setwTitle(String wTitle) {
		this.wTitle = wTitle;
	}

	public int getvCount() {
		return vCount;
	}

	public void setvCount(int vCount) {
		this.vCount = vCount;
	}

	public String getwCycle() {
		return wCycle;
	}

	public void setwCycle(String wCycle) {
		this.wCycle = wCycle;
	}

	public String getGradeType() {
		return gradeType;
	}

	public void setGradeType(String gradeType) {
		this.gradeType = gradeType;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public String getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public String getAgeGrade() {
		return ageGrade;
	}

	public void setAgeGrade(String ageGrade) {
		this.ageGrade = ageGrade;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "Webtoon [wId=" + wId + ", userId=" + userId + ", wUploadDate=" + wUploadDate + ", wIntro=" + wIntro
				+ ", wTitle=" + wTitle + ", vCount=" + vCount + ", wCycle=" + wCycle + ", gradeType=" + gradeType
				+ ", workType=" + workType + ", workStatus=" + workStatus + ", workDate=" + workDate + ", ageGrade="
				+ ageGrade + ", genre=" + genre + "]";
	}

}
