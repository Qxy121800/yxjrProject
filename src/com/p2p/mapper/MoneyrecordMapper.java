package com.p2p.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.p2p.base.IBaseDao;
import com.p2p.pojo.Moneyrecord;

/**
 * 操作人:杨嘉辉
 * 操作时间:2017-12-27
 * 后台资金明细的mapper
 * */

public interface MoneyrecordMapper extends IBaseDao<Integer, Moneyrecord>{

	//实现分页查询
	List<Moneyrecord> selectPage(Pagination page,Map<String ,Object> params,@Param(value="cord") Moneyrecord cord);
	
	//查询总的记录数
	abstract Integer moneyrecordCount();
}