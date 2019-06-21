package com.kh.cc.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.cc.admin.model.vo.AdminPageInfo;
import com.kh.cc.admin.model.vo.Refund;

public interface AdminDao {

	int getRefundListCount(SqlSessionTemplate sqlSession);

	ArrayList<Refund> selectRefundList(SqlSessionTemplate sqlSession, AdminPageInfo pi);

}
