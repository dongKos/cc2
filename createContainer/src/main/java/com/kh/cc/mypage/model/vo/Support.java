package com.kh.cc.mypage.model.vo;

import java.sql.Date;

public class Support implements java.io.Serializable{
	
	
 private int scode;
 private int sprice;
 private int reward;
 private int fid;
 private Date uploaddate;
 private String status;
 private String stitle;
 private String scontent;
 private int mno;
 private String userId;
	
 public Support() {}

public Support(int scode, int sprice, int reward, int fid, Date uploaddate, String status, String stitle,
		String scontent, int mno,String userId) {
	super();
	this.scode = scode;
	this.sprice = sprice;
	this.reward = reward;
	this.fid = fid;
	this.uploaddate = uploaddate;
	this.status = status;
	this.stitle = stitle;
	this.scontent = scontent;
	this.mno = mno;
	this.userId = userId;
}

public int getScode() {
	return scode;
}

public int getSprice() {
	return sprice;
}

public int getReward() {
	return reward;
}

public int getFid() {
	return fid;
}

public Date getUploaddate() {
	return uploaddate;
}

public String getStatus() {
	return status;
}

public String getStitle() {
	return stitle;
}

public String getScontent() {
	return scontent;
}

public int getMno() {
	return mno;
}

public void setScode(int scode) {
	this.scode = scode;
}

public void setSprice(int sprice) {
	this.sprice = sprice;
}

public void setReward(int reward) {
	this.reward = reward;
}

public void setFid(int fid) {
	this.fid = fid;
}

public void setUploaddate(Date uploaddate) {
	this.uploaddate = uploaddate;
}

public void setStatus(String status) {
	this.status = status;
}

public void setStitle(String stitle) {
	this.stitle = stitle;
}

public void setScontent(String scontent) {
	this.scontent = scontent;
}

public void setMno(int mno) {
	this.mno = mno;
}

@Override
public String toString() {
	return "Support [scode=" + scode + ", sprice=" + sprice + ", reward=" + reward + ", fid=" + fid + ", uploaddate="
			+ uploaddate + ", status=" + status + ", stitle=" + stitle + ", scontent=" + scontent + ", mno=" + mno
			+ "]";
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}
 
 
	

}
