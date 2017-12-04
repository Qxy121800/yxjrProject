package com.p2p.controller.front;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.p2p.pojo.User;
import com.p2p.service.front.IUserService;
import com.p2p.util.AddressUtils;
import com.p2p.util.DateUtils;
import com.p2p.util.SendMsgUtil;

/**
 * 开发人:汪栋才
 * 2017-11-14
 * 访问前台登入和注册的controller的
 * */
@Controller
@RequestMapping(value="/front")
public class TextfController {
	@Resource(name="IUserServiceImpl")
	private IUserService iUserService;
	
	//前往登入界面界面
	@RequestMapping(value="/tologin")
	private String login() {
		return "/views/front/login";
	}
	
	//前往登入注册界面
	@RequestMapping(value="/toregister")
	private String register() {
		return "/views/front/register";
	}
	
	
	
	//模拟注册
	@RequestMapping(value="/mnreg")
	@ResponseBody
	private String mnreg(@RequestParam String phone,@RequestParam String pass_word,@RequestParam String yqcode,HttpSession session) throws Exception {
	
		ObjectMapper mapper = new ObjectMapper(); //转换器  
		Map<String, Object> map = new HashMap<String, Object>();
		
		AddressUtils addressUtils = new AddressUtils();
		
		System.out.println("手机号码"+phone);
		System.out.println("密码是"+pass_word);
		System.out.println("邀请码是"+yqcode);
		
		/**
		 * 1：密码加密（MD5）
		 * 2：写进数据库
		 * 3:根据返回id查找user对象
		 * 4：把user对象放在session中
		 * */
		Object result = new SimpleHash("MD5", pass_word, ByteSource.Util.bytes(phone), 10);
		System.out.println(result.toString());
		User user = new User();
		user.setUpassword(result.toString());
		user.setUheadImg("/Finances/WebContent/front/images/IMG_2166.JPG");
		user.setUphone(phone);
		user.setUloginTime(DateUtils.getDateTimeFormat(new Date()));
		
		//别人的邀请码
		user.setUinvited(yqcode);	
		
		//自己的邀请码
		
		Integer ranks = (int)((Math.random()*9+1)*100000); 
		user.setUinvite("yxjy"+ranks);
		
		user.setUenable(1);
		user.setUisAccountSum(1);
		user.setUip(addressUtils.getIP());
		System.out.println(user.getUip());
		user.setUvouch("1");
		user.setUbonus("1");
		user.setUcredit(3000);
		user.setUbalance(0.00);
		user.setUgroup(0);
		user.setUlevel("0");
		user.setUintgrad(0.00);
		
		try {
			Integer userid = iUserService.addUser(user);
			System.out.println(userid);
			//如果注册成功
			User user2 = new User();
			user2.setUid(userid);
			
			//数据库
			User user3 =  iUserService.getUser(user2);
			/**
			 * 把用户信息存放进session
			 * */
			session.setAttribute("user",user3);
			map.put("status",1);
		}catch (Exception e) {
			//日志
			e.printStackTrace();
			map.put("status","5");
			map.put("message", "注册失败,请稍后再试");
		}
		
		


		
		
		
		String aa = mapper.writeValueAsString(map);
		System.out.println(aa);

		return aa;
	}

	
	//模拟登入
	@RequestMapping(value="/mnlogin")
	@ResponseBody
	private String mnlogin(@RequestParam String user_name,@RequestParam String pass_word,HttpSession session) throws Exception {
	
		ObjectMapper mapper = new ObjectMapper(); //转换器  
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("手机号码"+user_name);
		System.out.println("密码是"+pass_word);
		
		/**
		 * 1：密码加密
		 * 2：查找数据库
		 * 3:根据返回id查找user对象
		 * 4：把user对象放在session中
		 * */
		Object results = new SimpleHash("MD5", pass_word, ByteSource.Util.bytes(user_name), 10);
		System.out.println(results.toString());
		User user = new User();
		user.setUphone(user_name);
		user.setUpassword(results.toString());
		//如果登入成功
		User user2 =  iUserService.getUser(user);

		if(user2!=null) {
			//证明有值,登入成功
			map.put("status",1);
			String serchName = "http://127.0.0.1:8080/Finances/toindex";
			serchName = java.net.URLDecoder.decode(serchName,"UTF-8");
			System.out.println(serchName);
			map.put("url",serchName);
			map.put("comments","登入成功");
			
			
			/**
			 * 把用户信息存放进session
			 * */
			session.setAttribute("user",user);
			
		}else {
			map.put("status",5);
			map.put("message","账号密码输入错误或账号不存在");
			
		}
		
		
		String aa = mapper.writeValueAsString(map);
		System.out.println(aa);

		return aa;
	}
	
	
}
