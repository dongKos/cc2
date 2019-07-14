package com.kh.cc.webtoon.model.vo;

public class WebtoonStarPoint {
	private int starpId;
	private int starPoint;
	private int rid;
	private String userId;
	
	public WebtoonStarPoint() {}

	public WebtoonStarPoint(int starpId, int starPoint, int rid, String userId) {
		super();
		this.starpId = starpId;
		this.starPoint = starPoint;
		this.rid = rid;
		this.userId = userId;
	}

	public int getStarpId() {
		return starpId;
	}

	public int getStarPoint() {
		return starPoint;
	}

	public int getRid() {
		return rid;
	}

	public String getUserId() {
		return userId;
	}

	public void setStarpId(int starpId) {
		this.starpId = starpId;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "WebtoonStarPoint [starpId=" + starpId + ", starPoint=" + starPoint + ", rid=" + rid + ", userId="
				+ userId + "]";
	}
	
	
}
