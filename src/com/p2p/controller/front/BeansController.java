package com.p2p.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.p2p.pojo.Indexpic;
import com.p2p.service.back.IndexpicService;
/**
 * 开发人:汪栋才
 * 2017-11-13
 * 此conteroller是访问前台页面的
 * */
@Controller
public class BeansController {
	
	@Resource(name="indexpicServiceImpl")
	private IndexpicService indexpicService;
	/**
	 * 进入首界面(index.jsp)
	 * */
	@RequestMapping(value="/toindex")
	public ModelAndView toFrontIndex(Model model){
		ModelAndView mo = new ModelAndView();
		List<Indexpic> lists = indexpicService.getAllModel();
		mo.addObject("indexpicList", lists);
		
		model.addAttribute("pageName","index");
		
		mo.setViewName("views/front/index");
		return mo;
	}	
	/**
	 * 访问注册界面(register.jsp)
	 * */
	@RequestMapping(value="/toregirset")
	public String toRegirset(){
		return "views/front/register";
	}
	
	/**
	 * 访问登入界面(login.jsp)
	 * */
	@RequestMapping(value="/tologin")
	public String toLogin(){
		
		return "views/front/login";
	}
	
	/**
	 * 访问登入界面(login.jsp)
	 * */
	@RequestMapping(value="/toLoginHaveYQ")
	public ModelAndView toLoginHaveYQ(String code){
		ModelAndView mo = new ModelAndView();
		mo.setViewName("views/front/register");
		mo.addObject("qycode",code);
		return mo;
	}
	
	
	
	/**
	 * 进入 会员商城界面(membermall.jsp)
	 * */
	@RequestMapping(value="/tomembermall")
	public ModelAndView toFrontMember(Model model){
		ModelAndView mo = new ModelAndView();
		
		model.addAttribute("pageName","business");
		mo.setViewName("views/front/membermall");
		return mo;
	}
	
	/**
	 * 退出前台登录
	 * */
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/tologin";
	}
}
