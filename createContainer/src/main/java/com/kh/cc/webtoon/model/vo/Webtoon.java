package com.kh.cc.webtoon.model.vo;

import java.sql.Date;

public class Webtoon implements java.io.Serializable {
	private int wid;
	private String userId;
	private Date wuploadDate;
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
	
	public Webtoon() {}

	public Webtoon(int wid, String userId, Date wuploadDate, String wIntro, String wTitle, int vCount, String wCycle,
			String gradeType, String workType, String workStatus, Date workDate, String ageGrade, String genre) {
		super();
		this.wid = wid;
		this.userId = userId;
		this.wuploadDate = wuploadDate;
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

	public int getWid() {
		return wid;
	}

	public String getUserId() {
		return userId;
	}

	public Date getWuploadDate() {
		return wuploadDate;
	}

	public String getwIntro() {
		return wIntro;
	}

	public String getwTitle() {
		return wTitle;
	}

	public int getvCount() {
		return vCount;
	}

	public String getwCycle() {
		return wCycle;
	}

	public String getGradeType() {
		return gradeType;
	}

	public String getWorkType() {
		return workType;
	}

	public String getWorkStatus() {
		return workStatus;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public String getAgeGrade() {
		return ageGrade;
	}

	public String getGenre() {
		return genre;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setWuploadDate(Date wuploadDate) {
		this.wuploadDate = wuploadDate;
	}

	public void setwIntro(String wIntro) {
		this.wIntro = wIntro;
	}

	public void setwTitle(String wTitle) {
		this.wTitle = wTitle;
	}

	public void setvCount(int vCount) {
		this.vCount = vCount;
	}

	public void setwCycle(String wCycle) {
		this.wCycle = wCycle;
	}

	public void setGradeType(String gradeType) {
		this.gradeType = gradeType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public void setAgeGrade(String ageGrade) {
		this.ageGrade = ageGrade;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "Webtoon [wid=" + wid + ", userId=" + userId + ", wuploadDate=" + wuploadDate + ", wIntro=" + wIntro
				+ ", wTitle=" + wTitle + ", vCount=" + vCount + ", wCycle=" + wCycle + ", gradeType=" + gradeType
				+ ", workType=" + workType + ", workStatus=" + workStatus + ", workDate=" + workDate + ", ageGrade="
				+ ageGrade + ", genre=" + genre + "]";
	}

	
}
