package com.p2p.mapper;

import java.util.List;

import com.p2p.base.IBaseDao;
import com.p2p.pojo.Userinfo;

/**
 * 操作人:汪栋才
 * 创建时间:2017-12-28
 * 操作用户基本信息的Mapper
 * */
public interface UserinfoMapper extends IBaseDao<Integer,Userinfo>{
	//根据uid去查询userinfo
	abstract Userinfo seleUserinfoByuid(Integer uid);
	
}
