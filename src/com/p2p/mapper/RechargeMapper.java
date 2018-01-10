package com.p2p.mapper;

import com.p2p.base.IBaseDao;
import com.p2p.pojo.Recharge;
import com.p2p.pojo.Userinfo;

public interface RechargeMapper extends IBaseDao<Integer, Recharge>{
	//查询交易密码是否正确
	abstract Userinfo getUserinfo(Userinfo userinfo);
}