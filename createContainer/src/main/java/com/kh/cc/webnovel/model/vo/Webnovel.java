package com.kh.cc.webnovel.model.vo;

import java.sql.Date;

public class Webnovel {
	private int wid;
	private String userId;
	private Date wuploadDate;
	private String wTitle;
	private String wIntro;
	private int vCount;
	private String wCycle;
	private int gradeType;
	private String workType;
	private String workStatus;
	private Date workDate;
	private String ageGrade;
	private int genre;
	
	public Webnovel() {}

	public Webnovel(int wid, String userId, Date wuploadDate, String wTitle, String wIntro, int vCount, String wCycle,
			int gradeType, String workType, String workStatus, Date workDate, String ageGrade, int genre) {
		super();
		this.wid = wid;
		this.userId = userId;
		this.wuploadDate = wuploadDate;
		this.wTitle = wTitle;
		this.wIntro = wIntro;
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

	public String getuserId() {
		return userId;
	}

	public Date getWuploadDate() {
		return wuploadDate;
	}

	public String getwTitle() {
		return wTitle;
	}

	public String getwIntro() {
		return wIntro;
	}

	public int getvCount() {
		return vCount;
	}

	public String getwCycle() {
		return wCycle;
	}

	public int getGradeType() {
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

	public int getGenre() {
		return genre;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public void setWuploadDate(Date wuploadDate) {
		this.wuploadDate = wuploadDate;
	}

	public void setwTitle(String wTitle) {
		this.wTitle = wTitle;
	}

	public void setwIntro(String wIntro) {
		this.wIntro = wIntro;
	}

	public void setvCount(int vCount) {
		this.vCount = vCount;
	}

	public void setwCycle(String wCycle) {
		this.wCycle = wCycle;
	}

	public void setGradeType(int gradeType) {
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

	public void setGenre(int genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "Webnovel [wid=" + wid + ", userId=" + userId + ", wuploadDate=" + wuploadDate + ", wTitle=" + wTitle
				+ ", wIntro=" + wIntro + ", vCount=" + vCount + ", wCycle=" + wCycle + ", gradeType=" + gradeType
				+ ", workType=" + workType + ", workStatus=" + workStatus + ", workDate=" + workDate + ", ageGrade="
				+ ageGrade + ", genre=" + genre + "]";
	}

	
	
	
}
