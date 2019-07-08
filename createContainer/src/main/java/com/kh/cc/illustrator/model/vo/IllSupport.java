package com.kh.cc.illustrator.model.vo;

import java.sql.Date;

public class IllSupport {
	private int scode;			//후원코드
	private int sprice;			//금액
	private int reward;			//리워드
	private int fid;			//대표이미지
	private Date uploadDate;	//등록일
	private String status;		//승인상태
	private String stitle;		//제목
	private String scontent;	//내용
	private int mno;			//회원번호
	private String userId;		//아이디
	private String changeName;  //이미지 이름
	
	public IllSupport() {}

	public IllSupport(int scode, int sprice, int reward, int fid, Date uploadDate, String status, String stitle,
			String scontent, int mno, String userId, String changeName) {
		super();
		this.scode = scode;
		this.sprice = sprice;
		this.reward = reward;
		this.fid = fid;
		this.uploadDate = uploadDate;
		this.status = status;
		this.stitle = stitle;
		this.scontent = scontent;
		this.mno = mno;
		this.userId = userId;
		this.changeName = changeName;
	}

	public int getScode() {
		return scode;
	}

	public void setScode(int scode) {
		this.scode = scode;
	}

	public int getSprice() {
		return sprice;
	}

	public void setSprice(int sprice) {
		this.sprice = sprice;
	}

	public int getReward() {
		return reward;
	}

	public void setReward(int reward) {
		this.reward = reward;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "IllSupport [scode=" + scode + ", sprice=" + sprice + ", reward=" + reward + ", fid=" + fid
				+ ", uploadDate=" + uploadDate + ", status=" + status + ", stitle=" + stitle + ", scontent=" + scontent
				+ ", mno=" + mno + ", userId=" + userId + ", changeName=" + changeName + "]";
	}

	

	
	
	
	
}
