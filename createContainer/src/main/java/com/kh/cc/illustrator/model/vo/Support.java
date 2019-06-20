package com.kh.cc.illustrator.model.vo;

import java.sql.Date;

public class Support {
	private int scode;			//후원코드
	private int sprice;			//금액
	private int reward;			//리워드
	private int fid;			//대표이미지
	private Date uploadDate;	//등록일
	private String status;		//승인상태
	private String stitle;		//제목
	private String scontent;	//내용
	
	public Support() {}

	public Support(int scode, int sprice, int reward, int fid, Date uploadDate, String status, String stitle,
			String scontent) {
		super();
		this.scode = scode;
		this.sprice = sprice;
		this.reward = reward;
		this.fid = fid;
		this.uploadDate = uploadDate;
		this.status = status;
		this.stitle = stitle;
		this.scontent = scontent;
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

	@Override
	public String toString() {
		return "Support [scode=" + scode + ", sprice=" + sprice + ", reward=" + reward + ", fid=" + fid
				+ ", uploadDate=" + uploadDate + ", status=" + status + ", stitle=" + stitle + ", scontent=" + scontent
				+ "]";
	}
	
	
}
