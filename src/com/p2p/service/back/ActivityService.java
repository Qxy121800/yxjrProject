package com.p2p.service.back;


import java.util.List;

import com.p2p.base.IBaseService;
import com.p2p.pojo.Activity;

public interface ActivityService extends IBaseService<Integer,Activity>{
	//后台查询方法
	List<Activity> listActivity();
}
