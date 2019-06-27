package com.kh.cc.common;

import com.kh.cc.illustrator.model.vo.IllustratorPageInfo;

public class IllustratorPagination {
	public static IllustratorPageInfo getPageInfo(int currentPage, int listCount, int limit) {
		IllustratorPageInfo pi = null;
		
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
		
		pi = new IllustratorPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		return pi;
	}
}
