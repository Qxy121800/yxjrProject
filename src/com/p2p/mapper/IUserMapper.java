package com.p2p.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.p2p.base.IBaseDao;
import com.p2p.pojo.Role;
import com.p2p.pojo.User;
import com.p2p.pojo.Userinfo;
import com.p2p.util.PageInfo;
/**
 * 操作人:汪栋才
 * 创建时间:2017-12-28
 * 操作前台用户的Mapper
 * */
public interface IUserMapper extends IBaseDao<Integer, User>{
	User userLoing(@Param("username")String username,@Param("password")String password);
	//根据别人邀请码去查询用户
	abstract User sletUserOinvite(String orderinvite);
	
	//查询总的记录数
    abstract Integer iuserCount();
   //实现分页查询
    List<User> selectPage(Pagination page,Map<String ,Object> params,@Param(value="user") User user);
  	
  	//查询总的记录数
  	abstract Integer userCount();
}
