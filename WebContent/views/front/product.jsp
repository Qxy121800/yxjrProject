<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
	    <title>爱车贷-雪佛兰迈锐宝理财投资-爱钱帮2016年投标</title>
	    <!--[if lt IE 9]>
	    <script src="statics/newcommon/js/html5shiv.js"></script>
	    <![endif]-->
	    <link rel="Shortcut  Icon" href="/Finances/statics/other/lco/smalllog.png">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-commonNew.css">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/m2-main.css">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-common.css">
	    <script type="text/javascript" src="/Finances/statics/front/statics/home/js/jquery.min.js"></script>
	     
	    <script type="text/javascript" src="/Finances/statics/front/statics/newcommon/js/common.js"></script>
		
		<link rel="stylesheet" href="/Finances/statics/front/statics/home/css/newPage.css" />
	    <link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/m2-main.css">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/m2-loginModify.css">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/usercenter/css/userCenter.css">
	  
	  	<!-- 图形验证码 -->
		<script src="/Finances/statics/front/js/gVerify.js"></script>
	  	          
	    <style>
	        #msgbtn2_alert{
	            display: inline-block;
	            width:18px;
	            height:18px;
	            border-radius:50%;
	            background-color:#c9c9c9;
	            color:white;
	            line-height:18px;
	            position:relative;
	        }
	        #msgbtn2_alert_content {
	            position:absolute;
	            top:24px;
	            right:-17px;
	            width:400px;
	            height:23px;
	            background-image:url("/Finances/statics/front/statics/home/images/tankuang_lan.png");
	            padding-top:24px;
	            color:white;
	            display:none;
	        }
	    </style>
		
		
	</head>
	<body>
	
	
	
		<div class="m2-tranBg"></div>
	    <!-- 右侧边栏start -->
	    <jsp:include page="include/sidebar.jsp"></jsp:include>
	    <!-- 右侧边栏end -->
	    
	    <!-- 头部start -->
	    	<jsp:include page="include/head.jsp"></jsp:include>
	    <!-- 头部end -->
	    
	    
	
	    
	   	<script type="text/javascript" src="/Finances/statics/front/statics/home2/js/m2-front.js"></script>
    	<script type="text/javascript" src="/Finances/statics/front/statics/home2/js/jquery.knob.js"></script>
		
		<body style="background-color:#fff;">
		<!-- 注册托管弹窗start -->
		<div class="m2-truPop" style="display: none;">
		    <div class="m2-turPop-close"></div>
		    <div class="m2-truPop-radius">
		        <div class="m2-regist-inputarea m2-regist-sucess">
		            <!--<h4>开通托管账户</h4>-->
		            <div class="m2-truPop-det">
		
		                尊敬的用户：<br>                    <span id="openaccounttext"></span>
		            </div>
		            <table cellpadding="0" cellspacing="0" border="0">
		                <tbody>
		                <tr>
		                    <td><i class="m2-regist-usericon"></i>真实姓名</td>
		                    <td class="m2-regist-tdInput">
		                        <input type="text" class="m2-regist-username" placeholder="请输入真实姓名" id="realname">
		                        <span class="m2-regist-errMsg"></span>
		                    </td>
		                </tr>
		                <tr>
		                    <td><i class="m2-regist-idnumber"></i>身份证号</td>
		                    <td class="m2-regist-tdInput">
		                        <input type="text"  class="m2-regist-username" placeholder="请输入身份证号" id="idcard">
		                        <span class="m2-regist-errMsg"></span>
		                    </td>
		                </tr>
		                <tr>
		                    <td><i class="m2-regist-cardnumber"></i>手机号</td>
		                    <td class="m2-regist-tdInput">
		                        <span class="m2-reg-telSpan" style=""><span>13737301354</span></span>
		                        <span class="m2-regist-errMsg" style="color:#aaa;top:45px;">您的手机号需与开卡时手机号一致</span></td>
		                </tr>
		                <tr>
		                    <td><i class="m2-regist-cardnumber"></i>借记卡</td>
		                    <td class="m2-regist-tdInput">
		                        <input type="text" class="m2-regist-username" placeholder="请输入借记卡卡号" id="bankcardid">
		                        <span class="m2-regist-errMsgcard"><span></span><a href="/register-banklist" target="_blank">查看支持银行</a></span>
		                    </td>
		                </tr>
		
		                </tbody></table>
		            <div class="m2-trust-btn">
		                <input type="checkbox" checked="checked" id='service'>我同意<b><a href="/invest-c1" target="_blank">《徽商银行网络交易资金账户服务三方协议》</a></b>
		            </div>
		            <div class="m2-regist-btn m2-regist-quit">
		                <a class="m2-regist-look" href="#">我先看看</a>
		                <a href="#" id="openbank">立即支付</a>
		            </div>
		        </div>
		    </div>
		</div>
		<script type="text/javascript">
		    $(function () {
		        $('.m2-turPop-close').click(function () {
		            $('.m2-tranBg,.m2-truPop').hide();
		        });
		    })
		</script>
		<!-- 注册托管弹窗end -->
		<div class="m2-userCentercommon-confirm" style="top:30%;padding-top:10px;display:none"  id='dialog-info-div'>
		    <span class="m2-userCentercommon-confirmClose"></span>
		    <div style="text-align: center;padding: 20px 0 20px 0;">
		        <h3 id='dialog-info-text'></h3>
		    </div>
		    <p class="m2-userCommon-confirmBtn">
		        <a class="m2-user-confirmBtn">确定</a>
		    </p>
		</div>
		<div class="m2-detConfirm">
    <b class="m2-detConfirm-close"></b>
    <div class="m2-detConfirm-head" id="msgtitle">

    </div>
    <div class="m2-detConfirm-main" id="msgcontent">

    </div>
    <div class="m2-detConfirm-btn" id="msgbtn2" style="display:none;width:350px;">
        <a href="javascript:void(0)" class="m2-detConfirmbtn-confirm" onclick="$('#invest_form').submit();" style="float:right;margin-right:50px;">确认投资</a>
        <a href="javascript:void(0)" class="m2-detConfirmbtn-cancle" style="float:left;margin-left:62px;">取消</a>
        <div style="clear:both;"></div>
        <div style="margin-top: 10px;">
            <img alt="爱钱帮" src="/Finances/statics/front/statics/home/images/duihao.png" width="12px">
            <span>投资需前往徽商银行交易系统验证交易密码（也用于提现）</span>
            <div id="msgbtn2_alert">
                <span>?</span>
                <div id="msgbtn2_alert_content">
                    交易密码适用于投资验证及提现验证，可在账户设置中进行修改或找回
                </div>
            </div>
        </div>
    </div>
    <div class="m2-detConfirm-btn" id="msgbtn3" style="display:none">
        <!--            <a href="#?chargereturnurl=/invest-borrownew-id-moxOeTwTZaOw8TY79g.shtml" target="_blank" class="m2-detConfirmbtn-confirm" style="float:right;">立即支付</a>-->
        <a href="javascript:void(0)" onclick="rechargeInvest();" class="m2-detConfirmbtn-confirm" style="float:right;">立即支付</a>
        <a href="javascript:void(0)" class="m2-detConfirmbtn-cancle" style="float:left;">取消</a>
    </div>
		<div class="m2-detConfirm-btn" id="msgbtn1" style="display:none">
		 <a href="javascript:void(0)" class="m2-detConfirmbtn-center">确认</a>
		</div>
		   	<div class="m2-detConfirm-btn" id="msgbtn4" style="display:none">
		        <a href="javascript:void(0)" class="m2-detConfirmbtn-cancle" style="float:left;">取消</a>
		        <a href="#?isXl=1" class="m2-detConfirmbtn-confirm"  style="float:right;">设置交易密码</a>
		    </div>
		</div>
		<div class="m2-detHide" style="display:none;">
    <i class="m2-detHide-close"></i>
    <h2 class="m2-detHidehead-tit">使用奖励<span></span></h2>
    <div class="m2-detHide-selBox">
        <ul>
            <li class="m2-detHidesel-list m2-detHidesel-listPri">
                <i class="m2-detHideicon-pri"></i>
                <span class="m2-detHidecheck-unsel"><b class="m2-detBtnhide-pri"></b>奖励金</span>
            </li>
            <li class="m2-detHidesel-list m2-detHidesel-listRed">
                <i class="m2-detHideicon-red"></i>
                <span class="m2-detHidecheck-unsel"><b class="m2-detBtnhide-red"></b>红&nbsp;&nbsp;&nbsp;包</span>
            </li>
            <li class="m2-detHidesel-list m2-detHidesel-listAdd">
                <i class="m2-detHideicon-add"></i>
                <span class="m2-detHidecheck-unsel"><b class="m2-detBtnhide-add"></b>加息券</span>
            </li>
        </ul>
    </div>
    <div class="m2-detHidecon-pri" style="display:none;">
        <div class="m2-detHidecon-link">
            <!--<a href="#">如何获取&raquo;</a>-->
        </div>
        <div class="m2-detHidemain-pri">
            <p class="m2-detHide-nor">奖励金金额：<span>0</span><i>元</i></p>
            <div class="m2-detHidepri-ipt">
                <input placeholder="0.00" type="text" id="rewardmoney">
                <span>全用</span>
                <b id="rewardmoneyerror"></b>
            </div>
            <div class="m2-detHide-submit m2-detSub-pri"><a style="margin:25px 0 0 80px" href="javascript:void(0)">确定</a></div>
        </div>
    </div>

    <div class="m2-detHidecon-red"  style="display:none;">
        <div class="m2-detHidecon-link">
            <!--<a href="#">如何获取&raquo;</a>-->
        </div>
        <div class="m2-detHidemain-red">
            <p class="m2-detHide-nor">已选择红包金额：<span id="reward_red">0元</span></p>
            <ul>
                <li class="m2-detHidered-unsel reward-item" style="display: none" data-condition="200" data-rewardid="2498620" data-rewardtype="1" data-rewardval="8.00">
                    <div class="m2-detHidered-num"><span>8.00</span>元红包</div>
                    <div class="m2-detHidered-tim">7天后过期</div>
                    <div class="mo2-detHide-icon"><i></i></div>
                </li><li class="m2-detHidered-unsel reward-item" style="display: none" data-condition="1000" data-rewardid="2498621" data-rewardtype="1" data-rewardval="10.00">
                <div class="m2-detHidered-num"><span>10.00</span>元红包</div>
                <div class="m2-detHidered-tim">30天后过期</div>
                <div class="mo2-detHide-icon"><i></i></div>
            </li><li class="m2-detHidered-unsel reward-item" style="display: none" data-condition="5000" data-rewardid="2498622" data-rewardtype="1" data-rewardval="20.00">
                <div class="m2-detHidered-num"><span>20.00</span>元红包</div>
                <div class="m2-detHidered-tim">30天后过期</div>
                <div class="mo2-detHide-icon"><i></i></div>
            </li>                </ul>
            <div class="m2-detHide-pagebox">
                <span class="m2-detHidered-cancle">取消选择</span>
                <!--<div class="m2-detHide-page"><span>上一页</span><span>下一页</span></div>-->
            </div>
            <div class="m2-detHide-submit m2-detSub-red"><a href="javascript:void(0)">确定</a></div>
        </div>
    </div>

    <div class="m2-detHidecon-add" style="display:none;" >
        <div class="m2-detHidecon-link">
            <!--<a href="#">如何获取&raquo;</a>-->
        </div>
        <div class="m2-detHidemain-add">
            <p class="m2-detHide-nor">加息券带来额外收益：<span id="reward_coupon">0元</span></p>
            <ul>
            </ul>
            <div class="m2-detHide-pagebox">
                <span class="m2-detHidered-cancle">取消选择</span>
                <!--<div class="m2-detHide-page"><span>上一页</span><span>下一页</span></div>-->
            </div>
       		 </div>
		        <div class="m2-detHide-submit m2-detSub-add"><a href="javascript:void(0)">确定</a></div>
		    </div>
		</div>
		<div class="m2-parHidebox" style="margin-bottom:50px;">
		    <b class="m2-parHideclose"></b>
		    <h2></h2>
		    <div class="m2-parHideimg">
		        <img src="" alt="">
		        <div class="m2-parHideimg-lef"></div>
		        <div class="m2-parHideimg-rig"></div>
		    </div>
		    <div class="m2-parHidefoot">
		        <span class="m2-parPagecurrent"></span>&frasl;<span class="m2-parPagetotal"></span>
		        <i class="m2-parPageprev"></i><i class="m2-parPagenext"></i>
		    </div>
		</div>
		<div class="m2-tranHide">
		    <i class="m2-tranHide-close"></i>
		    <h2 class="m2-tranHide-head">投资收益计算器</h2>
		    <div class="m2-tranHide-box">
		        <div class="m2-tranHidetit">
		            <span>所选项目：</span>
		            【新手标】爱车贷-雪佛兰迈锐宝-XAA067            </div>
		        <div class="m2-tranHiderem">
		            <span>徽商账户余额：</span>
		            <span style="color:#ea731e;">0元</span>
		            <b class='invest_all'>全用</b>
		        </div>
		        <div class="m2-tranHidenum">
		            <span>投资金额：</span>
		            <input placeholder="请输入金额" type="text" id='invest_money1'>
		            <span class="m2-tranHidenum-btn">确认返回</span>
		            <b>投资金额应为100的整数倍</b>
		        </div>
		    </div>
		    <div class="m2-tranHide-info">
		        <div class="m2-tranInfo-sum">投资到期可获得总收益：<span id='interesttotal' data-totalinterest='0.64109589041096'>0元</span></div>
		        <div class="m2-tranInfo-num">起投金额：<span>100元</span>投资金额：<span id='invest_money2'>0元</span></div>
		    </div>
		    <div class="m2-tranHidelist">
		        <ul>
		            <li>
		                <div class="m2-tranHide-det m2-tranHide-day">计息天数:<span>26天</span></div>
		                <div class="m2-tranHide-det m2-tranHide-tim">支付时间:<span>2016-10-01</span></div>
		                <div class="m2-tranHide-det m2-tranHide-num" data-interest="0.64109589041096" data-days="26">支付利息:<span>0元</span></div>
		            </li>            </ul>
		    </div>
		    <div class="m2-tranHidetoggle m2-tranMore">
		        <span>显示更多&raquo;</span>
		    </div>
		    <p class="m2-transHide-bottom">偿还本金: <span style="color:#ea731e;" id="invest_money3">0元</span></p>
		</div>
		
		<div class="m2-carBanner"></div>
		<div class="m2-investBread">
		    <div class="m2-investBreadbox">
		        <i class="m2-investBreadicon"></i>
		        <span class="m2-invBre-fat"><a href="/Finances/toindex">首页&nbsp;&gt;</a></span>
		        <span class="m2-invBre-fat"><a href="/Finances/toinvest">我要投资&nbsp;&gt;</a></span>
		        <a class="m2-invBre-cur" >项目详情</a>
		    </div>
		</div>
		<div class="m2-detialsCon">
		 <div class="m2-detialsItembox">
	        <h2>
	            <span class="m2-detialsItembox-lef">【新手标】爱车贷-雪佛兰迈锐宝-XAA067</span>
	            <span class="m2-detialsItembox-rig">项目编号：XACD201609067</span>
	        </h2>
	    </div>
	    <div class="m2-detialsItem">
	        <div class="m2-detItemlef">
	            <div class="m2-detItemlef-img">
	                <i class="m2-detItemlef-newIcon"></i>                <img  src="/Finances/statics/front/uploadData/UserBorrowData/182015-20160902132425642.jpg" alt="" width='256' height="200">
	
	                <p class="m2-detItemlef-imgSha" style="margin-top: 0">
	                    <script type="text/javascript" src="http://v3.jiathis.com/code_mini/jia.js" charset="utf-8"></script>
	                <div class="jiathis_style" style='margin-top: 10px;margin-left: 50px;min-height:16px;'>
	                    <span class="jiathis_txt" style='color:#898989;font-size: 14px;'>分享到：</span>
	                    <a class="jiathis_button_qzone" style="min-height:16px;"></a>
	                    <a class="jiathis_button_tsina" style="min-height:16px;"></a>
	                    <a class="jiathis_button_tqq" style="min-height:16px;"></a>
	                    <a class="jiathis_button_weixin" style="min-height:16px;"></a>
	                    <a href="#"  style="min-height:16px;" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank" style='color:#898989;font-size: 14px;'>更多</a>
	                </div>
	                <div style="padding-top: 24px;margin-left: 38px;"><span style='color:#898989;font-size: 12px;'>邀请好友投资，双方有奖!</span>
	                    <span id="d_clip_button" class="button" style="color:#ba3635;font-size:12px;margin-right: 30px;">复制推广链接</span>
	                    <!-- 推广URL -->
	                    <input type="hidden" id="tgid" value="127.0.0.1:8080/Finances/topro">
	                    <span id="d_clip_container" style="position:relative;background:#fff000;height:20px;font-size:12px;right:0px"></span></div>
	                </p>
	                 <script type="text/javascript" src="${pageContext.request.contextPath}/statics/front/zer/ZeroClipboard_mo.js"></script>
	
	            </div>
	
	            <div class="m2-detItemlef-con">
	                <ul>
	                    <li style='width: 160px;padding-left: 15px;'>
	                        <span class="m2-detItempsg-big huodongjiaxi" style="white-space: nowrap;">
	                            									                               			 8%+1%
	                              	<p style="margin-top:0;margin-left:-2px;" class="jiaxishow">
	                                    <if condition="$vo['additional_rights_detail'] neq ''">
	                                        活动加息1%																			</p>
	                            </if>
	                        </span>
	                        <span class="m2-detItempsg-nor">预期年化收益率</span>
	                        <i class="m2-detItemlef-line"></i>
	                    </li>
	                    <li style="width:205px;">
	                        <span class="m2-detItempsg-big">26天(1个月)
	                                </span>
	                        <span class="m2-detItempsg-nor">期限</span>
	                    </li>
	                    <li style='width: 160px;padding-left: 15px;'>
	                        <span class="m2-detItempsg-big">8.62万</span>
	                        <span class="m2-detItempsg-nor">产品金额</span>
	                    </li>
	                    <li>
	                        <span class="m2-detItempsg-sma">还款日期：2016-10-01</span>
	                    </li>
	                </ul>
	                <div class="m2-detPro">
	                    <div class="m2-derProgress">
	                        <span>                                正在募集
	                                    ：</span>
	                        <b><i style="width: 85.26%;"></i></b>
	                        <span>85.26%</span>
	                    </div>
	                    <div class="m2-detProdet">
	                        <span class="m2-detProdet-lef">投资万元预期收益：<span>64.11元</span></span>
	                        <a href="/member-contract-project-id-11606.shtml" class="m2-detProdet-rig" target='_blank'>项目合同范本<i></i></a>
	                    </div>
	                </div>
	                <div class="m2-detItemlef-bot">
	                    <a href="javascript:void(0)" class="m2-detIetmbot2" title='担保措施：车辆质押（押车押手续）' style='margin-right: 24px;'><i></i>担保措施</a>                    <a href="javascript:void(0)" class="m2-detIetmbot3" style='margin-right: 0px;' title='还款方式：按日计息，到期还本息'>
	                    <i></i>还款方式</a>
	                </div>
	            </div>
	        </div>
	        <div class="m2-detItemrig"  style="display:none;">
	            <div class="m2-detRig-unlogin m2-detRig-select">
	                <div class="m2-detRiglogin">
	                    <p class="mo2-proNewdet">可投金额：<span id='left_money'>12,700.00                                元 </span></p>
	                    <p>徽商账户余额：0元<a style="color: #09c;float: right;margin-right: 30px;" href='#?chargereturnurl=/invest-borrownew-id-moxOeTwTZaOw8TY79g.shtml' target="_blank">充值</a>
	                    </p>
	                </div>
	                <div class="m2-detRigipt">
	                    <input placeholder="100元起投" type="text" id="invest_money"> <span  class='invest_all'>全投</span>
	                </div>
	                <div class="m2-detRigjust">
	                    <b class="m2-detRigjust-btn"></b>
	                    <!--<b class="m2-detRigjust-lef" style="color: #f5944f;cursor: pointer;">使用奖励</b>-->
	
	                    <b class="m2-detRigjust-btn"></b>
	                    <!--<b class="m2-detRigjust-lef" id='m2-detRigjust-lef' style="color: #f5944f;cursor: pointer;">使用奖励</b>-->
	
	                    <b class="m2-detRigjust-btn"></b><em id='reward_info'></em>
	                    <span class="m2-detJust-tit reward-select" id='reward_tip'><i></i>未使用任何奖励</span>
	                </div>
	                <p class="m2-detRigjust-ben">本次收益：<span id="interest_money">0元</span><span>+</span><span id="reward_money">0元</span></p>
	            </div>
	
	            <div class="m2-detRigjust-linkBtn">
	
	                <a id="invest_now" href="javascript:void(0)">立即投资</a>
	                <i id='interestcal' class='m2-detRigjust-linkBtning'></i>
	
	
	            </div>
	            <p class="m2-detRigjust-coin">投资可得钱帮币：<span id="qb_coin">0个</span>
	                <!--            -->
	                <!--                -->
	                <!--                    <i class="m2-detCode">-->
	                <!--                        邀请码-->
	                <!--                    </i>-->
	                <!---->
	                <!--                -->
	            </p>
	            <div class="m2-detCodehide" style="display:none;">
	                <span class="m2-detCodehead-lef">使用邀请码</span>
	                <span class="m2-detCodehead-rig">关闭</span>
	                <div class="m2-detCodeinput">
	                    <span class="m2-detCodeinput-tit"><i></i>邀请码：</span>
	                    <input type="text" placeholder="仅限首次投资有效" id="invitecode">
	                </div>
	                <p class="m2-detCode-tips" id="invitereward"></p>
	            </div>
	        </div>
	        <div class="m2-detItemtim">
	            <div class="m2-detItemtim-box">
	                <h4>离开始投资</h4>
	                <ul class="m2-detItemtim-list">
	                    <li class="m2-detDay" style="display:none;"><i></i>天</li>
	                    <li class="m2-detHou"><i>1</i>时</li>
	                    <li class="m2-detMin"><i>12</i>分</li>
	                    <li class="m2-detSec"><i>58</i>秒</li>
	                </ul>
	                <p class="m2-detItemtim-sma">开标时间</p>
	                <p class="m2-detItemtim-nor"><span style="margin-right:15px;">09月04日</span><span>15:00:00</span></p>
	            </div>
	        </div>
	    </div>
	   	<div class="m2-detialsAct">
	        <h2><i></i>项目活动</h2>
	        <div class="m2-detActbox">
	            <div style="padding-left:30px;" id="borrowactivity">
	            </div>
	            <!--<div class="m2-detActbottom">-->
	            <!--                <a class="m2-detActlink-lef" href="#">提升攻略&uarr;</a>
	                            <a class="m2-detActlink-rig" href="#">了解更多&raquo;</a>-->
	            <!--</div>-->
	        </div>
	    </div>
	    <script>
	        $('.m2-detActbox td').css('height', '34px');
	        $('.m2-detActbox span').css('font-family', 'Microsoft YaHei, Arial');
	        $('.m2-detActbox span').css('color', '#717171');
	        $('.m2-detActbox font').css('color', '#717171');
	    </script>
	    <div class="m2-detSit m2-detSection">
		        <h3> 产品概要<i></i></h3>
		        <div class="m2-detSitbox m2-det-togBox" style="max-height: 2000px;">
		            <!--            <p style='font-size: 14px;line-height: 26px;'>“爱车贷-汽车质押贷款”是爱钱帮在汽车金融垂直领域的新产品，联手线下专业车贷团队，为投资人提供期限1至3个月的优质短期投资项目。
		                     1.平台上发布的质押车辆，车辆手续齐全，借款人信息实名认证，专业团队实地评估车辆性能与价格、借款人信用情况；
		                     2.采用车贷业内安全级别最高的风控手段——押车押手续，车辆入库保管，车场设有屏蔽器，互联网监控设备，车辆手续存入保险柜。根据不同城市车市值存在差价以及冷热门车，设置的质押率控制在估值的85%以内；大额度车辆要求质押并过户抵押；
		                     3.项目到期由担保公司进行债权回购。</p>-->
		            <p style='font-size: 14px;line-height: 26px;'>产品金额为8.62万元。借款人的信用良好。
		                质押车辆基本信息：
		                车辆型号：迈锐宝
		                车辆购买时间：2014-07-23
		                公里数：31986公里
		                二手市场评估价格：17.5万
		                车辆是否有贷款：是</p>
		        </div>
		        <div class="m2-detSec-toggle">
		            <!--<span class="m2-detSec-down">展开<i></i></span>
		        --></div>
		    </div>
		
		    <div class="m2-detSit m2-detSection">
		        <h3>
		            项目情况
		            <i></i>
		        </h3>
		        <div class="m2-detSitbox m2-det-togBox">
		            <!--            <p style='font-size: 14px;line-height: 26px;'>产品金额为8.62万元。借款人的信用良好。
		                                     质押车辆基本信息：
		                                     车辆型号：迈锐宝
		                                    车辆购买时间：2014-07-23
		                                    公里数：31986公里
		                                   二手市场评估价格：17.5万
		                                   车辆是否有贷款：是</p>-->
		            <p style='font-size: 14px;line-height: 26px;'>“爱车贷-汽车质押贷款”是爱钱帮在汽车金融垂直领域的新产品，联手线下专业车贷团队，为投资人提供期限1至3个月的优质短期投资项目。
		                1.平台上发布的质押车辆，车辆手续齐全，借款人信息实名认证，专业团队实地评估车辆性能与价格、借款人信用情况；
		                2.采用车贷业内安全级别最高的风控手段——押车押手续，车辆入库保管，车场设有屏蔽器，互联网监控设备，车辆手续存入保险柜。根据不同城市车市值存在差价以及冷热门车，设置的质押率控制在估值的85%以内；大额度车辆要求质押并过户抵押；
		                3.项目到期由担保公司进行债权回购。</p>
		        </div>
		        <div class="m2-detSec-toggle">
		            <span class="m2-detSec-down">展开<i></i></span>
		        </div>
		    </div>
		
		    <div class="m2-detImgbox m2-detSection">
		        <h3>
		            项目资料            <i></i></h3>
		        <div class="m2-detImglist m2-det-togBox  img-view1">
		            <ul>
		            </ul>
		        </div>
		        <div class="m2-detSec-toggle">
		            <span class="m2-detSec-down">展开<i></i></span>
		        </div>
		    </div>
		
		    <div class="m2-detSit m2-detSection">
		        <h3>                资金用途<i></i></h3>
		        <div class="m2-detSitbox m2-det-togBox">
		            <p style='font-size: 14px;line-height: 26px;'> </p>
		        </div>
		        <div class="m2-detSec-toggle">
		            <span class="m2-detSec-down">展开<i></i></span>
		        </div>
		    </div>
		
		    <div class="m2-detSit m2-detSection">
		        <h3>爱钱帮独立意见<i></i></h3>
		        <div class="m2-detSitbox m2-det-togBox">
		            <p style='font-size: 14px;line-height: 26px;'>押车押手续的质押方式，属于车贷业务中常见的安全级别较高的风控手段，对于车辆控制的力度较高。借款人的借款周期较短，对于车辆的价格波动影响较小，且爱钱帮设置的质押率控制在85%以内，进一步增加了借款人的综合违约成本。
		
		                综上，爱车贷项目的风险性相对可控。</p>
		        </div>
		        <div class="m2-detSec-toggle">
		            <span class="m2-detSec-down">展开<i></i></span>
		        </div>
		    </div>
		
		    <div class="m2-detImgbox m2-detSection">
		        <h3>
		            车辆照片            <i></i>
		        </h3>
		        <div class="m2-detImglist m2-det-togBox  img-view2">
		            <ul>
		                <li>
		                    <img src="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021324588831.jpg" alt="左前" data-fullpic="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021324588831.jpg">
		                    <p>左前</p>
		                </li><li>
		                <img src="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021325192931.jpg" alt="右后" data-fullpic="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021325192931.jpg">
		                <p>右后</p>
		            </li><li>
		                <img src="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021325049439.jpg" alt="公里数" data-fullpic="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021325049439.jpg">
		                <p>公里数</p>
		            </li><li>
		                <img src="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021324505212.jpg" alt="中控" data-fullpic="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021324505212.jpg">
		                <p>中控</p>
		            </li><li>
		                <img src="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021325134212.jpg" alt="前排" data-fullpic="/Finances/statics/front/uploadData/UserBorrowData/182015-201609021325134212.jpg">
		                <p>前排</p>
		            </li><li>
		                <img src="/Finances/statics/front/uploadData/UserBorrowData/182015-20160902132509102.jpg" alt="后排" data-fullpic="/Finances/statics/front/uploadData/UserBorrowData/182015-20160902132509102.jpg">
		                <p>后排</p>
		            </li>            </ul>
		        </div>
		        <div class="m2-detSec-toggle">
		            <span class="m2-detSec-down">展开<i></i></span>
		        </div>
		    </div>
		
		    <div class="m2-detSit m2-detSection">
		        <h3>担保机构意见<i></i></h3>
		        <div class="m2-detSitbox m2-det-togBox">
		            <p style='font-size: 14px;line-height: 26px;'></p>
		        </div>
		        <div class="m2-detSec-toggle">
		            <span class="m2-detSec-down">展开<i></i></span>
		        </div>
		    </div>
		
		    <div class="m2-detSit m2-detSection">
		        <h3>风控措施<i></i></h3>
		        <div class="m2-detSitbox m2-det-togBox">
		            <p style='font-size: 14px;line-height: 26px;'>1.车辆经过验车后，已质押入库，详情可参考照片。
		                2.车辆证件手续已落实质押：
		                车主身份证：已核实并留存复印件
		                机动车行驶证：原件已提交质押
		
		                车钥匙：钥匙已提交质押
		
		                综上，已办理押车押手续的质押手续，借款人已签署《逾期买卖委托书》和《车辆买卖协议》，当借款人出现未能按时还款的情形，平台公司和线下合作公司可自行或委托第三方直接处理该车辆。
		                爱钱帮为爱车贷项目设置了10%的风险保证金。</p>
		        </div>
		        <div class="m2-detSec-toggle">
		            <span class="m2-detSec-down">展开<i></i></span>
		        </div>
		    </div>
		    <!-- 车辆手续start -->
		    <div class="m2-detCarfile m2-detSection"   >
		        <h3>车辆手续<i></i></h3>
		        <ul class="m2-detCarfile-ul">
		            <li class="m2-detCarfile1">
		                <i class="m2-detCar-tur"></i>
		            </li>
		            <li class="m2-detCarfile2">
		                <i class="m2-detCar-tur"></i>
		            </li>
		            <li class="m2-detCarfile3">
		                <i class="m2-detCar-tur"></i>
		            </li>
		            <li class="m2-detCarfile4">
		                <i class="m2-detCar-fal"></i>                </li>
		            <li class="m2-detCarfile5">
		                <i class="m2-detCar-tur"></i>
		            </li>
		            <li class="m2-detCarfile6">
		                <i class="m2-detCar-fal"></i>                </li>
		            <li class="m2-detCarfile7">
		                <i class="m2-detCar-fal"></i>                </li>
		            <li class="m2-detCarfile8">
		                <i class="m2-detCar-fal"></i>                </li>
		            <li class="m2-detCarfile9">
		                <i class="m2-detCar-fal"></i>                </li>
		        </ul>
		    </div>    <div class="m2-detRecbox m2-detSection" style="margin-bottom: 100px;">
		    <h3>投资理财记录<i></i></h3>
		    <div class="m2-detReclist">
		        <ul id='investlogul'>
		            <li class="m2-detRechead">
		                <span class="m2-detReccon-user">用户名</span>
		                <span class="m2-detReccon-tel">手机号</span>
		                <span class="m2-detReccon-sum">投资金额</span>
		                <span class="m2-detReccon-tim">投资时间</span>
		            </li>
		            <li class="m2-detRecitem">
		                <span style='width: 90%;'>暂无数据</span>
		            </li>
		        </ul>
		    </div>
		    <div class="m2-newListpage-con">
		        <div class="m2-newListpage">
		            <div class="m2-news-pages" style="padding-right:40px;margin:12px auto;"></div>
		        </div>
		    </div>
		
		    <form action="/cupdata-invest-invest" style="display: none;" id="invest_form">
		        <input name="T_borrow_id" id="form_borrow_id" value='moxOeTwTZaOw8TY79g'>
		        <input name="transfer_invest_num" id="form_invest_num">
		        <input name="reward_use" id="form_reward_money">
		        <input name="enableRobBidding" id="form_enableRobBidding" value="0">
		        <input name="reward_id" id="form_reward_id">
		        <input type="hidden" name="__hash__" value="35764fa33449727c3a110ca0a7297eea_e88eca763bffd24b1f72966e02b21810" /></form>
		
		    <form action="/cupdata-capital-chargeAndInvest" style="display: none;" id="charge_invest_form">
		        <input name="amount" id="charge_amount">
		        <input name="borrow_id" id="charge_borrow_id" value='moxOeTwTZaOw8TY79g'>
		        <input name="invest_num" id="charge_invest_num">
		        <input name="reward_use" id="charge_reward_money">
		        <input name="reward_id" id="charge_reward_id">
		        <input type="hidden" name="__hash__" value="35764fa33449727c3a110ca0a7297eea_e88eca763bffd24b1f72966e02b21810" /></form>
		
		    <script>
		        //投资记录分页
		        var borrowid = 'moxOeTwTZaOw8TY79g';
		        var page = 0;  			//当前页
		        var totalpage = 0;  	//总页数
				//注释分页
		        //pageclick(borrowid, 1);
		
		        function pager() {
		
		            var n1 = 3;								//前后保留n1项，均分剩余页码，保留最前最后页
		            var n2 = 3;								//当前页两旁保留n2项
		            page = Number(page);
		            totalpage = Number(totalpage);
		            var pages = '<a onclick="pageclick(\'' + borrowid + '\',' + (page - 1 > 0 ? page - 1 : 1) + ')" class="m2-pages-num m2-page-prev">&lt;</a>';
		
		            if (totalpage <= 1 || page > totalpage) {
		                $('.m2-news-pages').hide();
		            } else {
		                $('.m2-news-pages').show();
		
		                if (page <= n1 + n2 + 1) {
		                    for (var i = 1; i < page; i++) {
		                        pages += addonepage(i, false);
		                    }
		                } else {
		                    for (var i = 0; i < n1; i++) {
		                        var a = 1 + Math.floor((page - n2 - 1) * i / n1);
		                        pages += addonepage(a, false);
		                    }
		                    for (var i = page - n2; i < page; i++) {
		                        pages += addonepage(i, false);
		                    }
		                }
		                pages += addonepage(page, true);
		
		                if (totalpage - page <= n1 + n2) {
		                    for (var i = page + 1; i <= totalpage; i++) {
		                        pages += addonepage(i, false);
		                    }
		                } else {
		                    for (var i = page + 1; i <= page + n2; i++) {
		                        pages += addonepage(i, false);
		                    }
		                    for (var i = 1; i <= n1; i++) {
		                        var b = page + n2 + Math.ceil((totalpage - page - n2) * i / n1);
		                        pages += addonepage(b, false);
		                    }
		                }
		                pages += '<a onclick="pageclick(\'' + borrowid + '\',' + (page + 1 > totalpage ? totalpage : page + 1) + ')" class="m2-pages-num m2-page-next">&gt;</a>';
		                $('.m2-news-pages').html(pages);
		            }
		        }
		
		        function addonepage(index, iscurrent) {
		            var pageclass = 'm2-page-unsel';
		            if (iscurrent) {
		                pageclass = 'm2-page-sel';
		            }
		            return '<a onclick="pageclick(\'' + borrowid + '\',' + index + ')" class="m2-pages-num ' + pageclass + '">' + index + '</a>';
		        }
		
		        function pageclick(bid, index) {
		            $.ajax({
		                url: 'home-invest-investlogajax',
		                type: 'GET',
		                data: {
		                    id: bid,
		                    page: index
		                },
		                success: function (data) {
		                    var obj = eval('(' + data + ')');
		                    page = obj['page'];
		                    totalpage = obj['totalpage'];
		                    pager();
		                    if (!(!obj['list'] && index == 1)) {
		                        $('.m2-detRecitem').remove();
		                    }
		                    for (var i in obj['list']) {
		                        var li = '<li class="m2-detRecitem">';
		                        li += '<span class="m2-detReccon-user">' + obj['list'][i]['user_name'] + '</span>';
		                        li += '<span class="m2-detReccon-tel">' + obj['list'][i]['user_phone'] + '</span>';
		                        li += '<span class="m2-detReccon-sum" style="color:#f5944f;">' + obj['list'][i]['investor_capital'] + '元</span>';
		                        li += '<span class="m2-detReccon-tim">' + obj['list'][i]['invest_time'] + '</span></li>';
		                        $('#investlogul').append(li);
		                    }
		                }
		            });
		        }
		    </script>
		</div>
		</div>
		<script type="text/javascript">
		    $(function () {
		        $('.m2-detAsklist ul li:even').css('margin-right', 24);
		        //各种介绍展开按钮
		        $('.m2-detSec-toggle span').click(function () {
		            if ($(this).hasClass('m2-detSec-down')) {
		                $(this).addClass('m2-detSec-up').removeClass('m2-detSec-down');
		                $(this).parent().siblings('.m2-det-togBox').css('max-height', 2000);
		                $(this).html('收起<i></i>');
		            } else {
		                $(this).addClass('m2-detSec-down').removeClass('m2-detSec-up');
		                $(this).parent().siblings('.m2-det-togBox').css('max-height', 158);
		                $(this).html('展开<i></i>');
		            }
		        });
		    });
		    $('.m2-det-togBox').each(function () {
		        if ($(this).height() < 158) {
		            $(this).siblings('.m2-detSec-toggle').find('span').hide();
		        }
		    });
		    $('.m2-detImglist').each(function () {
		        if ($(this).find('li').size() < 6) {
		            $(this).siblings('.m2-detSec-toggle').find('span').hide();
		        }
		    });
		</script>
		
		<!-- 图片列表弹出和上下页 -->
		<script src="/Finances/statics/front/js/productimage.js"></script>
		
		<!-- 红包弹窗相关 -->
		<script src="/Finances/statics/front/js/productenvelope.js"></script>
		
		<!-- 剩余时间相关 -->
		<script src="/Finances/statics/front/js/producttimes.js"></script>
		
		<!------------------------------------------------------------------------------------------------------------------>
		
		<!-- 奖励金，邀请码 ，红包相关-->
		<script src="/Finances/statics/front/js/productreward.js"></script>
		
		<!-- 托管，卡，开户相关 -->
		<script src="/Finances/statics/front/js/producthosted.js"></script>
	
		 <!-- 实现右侧登入注册功能 -->
		<script src="/Finances/statics/front/js/sidebarlogreg.js"></script>
	
	
		
	
		<!-- 足部start -->
			<jsp:include page="include/floot.jsp"></jsp:include>
		<!-- 足部end -->	
		
			<script type="text/javascript">
		    $("#msgbtn2_alert").hover(function(){
		        $("#msgbtn2_alert_content").show();
		    },function(){
		        $("#msgbtn2_alert_content").hide();
		    });
		    //收益计算器弹出层事件
		    $(function () {
		        //隐藏更多按钮
		        if ($('.m2-tranHide-det').size() < 19) {
		            $('.m2-tranHidetoggle').hide();
		        }
		        //点击按钮弹出
		        $('#interestcal').click(function () {
		            $('.m2-tranBg').show();
		            $('.m2-tranHide').show();
		            $('.m2-tranHide').css('top', $(document).scrollTop() + 110);
		        });
		
		        //点击关闭按钮
		        $('.m2-tranHide-close').click(function () {
		            $('.m2-tranBg').hide();
		            $('.m2-tranHide').hide();
		        });
		
		        //展开收起
		        $('.m2-tranHidetoggle').click(function () {
		            if ($(this).hasClass('m2-tranMore')) {
		                $(this).removeClass('m2-tranMore');
		                $(this).children('span').html('收&nbsp;&nbsp;&nbsp;起&raquo;');
		                $('.m2-tranHidelist').css('max-height', 9999);
		            } else {
		                $(this).addClass('m2-tranMore');
		                $(this).children('span').html('显示更多&raquo;');
		                $('.m2-tranHidelist').css('max-height', 240);
		            }
		        });
		    })
	</script>
		
		
	</body>
</html>