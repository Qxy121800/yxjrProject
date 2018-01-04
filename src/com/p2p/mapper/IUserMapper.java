package com.p2p.mapper;

import org.apache.ibatis.annotations.Param;

import com.p2p.base.IBaseDao;
import com.p2p.pojo.User;
/**
 * 操作人:汪栋才
 * 创建时间:2017-12-28
 * 操作前台用户的Mapper
 * */
public interface IUserMapper extends IBaseDao<Integer, User>{
	User userLoing(@Param("username")String username,@Param("password")String password);
	//根据别人邀请码去查询用户
	abstract User sletUserOinvite(String orderinvite);
}
