package com.kh.cc.illustrator.model.service;

import com.kh.cc.illustrator.model.vo.Illustrator;
import com.kh.cc.illustrator.model.vo.IllustratorPhoto;

public interface IllustratorService {

	int insertIllustratorPortfolio(Illustrator ill, IllustratorPhoto ip, IllustratorPhoto ip1, IllustratorPhoto ip2, IllustratorPhoto ip3, IllustratorPhoto ip4);
	
}
