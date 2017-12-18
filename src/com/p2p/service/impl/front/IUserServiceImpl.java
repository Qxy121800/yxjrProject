package com.p2p.service.impl.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.p2p.mapper.IUserMapper;
import com.p2p.pojo.User;
import com.p2p.service.front.IUserService;
/**
 * 操作人:汪栋才
 * 操作时间:2017-12-18
 * 前台用户的Service实现类
 * */
@Transactional
@Service
public class IUserServiceImpl implements IUserService{
	@Resource
	private IUserMapper iUserMapper;

	@Override
	public int addModel(User user) {
		return iUserMapper.addModel(user);
	}

	@Override
	public User getModel(User user) {
		return iUserMapper.getModel(user);
	}

	@Override
	public List<User> getAllModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User findModel(Integer id) {
		return null;
	}

}
