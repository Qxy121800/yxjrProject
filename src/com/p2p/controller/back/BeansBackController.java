package com.p2p.controller.back;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 开发人:汪栋才
 * 2017-11-13
 * 此conteroller是访问后台页面的
 * */
@Controller
@RequestMapping("/back")
public class BeansBackController {
	  
	/**
	 * 进入后台登陆界面
	 * */
	@RequestMapping(value="/tologin")
	public String toBackLogin(HttpServletRequest request){
		return "views/back/login";
	}
	
	/**
	 * 进入后台主界面
	 * */
	@RequestMapping(value="/toindex")
	public String toBackIndex(HttpServletRequest request, ModelMap model){
		HttpSession session = request.getSession(true);  
        Subject employee = SecurityUtils.getSubject();  
        String  empName= (String) employee.getPrincipal();  
        session.setAttribute("empName", empName);  
		return "views/back/index";
	}
	
	
	/**
	 * 进入后台权限页面
	 * */
	@RequestMapping(value="/toRole")
	public String toBackRole(HttpServletRequest request){
		return "views/back/role";
	}
	
}
