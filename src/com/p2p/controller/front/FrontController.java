package com.p2p.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.p2p.pojo.Setupnatice;
import com.p2p.pojo.User;
import com.p2p.service.front.SetupnaticeService;


/**
 * 开发人:杨嘉辉
 * 2017-11-13
 * 此conteroller是访问前台页面的
 * */
@Controller
public class FrontController {
	
	@Resource(name="setupnaticeServiceImpl")
	private SetupnaticeService setupnaticeService;
	
	
	/**
	 * 头部的conteroller
	 * */
	@RequestMapping(value="/tohead")
	public String toheadIndex() {
		return "views/front/include/head";
	}
	
	/**
	 * 足部的conteroller
	 * */
	@RequestMapping(value="/tofoot")
	public String tofootIndex() {
		return "views/front/include/floot";	
	}
	
	/**
	 * 我要投资页面的conteroller
	 * */
	@RequestMapping(value="/toinvest")
	public ModelAndView tofroninvest(Model model){
		ModelAndView mo = new ModelAndView();
		
		model.addAttribute("pageName", "invset");
		
		mo.setViewName("views/front/invest");
		return mo;
	}
	
	/**
	 * 安全保障页面的conteroller
	 * */
	@RequestMapping(value="/toguarantee")
	public ModelAndView tofronguarantee(Model model) {
		ModelAndView mo = new ModelAndView();
		
		model.addAttribute("pageName", "security");
		
		mo.setViewName("views/front/guarantee");
		return mo;
	}
	
	/**
	 * 关于我们页面的conteroller
	 * */
	@RequestMapping(value="/toabout")
	public ModelAndView tofronabout(Model model) {
		ModelAndView mo = new ModelAndView();
		
		model.addAttribute("pageName", "about");
		
		mo.setViewName("views/front/about");
		return mo;
	}
	
	/**
	 * 我的账户页面的conteroller
	 * */
	@RequestMapping(value="/tousercenter")
	public ModelAndView tofronusercenter(Model model) {
		ModelAndView mo = new ModelAndView();
		
		model.addAttribute("pageName", "myinfo");
		
		mo.setViewName("views/front/user/usercenter");
		return mo;
	}
	
	/**
	 * 活动专区页面的conteroller
	 * */
	@RequestMapping(value="/toactivity")
	public ModelAndView tofronactivity(Model model) {
		ModelAndView mo = new ModelAndView();
		
		model.addAttribute("pageName", "activity");
		
		mo.setViewName("views/front/activity");
		return mo;
	}
	
	/**
	 * 成长值中心页面的conteroller
	 * */
	@RequestMapping(value="/togrowth")
	public String tofrongrowth() {
		return "views/front/user/growthcenter";
	}
	
	/**
	 * 投资记录页面的conteroller
	 * */
	@RequestMapping(value="/toinvestrecord")
	public String tofroninvestrecord(){
		return "views/front/user/investrecord";
	}
	
	/**
	 * 回款计划页面的conteroller
	 * */
	@RequestMapping(value="/topayment")
	public String tofronpayment() {
		return "views/front/user/payment";
	}
	
	/**
	 * 债权页面的conteroller
	 * */
	@RequestMapping(value="/totransfer")
	public String tofrontransfer() {
		return "views/front/user/transfer";
	}
	
	/**
	 *邀请好友页面的conteroller
	 * */
	@RequestMapping(value="/toinviting")
	public String toinviting() {
		return "views/front/inviting";
	}
	
	/**
	 *微商资金管理页面的conteroller
	 * */
	@RequestMapping(value="/toopen")
	public String toopen() {
		return "views/front/openbankid";
	}
	
	/**
	 *奖励金流水页面的conteroller
	 * */
	@RequestMapping(value="/toreward")
	public String toreward() {
		return "views/front/management/rewardrecord";
	}
	
	/**
	 *我的红包页面的conteroller
	 * */
	@RequestMapping(value="/toredpack")
	public String toredpack() {
		return "views/front/management/redpacket";
	}
	
	/**
	 *我的加息券页面的conteroller
	 * */
	@RequestMapping(value="/tointerest")
	public String tointerest() {
		return "views/front/management/interestcoupon";
	}
	
	/**
	 *我的钱帮币页面的conteroller
	 * */
	@RequestMapping(value="/tomycoin")
	public String tomycoin() {
		return "views/front/management/mycoin";
	}
	
	/**
	 *站内消息页面的conteroller
	 * */
	@RequestMapping(value="/tomsg")
	public String tomsg() {
		return "views/front/message/sitemsg";
	}
	
	/**
	 *通知设置页面的conteroller
	 * */
	@RequestMapping(value="/tosetmsg")
	public String tosetmsg(HttpSession session,Model model) {
		/**
		 * 从session获取user对象
		 * 如果取得的是空则会跳会首界面
		 * */
		User user = (User)session.getAttribute("user");
		if(user==null) {
			return "redirect:/toindex";
		}
		List<Setupnatice> setupnatice2 = setupnaticeService.getUserSetup(user.getUid());
		model.addAttribute("setupnatice",setupnatice2);
		return "views/front/message/setmsg";
	}
	
	/**
	 *业务特色页面的conteroller
	 * */
	@RequestMapping(value="/totures")
	public String totures() {
		return "views/front/aboutwe/features";
	}
	
	/**
	 *大事记页面的conteroller
	 * */
	@RequestMapping(value="/tobilia")
	public String tobilia() {
		return "views/front/aboutwe/memorabilia";
	}
	
	/**
	 *媒体报道页面的conteroller
	 * */
	@RequestMapping(value="/tocover")
	public String tocover() {
		return "views/front/aboutwe/coverage";
	}
	
	/**
	 *网站公告页面的conteroller
	 * */
	@RequestMapping(value="/tonot")
	public String tonot() {
		return "views/front/aboutwe/notice";
	}
	
	/**
	 *管理团队页面的conteroller
	 * */
	@RequestMapping(value="/toteam")
	public String toteam() {
		return "views/front/aboutwe/team";
	}
	
	/**
	 *联系我们页面的conteroller
	 * */
	@RequestMapping(value="/tocon")
	public String tocon() {
		return "views/front/aboutwe/contact";
	}
	
	/**
	 *企业理财页面的conteroller 
	 * */
	@RequestMapping(value="/tofinan")
	public String tofinan() {
		return "views/front/financing";
	}
	
	/**
	 *帮助中心页面的conteroller 
	 * */
	@RequestMapping(value="/tohelp")
	public String tohelp() {
		return "views/front/help";
	}
	
	/**
	 *忘记密码页面的conteroller 
	 * */
	@RequestMapping(value="/toforget")
	public String toforget() {
		return "views/front/forget";
	}
	
	/**
	 * 账户设置页面的controller
	 * */
	@RequestMapping(value="/userverify")
	public ModelAndView toUserVerify(Model model) {
		ModelAndView mo = new ModelAndView();
		
		model.addAttribute("pageName", "myinfo");
		
		mo.setViewName("views/front/user/userverify");
		return mo;
	}
	
	/**
	 *忘记密码页面的conteroller 
	 * */
	@RequestMapping(value="/tocode")
	public String tocode() {
		return "views/front/qrcode";
	}

}
