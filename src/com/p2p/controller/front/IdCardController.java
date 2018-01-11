package com.p2p.controller.front;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.p2p.controller.back.SendMsgUtil;
import com.p2p.pojo.AuthebDetais;
import com.p2p.pojo.Bank;
import com.p2p.pojo.IdCard;
import com.p2p.pojo.Redmoney;
import com.p2p.pojo.User;
import com.p2p.pojo.Userbackcard;
import com.p2p.pojo.Userinfo;
import com.p2p.pojo.Users;
import com.p2p.pojo.Uservouch;
import com.p2p.pojo.Withdrawals;
import com.p2p.pojo.WithdrawalsServiceP2p;
import com.p2p.service.back.AuthebDetaisService;
import com.p2p.service.back.MessageUtilService;
import com.p2p.service.back.RedmoneyService;
import com.p2p.service.back.SendMsgService;
import com.p2p.service.back.UservouchService;
import com.p2p.service.front.IUserService;
import com.p2p.service.front.IdCardService;
import com.p2p.service.front.UserInfoService;
import com.p2p.service.front.UserbackcardService;
import com.p2p.util.BankUtil;
import com.p2p.util.DateUtils;
import com.p2p.util.MessageBenas;
import com.p2p.util.SendServiceUtil;

/**
 * 操作身份证  以及  银行卡Controller
 * 
 * @author  lxj
 * */
@Controller
@RequestMapping("idcard")
public class IdCardController {
	
	@Resource(name="sendMsgServiceImpl")
	private SendMsgService sendmsg;
	
	@Resource(name="messageUtilServiceImpl")
	private MessageUtilService messageUtil;
	
	@Resource(name="idCardServiceImpl")
	private IdCardService idCardService;  //身份证
	
	@Resource(name="userbackcardServiceImpl") 
	private UserbackcardService userbackcardService;  //银行卡
	
	@Resource(name="userInfoServiceImpl")
	private UserInfoService userInfoService;  //用户基本信息
	@Resource(name="IUserServiceImpl")
	private IUserService iUserService;  //用户
	@Resource(name="authebDetaisServiceImpl")
	private AuthebDetaisService authebDetaisService;  //消息
	
	//红包
	@Resource(name="redmoneyServiceImpl")
	private RedmoneyService redmoneyservice;
	
	//代金券
	@Resource(name="uservouchServiceImpl")
	private UservouchService uservouchService;

