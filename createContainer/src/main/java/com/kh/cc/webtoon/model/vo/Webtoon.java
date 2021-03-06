package com.kh.cc.webtoon.model.vo;

import java.sql.Date;

public class Webtoon implements java.io.Serializable {
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
	private String genre;
	private String genreExplain;
	private String changeName;
	private int fid;
	private String userName;
	
	public Webtoon() {}

	public Webtoon(int wid, String userId, Date wuploadDate, String wTitle, String wIntro, int vCount, String wCycle,
			int gradeType, String workType, String workStatus, Date workDate, String ageGrade, String genre,
			String genreExplain, String changeName, int fid, String userName) {
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
		this.genreExplain = genreExplain;
		this.changeName = changeName;
		this.fid = fid;
		this.userName = userName;
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

	public String getGenre() {
		return genre;
	}

	public String getGenreExplain() {
		return genreExplain;
	}

	public String getChangeName() {
		return changeName;
	}

	public int getFid() {
		return fid;
	}

	public String getUserName() {
		return userName;
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

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setGenreExplain(String genreExplain) {
		this.genreExplain = genreExplain;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Webtoon [wid=" + wid + ", userId=" + userId + ", wuploadDate=" + wuploadDate + ", wTitle=" + wTitle
				+ ", wIntro=" + wIntro + ", vCount=" + vCount + ", wCycle=" + wCycle + ", gradeType=" + gradeType
				+ ", workType=" + workType + ", workStatus=" + workStatus + ", workDate=" + workDate + ", ageGrade="
				+ ageGrade + ", genre=" + genre + ", genreExplain=" + genreExplain + ", changeName=" + changeName
				+ ", fid=" + fid + ", userName=" + userName + "]";
	}

	
}
