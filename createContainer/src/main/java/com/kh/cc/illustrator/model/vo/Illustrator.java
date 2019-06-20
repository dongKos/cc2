package com.kh.cc.illustrator.model.vo;

import java.sql.Date;

public class Illustrator {
	private int illCode;			//일러스트코드
	private int illPrice;			//가격
	private	Date termDate;			//소요시간
	private int changeCount;		//수정회차
	private String illTitle;		//제목
	private String illContent;		//내용
	private String illType;			//구분
	private int recommendCount;		//추천수
	private int viewCount;			//조회수
	private String illCategory;		//일러스트카테고리
	
	public Illustrator() {}

	public Illustrator(int illCode, int illPrice, Date termDate, int changeCount, String illTitle, String illContent,
			String illType, int recommendCount, int viewCount, String illCategory) {
		super();
		this.illCode = illCode;
		this.illPrice = illPrice;
		this.termDate = termDate;
		this.changeCount = changeCount;
		this.illTitle = illTitle;
		this.illContent = illContent;
		this.illType = illType;
		this.recommendCount = recommendCount;
		this.viewCount = viewCount;
		this.illCategory = illCategory;
	}

	public int getIllCode() {
		return illCode;
	}

	public void setIllCode(int illCode) {
		this.illCode = illCode;
	}

	public int getIllPrice() {
		return illPrice;
	}

	public void setIllPrice(int illPrice) {
		this.illPrice = illPrice;
	}

	public Date getTermDate() {
		return termDate;
	}

	public void setTermDate(Date termDate) {
		this.termDate = termDate;
	}

	public int getChangeCount() {
		return changeCount;
	}

	public void setChangeCount(int changeCount) {
		this.changeCount = changeCount;
	}

	public String getIllTitle() {
		return illTitle;
	}

	public void setIllTitle(String illTitle) {
		this.illTitle = illTitle;
	}

	public String getIllContent() {
		return illContent;
	}

	public void setIllContent(String illContent) {
		this.illContent = illContent;
	}

	public String getIllType() {
		return illType;
	}

	public void setIllType(String illType) {
		this.illType = illType;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getIllCategory() {
		return illCategory;
	}

	public void setIllCategory(String illCategory) {
		this.illCategory = illCategory;
	}

	@Override
	public String toString() {
		return "Illustrator [illCode=" + illCode + ", illPrice=" + illPrice + ", termDate=" + termDate
				+ ", changeCount=" + changeCount + ", illTitle=" + illTitle + ", illContent=" + illContent
				+ ", illType=" + illType + ", recommendCount=" + recommendCount + ", viewCount=" + viewCount
				+ ", illCategory=" + illCategory + "]";
	}
	
	
}
