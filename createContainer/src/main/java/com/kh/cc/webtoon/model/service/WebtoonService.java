package com.kh.cc.webtoon.model.service;

import com.kh.cc.webtoon.model.vo.Webtoon;
import com.kh.cc.webtoon.model.vo.WebtoonPhoto;

public interface WebtoonService {

	int insertWebtoon(Webtoon wt, WebtoonPhoto wp);

}
