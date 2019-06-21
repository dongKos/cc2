package com.kh.cc.common;

import com.kh.cc.admin.model.vo.AdminPageInfo;

public class Pagination {
	public static AdminPageInfo getPageInfo(int currentPage, int listCount) {
		AdminPageInfo pi = null;
		
		int limit = 10;
		int buttonCount = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / buttonCount + 0.9)) - 1) * buttonCount + 1;
		endPage = startPage + buttonCount - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		pi = new AdminPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		return pi;
	}
}
