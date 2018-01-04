package com.p2p.service.front;

import com.p2p.base.IBaseService;
import com.p2p.pojo.User;
/**
 * 操作人:汪栋才
 * 操作时间:2017-12-18
 * 前台用户的Service
 * */
public interface IUserService extends IBaseService<Integer, User>{
	User userLoing(String username,String password);
	//根据别人邀请码去查询用户
	abstract User sletUserOinvite(String orderinvite);
}