	/**
	 * 添加(修改)身份证信息
	 * */
	@RequestMapping("/addinfo")
	@ResponseBody
	public int addInfo(IdCard idCard,HttpSession session) {
		int count = 0;
		try {
			if(idCard.getIcid()==null) {
				idCard.setIcstarttime(DateUtils.getDateTimeFormat(new Date()));
				idCard.setIcstatus(1);
				count = idCardService.addModel(idCard);
				count = 1;
			}else {
				idCard.setIcstatus(1);
				count = idCardService.update(idCard);
				count = 2;
			}
			AuthebDetais authebDetais = new AuthebDetais();
			authebDetais.setAdintroduct("用户: "+idCard.getIcname()+",已输入身份信息,需后台管理员审核通过!");
			authebDetais.setAdtime(DateUtils.getDateTimeFormat(new Date()));
			authebDetais.setUiid(idCard.getUiid());
			authebDetaisService.addModel(authebDetais);
			
			Userinfo userinfos = new Userinfo();
			userinfos.setUiid(idCard.getUiid());
			userinfos.setUiopenstatus(1);
			int counts = userInfoService.update(userinfos);
			if(counts>0) {
				Userinfo uifo = userInfoService.getModel(userinfos);
				session.setAttribute("userinfo", uifo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 获取银行卡所属类型
	 * @throws JsonProcessingException 
	 * */
	@RequestMapping("/getCardType")
	@ResponseBody
	public String getCardType(@RequestParam String ubbackcardnum) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper(); 
		Map<String, Object> map = new HashMap<String, Object>();
		
		Userbackcard ub = new Userbackcard();
		ub.setUbbackcardnum(ubbackcardnum);
		Userbackcard ubd = userbackcardService.getModel(ub);
		if(ubd!=null){
			map.put("status",0);
		}else{
			String type = BankUtil.getNameOfBank(ubbackcardnum);
			if(type!="") {
				map.put("status",1);
				map.put("type",type);
			}
		}
		String result = mapper.writeValueAsString(map);
		return result;
	}
	
	/**
	 * 添加银行卡(需要与服务端连接)
	 * */
	@RequestMapping("/addbackcard")
	@ResponseBody
	public int addBankCard(Userbackcard userback,HttpSession session) {
		int addCard = 0;
		Integer uiid = userback.getUiid();
		try {
			if(uiid!=null) {
				//客服端银行卡设值
				Userbackcard bank = new Userbackcard();
				bank.setUiid(uiid);
				bank.setUbbackcardnum(userback.getUbbackcardnum());
				bank.setUbplaceback(userback.getUbplaceback());
				bank.setUbbindtime(DateUtils.getDateTimeFormat(new Date()));
				bank.setUbstatus(1);
				bank.setUbmoney(100000.00);
				
				//获取客服端用户基本信息表、身份证表、用户表中字段信息
				Userinfo userinfo = new Userinfo();
				userinfo.setUiid(uiid);
				Userinfo userinfos = userInfoService.getModel(userinfo);
				IdCard idcard = userinfos.getIdCard();
				User user = new User();
				user.setUid(userinfos.getUid());
				User us = iUserService.getModel(user);
				
				//服务端用户表设值
				Users users = new Users();
				users.setSuid(userinfos.getUiid());
				users.setSuusername(userinfos.getUiname());
				users.setSuname(idcard.getIcname());
				users.setSuphone(us.getUphone());
				users.setSucard(idcard.getIcnumber());
				users.setSuemail(userinfos.getUiemail());
				users.setSumoney(bank.getUbmoney());
				users.setSucredit(us.getUcredit());
				
				//向服务端传递对象(url是服务端地址)
				int usercount = SendServiceUtil.list(users, "192.168.90.47:8080/ServiceP2p/user/add");
				
				//服务端银行卡设值
				Bank banks = new Bank();
				banks.setBsuid(bank.getUiid());
				banks.setBcode(bank.getUbbackcardnum());
				banks.setBtype(bank.getUbplaceback());
				banks.setBmoney(bank.getUbmoney());
				banks.setBstate(bank.getUbstatus());
				
				int bankcount = SendServiceUtil.list(banks, "192.168.90.47:8080/ServiceP2p/bank/add");
				
				//当服务端开通成功后才可以成功开户
				if(usercount==1 && bankcount==1) {
					addCard = userbackcardService.addModel(bank);
					
					Userinfo userinfo1 = new Userinfo();
					userinfo1.setUiid(uiid);
					userinfo1.setUiopenstatus(2);
					userInfoService.update(userinfo1);
					
					//用户开户成功，给与奖励红包和代金券
					Redmoney redmoney = new Redmoney();
					redmoney.setRmoney(30.0);
					redmoney.setRimage("/uploadFile/redmoney/redmoney1.jpg");
					redmoney.setRstardtime(DateUtils.getDateTimeFormat(new Date()));
					//获取当前时间的后几天
					Date date = new Date();  
					SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
					date = DateUtils.getDayAfter(date,15);
					redmoney.setRendtime(formatDate.format(date));
					redmoney.setUid(uiid);
					redmoneyservice.addModel(redmoney);
					
					//获得代金券
					Uservouch uservouch = new Uservouch();
					uservouch.setUid(uiid);
					uservouch.setUvday(30);
					uservouch.setUvstartDate(DateUtils.getDateTimeFormat(new Date()));
					//获取当前时间的后几天
					Date d = new Date();  
					SimpleDateFormat fDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
					date = DateUtils.getDayAfter(d, 30);
					uservouch.setUvendDate(fDate.format(d));
					uservouch.setUvimage("/uploadFile/redmoney/dai.jpg");
					uservouch.setUvmoney(2000.0);
					uservouchService.addModel(uservouch);
					
					addCard = 1;
					
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return addCard;
	}
	
	//根据银行卡去查询是否当前用户是否存在
	@RequestMapping(value="seleBybanknum")
	@ResponseBody
	public int seleBybanknum(String backnum,String bankicname,String bankphone) {
		int count = 0;
		try {
			Userbackcard uback = new  Userbackcard();
			uback.setUbbackcardnum(backnum);
			Userbackcard userbackcard = userbackcardService.seleBybanknum(uback);
			
			//服务端银行卡设值(如果服务端存在这张银行卡，服务端不添加,否则添加)
			Bank banks = new Bank();
			banks.setBsuid(userbackcard.getUiid());
			banks.setBcode(userbackcard.getUbbackcardnum());
			banks.setBtype(userbackcard.getUbplaceback());
			banks.setBmoney(userbackcard.getUbmoney());
			banks.setBstate(userbackcard.getUbstatus());
			SendServiceUtil.list(banks, "192.168.90.47:8080/ServiceP2p/bank/add");
			
			Userinfo uinfo = new Userinfo();
			uinfo.setUiid(userbackcard.getUiid());
			Userinfo userinfo = userInfoService.getModel(uinfo);
			User u = new User();
			u.setUid(userinfo.getUid());
			User user = iUserService.getModel(u);
			if(userbackcard!=null && bankicname.equals(userinfo.getIdCard().getIcname()) && bankphone.equals(user.getUphone())) {
				count = 1;
				//Ubstatus状态为1的银行卡为默认的银行卡
				Userbackcard ub = new  Userbackcard();
				ub.setUiid(userinfo.getUiid());
				Userbackcard ud = userbackcardService.getModel(ub);
				Userbackcard ucard = new  Userbackcard();
				ucard.setUbstatus(0);
				ucard.setUbid(ud.getUbid());
				userbackcardService.update(ucard);
				userbackcard.setUbstatus(1);
				userbackcardService.update(userbackcard);
			}
			else {
				count = 0;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			count = 0;
		}
		return count ;
	}
	
	/**
	 * 开户成功后需跳转的页面
	 * */
	@RequestMapping(value="/opensuccess")
	public String openCustody(Model model) {
		model.addAttribute("pageName", "myinfo");
		return "views/front/open_success";
	}
	@RequestMapping("updateBank")
	@ResponseBody
	public void updateBank(HttpServletRequest request,HttpServletResponse response) throws IOException {
		//判断请求报文是否来自代维系统的ip地址  
	     String ip = request.getRemoteHost(); 
		
	     System.out.println("ip地址="+ip);
	      
	   
	     try {
	    	//获取接收的报文
			BufferedReader reader=request.getReader();
			
			String line="";
			
			 StringBuffer inputString = new StringBuffer();  
		        while ((line = reader.readLine()) != null) {  
		        inputString.append(line);  
		     }  
	       
		    //jackJson    
	        ObjectMapper o=new ObjectMapper();
	        
	        Bank u=o.readValue(inputString.toString(), Bank.class);
	        System.out.println("接收的报文为= "+u);
	        Userbackcard userbackcard = new Userbackcard();
	        userbackcard.setUbbackcardnum(u.getBcode());
	        userbackcard.setUbmoney(u.getBmoney());
	        userbackcardService.update(userbackcard);
	        
	        //发送短信
	        User use=new User();
	        use.setUid(u.getBsuid());
	        User user=iUserService.getModel(use);
	        SendMsgUtil sUtil = new SendMsgUtil();
			Map<String,Object> orther = new HashMap<String,Object>();
			orther.put("userphone",user.getUphone());
			orther.put("money",u.getBmoney());
			try {
				sUtil.Send(user.getUphone(),MessageBenas.MSG_DEPOSIT,orther,sendmsg,messageUtil);
			} catch (Exception e) {
				//日志打印
				//map.put("status", 2);
				//map.put("msg","发送异常");
				e.printStackTrace();
			}
	       // 要返回的报文  
	       StringBuffer resultBuffer = new StringBuffer();  
	       resultBuffer.append("1");
	     
	       // 设置发送报文的格式  
	       response.setContentType("text/xml");  
	       response.setCharacterEncoding("UTF-8");  
	   
	       PrintWriter out = response.getWriter();  
	       out.println(resultBuffer.toString());  
	       out.flush();  
	       out.close();  
			
			
		} catch (IOException e) {
			StringBuffer resultBuffer = new StringBuffer();  
		       resultBuffer.append("2");
		     
		       // 设置发送报文的格式  
		       response.setContentType("text/xml");  
		       response.setCharacterEncoding("UTF-8");  
		   
		       PrintWriter out = response.getWriter();  
		       out.println(resultBuffer.toString());  
		       out.flush();  
		       out.close();  
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
