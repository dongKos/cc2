package com.kh.cc.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private int memberType;
	private String intro;
	private int wallet;
	private Date birthday;
	private String email;
	private String phone;
	private int wCount;
	private String status;
	private Date joinDate;
	
	public Member () {}

	public Member(int mno, String userId, String userPwd, String userName, String nickName, int memberType,
			String intro, int wallet, Date birthday, String email, String phone, int wCount, String status,
			Date joinDate) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.memberType = memberType;
		this.intro = intro;
		this.wallet = wallet;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.wCount = wCount;
		this.status = status;
		this.joinDate = joinDate;
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

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getMemberType() {
		return memberType;
	}

	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getWallet() {
		return wallet;
	}

	public void setWallet(int wallet) {
		this.wallet = wallet;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getwCount() {
		return wCount;
	}

	public void setwCount(int wCount) {
		this.wCount = wCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickName=" + nickName + ", memberType=" + memberType + ", intro=" + intro + ", wallet=" + wallet
				+ ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", wCount=" + wCount
				+ ", status=" + status + ", joinDate=" + joinDate + "]";
	}

		
}