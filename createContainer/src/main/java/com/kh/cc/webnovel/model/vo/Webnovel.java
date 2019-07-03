package com.kh.cc.webnovel.model.vo;

import java.sql.Date;

public class Webnovel implements java.io.Serializable{
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
	private String changeName;
	private int fid;
	private int rid ;
	private String nickname;
	private int attentionId;
	private double spAvg;
	private String genreExplain;
	
	public Webnovel() {}

	public Webnovel(int wid, String userId, Date wuploadDate, String wTitle, String wIntro, int vCount, String wCycle,
			int gradeType, String workType, String workStatus, Date workDate, String ageGrade, String genre,
			String changeName, int fid, int rid, String nickname, int attentionId, double spAvg, String genreExplain) {
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
		this.changeName = changeName;
		this.fid = fid;
		this.rid = rid;
		this.nickname = nickname;
		this.attentionId = attentionId;
		this.spAvg = spAvg;
		this.genreExplain = genreExplain;
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

	public String getChangeName() {
		return changeName;
	}

	public int getFid() {
		return fid;
	}

	public int getRid() {
		return rid;
	}

	public String getNickname() {
		return nickname;
	}

	public int getAttentionId() {
		return attentionId;
	}

	public double getSpAvg() {
		return spAvg;
	}

	public String getGenreExplain() {
		return genreExplain;
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

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setAttentionId(int attentionId) {
		this.attentionId = attentionId;
	}

	public void setSpAvg(double spAvg) {
		this.spAvg = spAvg;
	}

	public void setGenreExplain(String genreExplain) {
		this.genreExplain = genreExplain;
	}

	@Override
	public String toString() {
		return "Webnovel [wid=" + wid + ", userId=" + userId + ", wuploadDate=" + wuploadDate + ", wTitle=" + wTitle
				+ ", wIntro=" + wIntro + ", vCount=" + vCount + ", wCycle=" + wCycle + ", gradeType=" + gradeType
				+ ", workType=" + workType + ", workStatus=" + workStatus + ", workDate=" + workDate + ", ageGrade="
				+ ageGrade + ", genre=" + genre + ", changeName=" + changeName + ", fid=" + fid + ", rid=" + rid
				+ ", nickname=" + nickname + ", attentionId=" + attentionId + ", spAvg=" + spAvg + ", genreExplain="
				+ genreExplain + "]";
	}

	

	


	
	

	
	
	
}
