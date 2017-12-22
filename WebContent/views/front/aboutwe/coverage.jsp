<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		    <meta name="keywords" content="理财网站,理财平台,网上理财,投资理财平台,投资理财,理财产品">
		    <meta name="description" content="爱钱帮的理财媒体报道栏目，为您提供权威媒体从理财网站、理财平台、网上理财三个方面报道爱钱帮投资理财机构的资讯，让您对爱钱帮投资理财平台有更深的认识。">
		    <title>媒体报道丨亿信金融</title>
			<!--[if lt IE 9]>
		    	<script src="<%=path%>/statics/front/statics/newcommon/js/html5shiv.js"></script>
		    <![endif]-->
		    <link  rel="Shortcut  Icon"  href="/Finances/statics/other/lco/smalllog.png">
		    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-commonNew.css">
		    <link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/m2-main.css">
		    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-common.css">
		    <script type="text/javascript" src="/Finances/statics/front/statics/home/js/jquery.min.js"></script>
		    <script type="text/javascript" src="/Finances/statics/front/statics/newcommon/js/common.js"></script>
	</head>
	<body>
			<!-- 右侧边栏start -->
		    <!-- 右侧登录窗口 -->
		
		    <!--右侧登录框-->
		    <div class="mo2-indexLoginbox" id="right-fix">
		        <!-- 登录注册start -->
		        <div class="mo2-indLogreg" >				<div class="mo2-indLogtab">
		            <ul>
		                <li class="mo2-logTab-unsel mo2-indTab-reg">
		                    <span>注册</span><b></b>
		                </li>
		                <li class="mo2-logTab-sel mo2-indTab-log">
		                    <span>登录</span><b></b>
		                </li>
		            </ul>
		        </div>
		            <!-- 注册start -->
		            <div class="mo2-indRegboxRight" style="display:none;">
		                <div class="mo2-indLogitem" style="margin-bottom:6px;">
		                    <i class="mo2-indLogicon-tel"></i><input class="mo2-indIpt-all" id="regTelRight" maxlength="11" type="text" placeholder="输入手机号码"><b class="mo2-indLogwarRight"><em class="mo2-indlogWar-arr"></em><u></u></b>
		                </div>
		                <div class="mo2-indLogitem" style="margin-bottom:6px;">
		                    <i class="mo2-indLogicon-psw"></i><input class="mo2-indIpt-all m2-ind-banPsw" id="passRight" type="password" placeholder="6-20位数字与字母组合的密码"><b class="mo2-indLogwarRight"><em class="mo2-indlogWar-arr"></em><u></u></b>
		                </div>
		                <div class="mo2-indLogitem-step1">
		                    <div class="mo2-indLogreg-step1">
		                        <i class="mo2-indLogicon-code"></i><input class="mo2-indIptcod-step1" id="vcodeRight" type="text" placeholder="验证码">
		                    </div>
		                    <img class="mo2-indRegcode" src="/Finances/statics/front/statics/home2/images/home-register-VerifyCode.png" onClick="document.getElementById('reverifyCodeRight').src='home-register-VerifyCode.png?time='+Math.random();void(0);" id="reverifyCodeRight"  alt="点击刷新验证码">
		                    <span class="mo2-indReg-refresh">看不清？换一张</span>
		                    <b class="mo2-indLogwarRight"><em class="mo2-indlogWar-arr"></em><u></u></b>
		                </div>
		                <div class="mo2-indReg-btn" id="verifyregcode" onclick="verifycodeRight();" style="margin-top:8px;">
		                    <a class="mo2-indRegbtn-able" href="#">立即注册</a>
		                </div>
		                <div class="mo2-indRegagree">
		                    <i class="mo2-indReg-sel"></i><span>我已阅读并同意</span><b>《爱钱帮注册服务协议》</b>
		                </div>
		            </div>
		            <!-- 注册end -->
		            <!-- 注册step2 start -->
		            <div class="mo2-indRegbox2Right"  style="display:none;" >
		                <div class="mo2-indReg2-con">
		                    <ul>
		                        <li><i class="mo2-indRegicon-step1"></i><span>为了确保您手机可用，请填写您收到的手机动态码。</span></li>
		                        <li><i class="mo2-indRegicon-step2"></i><span>如收不到短信验证码，可点击下面的获取语音验证码。</span></li>
		                    </ul>
		                </div>
		                <div class="mo2-indLogitem">
		                    <i class="mo2-indLogicon-code"></i><input class="mo2-indIpt-half" id="codeRight" type="text" placeholder="验证码">
		                    <span class="mo2-indRegtim mo2-regTin-able"><u>60秒后</u><span>获取手机验证码</span></span>
		                    <b class="mo2-indLogwarRight" style="width:200px;"><em class="mo2-indlogWar-arr"></em><u>错误提示信息</u></b>
		                </div>
		                <div class="mo2-indRegvoice">
		                    <span class="mo2-indRegvoi-btn mo2-indRegvoi-able"><i></i>获取语音验证码</span>
		                </div>
		                <div class="mo2-indReg-btn" onclick="registerRight();" id="verifyregphone"  style="margin-top:8px;">
		                    <a class="mo2-indRegbtn-able"  href="#">立即注册</a>
		                </div>
		            </div>
		            <!-- 注册step2 end -->
		
		            <!-- 登录start -->
		            <div class="mo2-indLogboxRight">
		                <div class="mo2-indLogitem mo2-indLogitem-use" style="margin-bottom:9px;">
		                    <i class="mo2-indLogicon-use"></i><input class="mo2-indIpt-all" type="text" id="user_nameRight" placeholder="用户名/手机号">
		                    <b class="mo2-indLogwar" id="w_username"><em class="mo2-indlogWar-arr"></em><u id="r_usernameRight"></u></b>
		                </div>
		                <div class="mo2-indLogitem mo2-indLogitem-psw" style="margin-bottom:9px;">
		                    <i class="mo2-indLogicon-psw"></i><input class="mo2-indIpt-all m2-ind-banPsw" maxlength="20" id="pass_wordRight" type="password" id="pass_wordRight" placeholder="输入登录密码">
		                    <b class="mo2-indLogwar" id="w_password"><em class="mo2-indlogWar-arr"></em><u id="r_passwordRight"></u></b>
		                </div>
		                <div class="mo2-indLog-code" style="display:none;margin-bottom:8px;">
		                    <div class="mo2-indLogcod-lef">
		                        <i class="mo2-indLogicon-psw"></i>
		                        <input type="text" id="vcodeRight" placeholder="验证码"></div>
		                    <div class="mo2-indLogcod-rig"><img src="/Finances/statics/front/statics/home2/images/home-register-VerifyCode.png" onClick="document.getElementById('reverifyCode').src='home-register-VerifyCode.png?time='+Math.random();void(0);" alt="点击刷新验证码"></div>
		                </div>
		                <div class="mo2-indLog-forget"><a href="forget.html">忘记密码?</a></div>
		                <div style="padding-left: 24px;line-height: 30px;color:red;" id="error-hint"></div>
		                <div class="mo2-indReg-btn">
		                    <a class="mo2-indRegbtn-able" onclick="loginRight();">登录</a>
		                </div>
		            </div>
		            <!-- 登录end -->
		        </div>
		        <!-- 登录注册end -->
		    </div>
		    <!-- 右侧登录窗口 -->
		    <!--add by zml start-->
		    <!--<div id="fixbar" style="width:50px;position:fixed;top:0;right:0px;background:#ff6666;z-index:5;"></div>-->
		
		    <!--右侧悬浮条-->
		    <div id="fixbar">
		        <!-- 右侧边栏顶部 -->
		        <!--右侧上边栏start -->
		        <div class="m2-commonRight2"  id="m2-commonRight">
		            <ul class="m2-comRiglist myclick">
		                <li class="m2-comRigli m2-comRigli-ewm m2-comRigli_new" style="border-top:1px solid #fff;" data="#fixnavbar_one">
		                    <div></div>
		                    <img src="/Finances/statics/front/statics/home2/images/fixed-r1.png" alt="我的账户">
		                    <div class="toAbs">
		                        <div><img src="/Finances/statics/front/statics/home2/images/fixedl-1_v2.png" alt="我的账户"></div>
		                        <div></div>
		                    </div>
		                </li>
		                <li class="m2-comRigli m2-comRigli-tel m2-comRigli_new" data="#fixnavbar_two">
		                    <img src="/Finances/statics/front/statics/home2/images/fixed-r2.png" alt="我的红包">
		                    <div></div>            	<div class="toAbs">
		                    <div><img src="/Finances/statics/front/statics/home2/images/fixedl-2_v2.png" alt="我的红包"></div>
		                    <div></div>
		                </div>
		                </li>
		                <li class="m2-comRigli m2-comRigli-qq m2-comRigli_new" data="#fixnavbar_three">
		                    <img src="/Finances/statics/front/statics/home2/images/fixed-r3.png" alt="我的加息券">
		                    <div></div>            	<div class="toAbs">
		                    <div><img src="/Finances/statics/front/statics/home2/images/fixedl-3_v2.png" alt="我的加息券"></div>
		                    <div></div>
		                </div>
		                </li>
		                <li class="m2-comRigli m2-comRigli-sug m2-comRigli_new" data="#fixnavbar_four">
		                    <img src="/Finances/statics/front/statics/home2/images/fixed-r4.png" alt="站内信息">
		                    <div></div>            	<div class="toAbs">
		                    <div><img src="/Finances/statics/front/statics/home2/images/fixedl-4_v2.png" alt="站内信息"></div>
		                    <div></div>
		                </div>
		                </li>
		            </ul>
		        </div>
		        <!-- 右边侧栏顶部右边弹出 -->
		        <div class="fixbox_bar">
		            <div class="fixnavbar" id="fixnavbar_one">
		                <div class="sumtop">
		                    <div class="top" style="margin: 18px;text-align: center;font-size: 20px;position: relative;"><span style="position: absolute;top: 0;left:-18px">>></span>我的账户</div>
		                    <div class="bottom">
		                        <img src="/Finances/statics/front/statics/home2/images/user-head.png" alt="我的账户">
		                        <div>
		                            <p id ="right_name_info"></p>
		                            <button id="right_recharge">充值</button>
		                        </div>
		                    </div>
		                </div>
		                <hr style="margin:0 10px;"/>
		                <div class="summiddle">
		                    <ul>
		                        <li style="border-top-left-radius:10px;">
		                            <p><span id="right_account_money"></span>元</p>
		                            <span>可用资金</span>
		                        </li>
		                        <li style="border-top-right-radius:10px;">
		                            <p><span id="right_reward_money"></span>元</p>
		                            <span>可用奖励金</span>
		                        </li>
		                    </ul>
		                    <div class="content">
		                        <p>待收本金：<span id="right_total_capital"></span>元</p>
		                        <p>待收收益：<span id="right_total_wait_interest"></span>元</p>
		                    </div>
		                    <p class="lastcontent">资产总计：<span id="right_total_asset"></span>元</p>
		                    <ul style="margin-top:30px;">
		                        <li style="border-top-left-radius:10px;border-bottom-left-radius:10px;">
		                            <p><span id="right_today_earn"></span>元</p>
		                            <span>今日赚取</span>
		                        </li>
		                        <li style="border-top-right-radius:10px;border-bottom-right-radius:10px;">
		                            <p><span id="right_total_reward_normal_interest"></span>元</p>
		                            <span>累计收益</span>
		                        </li>
		                    </ul>
		                </div>
		                <div class="sumbottom" id ="accountCommon_right">查看更多>></div>
		            </div>
		
		            <div class="fixnavbar common" id="fixnavbar_two">
		
		            </div>
		
		            <div class="fixnavbar common" id="fixnavbar_three">
		
		            </div>
		
		            <div class="fixnavbar" id="fixnavbar_four">
		
		            </div>
		        </div>
		
		        <!-- 右侧边栏底部 -->
		        <div class="m2-commonRight">
		            <ul class="m2-comRiglist">
		                <li class="m2-comRigli m2-comRigli-ewm"  style="border-top:1px solid #fff;">
		                    <i class="m2-comRigli-icon"></i>
		                    <span class="m2-comRigli-hov">关注<br>微信</span>
		                    <div class="m2-comRighide m2-comRighide-ewm"><i></i></div>
		                </li>
		                <li class="m2-comRigli m2-comRigli-tel">
		                    <i class="m2-comRigli-icon"></i>
		                    <span class="m2-comRigli-hov">联系<br>我们</span>
		                    <div class="m2-comRighide m2-comRighide-tel">
		                        <div class="m2-comRighide-telSpace"></div>
		                        <b class="m2-comRighide-telBorder"></b>
		                        <div class="m2-comRigtel-lef">
		                            <div class="m2-comRigtel-lefTop">
		                                <input type="text" placeholder="请输入您的手机号"  id='phonenumber'>
		                            </div>
		                            <div class="m2-comRigtel-lefBot">
		                                <input type="text" placeholder="验证码" id="ivrSecurityCode">
		                                <img id="ivrSecurityCodeImg" onclick="getCode()" src="https://bj-out-2.ccic2.com/system!getLoginCodeForWebCall.action" alt="验证码" title="点击更新验证码">
		                            </div>
		                        </div>
		                        <div class="m2-comRigtel-rig">
		                            <span  onclick='callback()'>免费<br>拨打</span>
		                        </div>
		                    </div>
		                </li>
		                <li class="m2-comRigli m2-comRigli-qq" style="position:relative;">
		
		                    <div id="BizQQWPA" style="width:50px;height:50px;position:absolute;top:0;left:0;z-index:150;">
		
		                    </div>	                <i class="m2-comRigli-icon" style="z-index:100;"></i>
		                    <span class="m2-comRigli-hov" style="z-index:100;">在线<br>客服</span>
		                </li>
		                <li class="m2-comRigli m2-comRigli-sug" style="border-bottom: 1px solid #fff;">
		                    <i class="m2-comRigli-icon"></i>
		                    <span class="m2-comRigli-hov"><a href="guide.html" style="color:#fff;">帮助<br>中心</a></span>
		                </li>
		
		                <li class="m2-comRigli m2-comRigli-top">
		                    <i class="m2-comRigli-icon"></i>
		                    <span class="m2-comRigli-hov">返回<br>顶部</span>
		                </li>
		            </ul>
		        </div>
		    </div>
		    <script type="text/javascript">
	        $(function(){
	            $('#right_recharge').click(function(){
	                window.location.href="#";
	            });
	
	            $(".fixbox_bar").click(function(event){
	                event.stopPropagation();
	            });
	            $('#accountCommon_right').click(function(){
	                window.location.href="usercenter.html";
	            });
	//			$('#redbagCommon_right').click(function(){
	//				window.location.href="usercenter-rewardcontrol-redpacket.html";
	//			});
	//			$('#percentageCommon_right').click(function(){
	//				window.location.href="usercenter-rewardcontrol-interestcoupon.html";
	//			});
	//			$('#messageCommon_right').click(function(){
	//				window.location.href="usercenter-messagecontrol-sitemsg.html";
	//			});
	        })
	
	
	    </script>
	    <!--首页右侧提示悬浮窗、账户、红包、加息券 user_m_type -->
	    <script type="text/javascript">
	        $(".m2-comRigli").click(function(event){
	            $('#right-fix').animate({ right: '50px'}, "slow");
	            event.stopPropagation();
	        });
	        $("#right-fix").click(function(event){
	            event.stopPropagation();
	        });
	        $("body").click(function(){
	            $('#right-fix').animate({ right: '-290px'}, "slow");
	        });
	    </script>
	    <script>
	        //注册方法
	        function verifycodeRight(){
	            var canSubmit=true;
	            $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").children("u").html('');
	            if($("#vcodeRight").val().length==0){
	                $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").children("u").html("验证码不能为空");
	                $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").show();
	                canSubmit = false;
	            }
	            if($("#passRight").val().length==0){
	                $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").children("u").html("密码不能为空");
	                $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").show();
	                canSubmit = false;
	            }
	            if($("#regTelRight").val().length==0){
	                $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").children("u").html("手机号不能为空");
	                $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").show();
	                canSubmit = false;
	            }
	
	            $(".mo2-indRegbox .mo2-indLogwarRight u").each(function(){
	                if($(this).html().length>0){
	                    canSubmit = false;
	                }
	            });
	            if (canSubmit !== true) return false;
	            var p={"vcode":$("#vcodeRight").val()};
	            postData("/Home-Register-ckcode",p,function(d){
	                if(d.message!=" "){
	                    $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").children("u").html(d.message);
	                    $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").show();
	                    return false;
	                }else{
	                    $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").children("u").html('');
	                    $("#reverifyCodeRight").siblings(".mo2-indLogwarRight").hide();
	                    $('.mo2-indRegboxRight').css('display','none');
	                    $('.mo2-indRegbox2Right').css('display','block');
	                }
	
	            });
	        }
	        //登录方法
	        function loginRight(){
	            var p = makevar(['user_nameRight','pass_wordRight','vcodeRight']);
	            var canSubmit = true;
	            if($('#user_nameRight').val()==""){
	                $('#error-hint').html('用户名不能为空！');
	            }else if($('#user_nameRight').val().lenght <6){
	                $('#error-hint').html('用户名长度错误！');
	            }else {
	                if ($('#pass_wordRight').val() == ""){
	                    $('#error-hint').html('密码不能为空！');
	                }else if ($('#pass_wordRight').val().length < 6 || $('#pass_wordRight').val().length > 20){
	                    $('#error-hint').html('密码长度错误！');
	                }else {
	                    $('#error-hint').html('');
	                    postData("/Home-Login-index_loginRight",p,function(d){
	                        if(d.status==0){
	                            $('#error-hint').html(d.message);
	                        }else if(d.status==1){
	                            window.location.reload();
	                        }else if(d.status==2){
	                            window.location.href = "dashiji_show.html#15319.html";
	                        }
	                    });
	                }
	            }
	        }
	        $(document).keydown(function(event){
	            var e = event || window.event || arguments.callee.caller.arguments[0];
	            if(e && e.keyCode==13){
	                loginRight();
	            }
	        });
	
	        // 注册登录tab切换
	        $('.mo2-indLogtab ul li').click(function(){
	            if ($(this).hasClass('mo2-logTab-unsel')) {
	                $(this).addClass('mo2-logTab-sel').removeClass('mo2-logTab-unsel');
	                $(this).siblings('.mo2-logTab-sel').addClass('mo2-logTab-unsel').removeClass('mo2-logTab-sel');
	            }
	        });
	        // 注册登录显示隐藏
	        $('.mo2-indTab-reg').click(function(){
	            $('.mo2-indRegboxRight').show();
	            $('.mo2-indRegbox2Right').hide();
	            $('.mo2-indLogboxRight').hide();
	        });
	        $('.mo2-indTab-log').click(function(){
	            $('.mo2-indRegboxRight').hide();
	            $('.mo2-indRegbox2Right').hide();
	            $('.mo2-indLogboxRight').show();
	        });
	
	        //右侧悬浮框
	        var aLi=$('.m2-comRigli_new');
	        for(var i=0;i<aLi.length;i++){
	            (function(index){
	                aLi[index].onmouseover=function(){
	                    var oDiv=aLi[index].children[2];
	                    var aDiv=oDiv.children;
	                    oDiv.style.display='block';
	                    //if(flag==1){
	                    var iNum=parseInt(aDiv[1].innerHTML);
	                    if(iNum>=100){
	                        aDiv[1].innerHTML='···';
	                    }
	                    //}
	                };
	            })(i)
	        }
	        for(var i=0;i<aLi.length;i++){
	            (function(index){
	                aLi[index].onmouseout=function(){
	                    var oDiv=aLi[index].children[2];
	                    var aDiv=oDiv.children;
	                    oDiv.style.display='none';
	                    //if(flag==1){
	                    var iNum=parseInt(aDiv[1].innerHTML);
	                    if(iNum>=100){
	                        aDiv[1].innerHTML='···';
	                    }
	                    //}
	                };
	            })(i)
	        }
	    </script>
	    <script type="text/javascript">
	        $(function () {
	            var wHei = $(window).height();
	
	            $(document).scroll(function () {
	                // 判断返回顶部是否显示
	                visTop(wHei);
	            });
	
	            $('.m2-comRigli-top').click(function () {
	                $('body,html').animate({scrollTop: 0}, 600);
	                return false;
	            });
	        });
	
	        function visTop(high) {
	
	            if ($(document).scrollTop() > high + 100) {
	                $('.m2-comRigli-top').css('visibility', 'visible');
	            } else {
	                $('.m2-comRigli-top').css('visibility', 'hidden');
	            }
	        }
	    </script>
	    <!-- 右侧边栏end -->
	    
	    <!-- 头部start -->
	    	<jsp:include page="../include/head.jsp"></jsp:include>
	    <!-- 头部end -->
	    
	    <link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/front.css">
    	<script type="text/javascript" src="/Finances/statics/front/statics/home2/js/m2-front.js"></script>
    	
    	<!-- 导航start -->
    		<jsp:include page="../include/navigation.jsp"></jsp:include>
    	<!-- 导航end -->
    	
    	<link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/m2-main.css">
    	
    	<!-- 内容start -->
    	<div class="m2-report-con">
		        <div class="m2-reportVod-box">
		            <h2><i></i>央媒报道</h2>
		            <div class="m2-reportVod-main">
		                <div class="m2-reportVod-lef">
		                    <img class="m2-reportVod-big" src="/Finances/statics/front/statics/home2/images/report/vedio1.jpg" alt="中国P2P网贷特点与风险控制">
		                    <i></i>
		                    <div class="m2-reportVod-lefBg">
		                        <p>中国P2P网贷特点与风险控制</p>
		                    </div>
		                </div>
		                <div class="m2-reportVod-rig">
		                    <span class="m2-repVodlist-btnUp" style="display:none;"></span>
		                    <span class="m2-repVodlist-btnDown" style="display:none;"></span>
		                    <div class="m2-reportVod-rigCon">
		                        <ul class="m2-repVodlist">
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio1.jpg" alt="中国P2P网贷特点与风险控制">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>中国P2P网贷特点与风险控制</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio2.jpg" alt="中国P2P网贷监管与投资人利益保护">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>P2P网贷监管与投资人利益保护“</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio3.jpg" alt="爱钱帮访谈之P2P">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>爱钱帮访谈之P2P</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio4.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>爱钱帮访谈之如何选择P2P平台</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio5.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>CCTV2特别报道爱钱帮</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio6.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>金融行业的新革命 P2P网贷</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio7.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>cctv2特别报道爱钱帮</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio8.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>如何成为专业网贷投资人</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio9.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>P2P网贷 经济转型下的投资新契机</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio10.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>金融革命的萌芽</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio11.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>几招搞定P2P网贷投资</p>
		                                </div>
		                            </li>
		                            <li>
		                                <div class="m2-repVodlist-main">
		                                    <div class="m2-repVodlist-bg"><span></span></div>
		                                    <img src="/Finances/statics/front/statics/home2/images/report/vedio12.jpg" alt="">
		                                </div>
		                                <div class="m2-repVodlist-det">
		                                    <p>舌尖上的金融</p>
		                                </div>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="m2-reportNews-box">
		            <h2><i></i>新闻聚焦</h2>
		            <ul class="m2-reportNews-list">
		                <li>
		
		                    <div class="m2-reportNews-listMain">
		                        <img class="m2-reportLogo" src="/Finances/statics/front/uploadData/ad/20151229133918775.png" alt="没有信息共享机制，网贷凭什么限额？">					<a href="dashiji_show.html#16027.html" target="_blank" title="没有信息共享机制，网贷凭什么限额？">
		                        <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >没有信息共享机制，网贷凭什么限额？</h3></a>
		                        <a href="dashiji_show.html#16027.html" target="_blank" title="没有信息共享机制，网贷凭什么限额？">
		                            <p class="m2-reportNews-listNor">
		                                今天下午，银监会、工信部、公安部、网信办四部委联合发布《网络借贷信息中介机构业务活动管理暂行办法》。此前备受市场关注的借款设上限在发布会上被…</p></a>
		                        <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16027.html" target="_blank" title="没有信息共享机制，网贷凭什么限额？">显示全部</a></p>
		                    </div>
		                    <div class="m2-reportNews-listTime">
		                        <p><i></i>2016年09月02日</p>
		                    </div>
		                </li><li>
		
		                <div class="m2-reportNews-listMain">
		                    <img class="m2-reportLogo" src="/Finances/statics/front/uploadData/ad/20151130140815865.png" alt="网贷管理办法明确13项禁止性行为">					<a href="dashiji_show.html#16026.html" target="_blank" title="网贷管理办法明确13项禁止性行为">
		                    <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >网贷管理办法明确13项禁止性行为</h3></a>
		                    <a href="dashiji_show.html#16026.html" target="_blank" title="网贷管理办法明确13项禁止性行为">
		                        <p class="m2-reportNews-listNor">
		                            �24日，银监会会同工信部、公安部、国家互联网信息办公室等部门研究起草的《网络借贷信息中介机构业务活动管理暂行办法》（简称《办法》）发布。《…</p></a>
		                    <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16026.html" target="_blank" title="网贷管理办法明确13项禁止性行为">显示全部</a></p>
		                </div>
		                <div class="m2-reportNews-listTime">
		                    <p><i></i>2016年09月02日</p>
		                </div>
		            </li><li>
		
		                <div class="m2-reportNews-listMain">
		                    <img class="m2-reportLogo" src="/Finances/statics/front/uploadData/ad/20151209171757478.png" alt="网贷监管终落地  平台将现转型潮">					<a href="dashiji_show.html#16023.html" target="_blank" title="网贷监管终落地  平台将现转型潮">
		                    <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >网贷监管终落地  平台将现转型潮</h3></a>
		                    <a href="dashiji_show.html#16023.html" target="_blank" title="网贷监管终落地  平台将现转型潮">
		                        <p class="m2-reportNews-listNor">
		                            �8月24日，银监会、工信部、公安部、国家互联网信息办公室联合发布了《网络借贷信息中介机构业务活动管理暂行办法》（下称《暂行办法》）。���…</p></a>
		                    <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16023.html" target="_blank" title="网贷监管终落地  平台将现转型潮">显示全部</a></p>
		                </div>
		                <div class="m2-reportNews-listTime">
		                    <p><i></i>2016年08月31日</p>
		                </div>
		            </li><li>
		
		                <div class="m2-reportNews-listMain">
		                    <img class="m2-reportLogo" src="/Finances/statics/front/statics/home2/images/article/from_icon/iqb.png" alt="“家规”落地网贷行业走向成熟">
		                    <a href="dashiji_show.html#16021.html" target="_blank" title="“家规”落地网贷行业走向成熟">
		                        <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >“家规”落地网贷行业走向成熟</h3></a>
		                    <a href="dashiji_show.html#16021.html" target="_blank" title="“家规”落地网贷行业走向成熟">
		                        <p class="m2-reportNews-listNor">
		                            “靴子”终于落地。为加强对网络借贷信息中介机构业务活动的监督管理，促进网络借贷行业健康发展，8月24日，中国银监会、工业和信息化部、公安部、…</p></a>
		                    <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16021.html" target="_blank" title="“家规”落地网贷行业走向成熟">显示全部</a></p>
		                </div>
		                <div class="m2-reportNews-listTime">
		                    <p><i></i>2016年08月30日</p>
		                </div>
		            </li><li>
		
		                <div class="m2-reportNews-listMain">
		                    <img class="m2-reportLogo" src="/Finances/statics/front/uploadData/ad/2015113014080319.png" alt="您属于P2P合格投资人吗？">					<a href="dashiji_show.html#16020.html" target="_blank" title="您属于P2P合格投资人吗？">
		                    <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >您属于P2P合格投资人吗？</h3></a>
		                    <a href="dashiji_show.html#16020.html" target="_blank" title="您属于P2P合格投资人吗？">
		                        <p class="m2-reportNews-listNor">
		                            上周三，孕育了近三年的《网络借贷信息中介机构业务活动管理暂行办法》在广大网贷从业者和投资人的翘首企盼下，终于揭开神秘的面纱。长达47条的《暂…</p></a>
		                    <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16020.html" target="_blank" title="您属于P2P合格投资人吗？">显示全部</a></p>
		                </div>
		                <div class="m2-reportNews-listTime">
		                    <p><i></i>2016年08月30日</p>
		                </div>
		            </li><li>
		
		                <div class="m2-reportNews-listMain">
		                    <img class="m2-reportLogo" src="/Finances/statics/front/uploadData/ad/20151130140806276.png" alt="8.24网贷监管细则 二十多位互金大咖解读">					<a href="dashiji_show.html#16016.html" target="_blank" title="8.24网贷监管细则 二十多位互金大咖解读">
		                    <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >8.24网贷监管细则 二十多位互金大咖解读</h3></a>
		                    <a href="dashiji_show.html#16016.html" target="_blank" title="8.24网贷监管细则 二十多位互金大咖解读">
		                        <p class="m2-reportNews-listNor">
		                            8月24日下午，银监会就《网络借贷信息中介机构业务活动管理暂行办法》有关情况召开了新闻发布会。金评媒记者黄依凡、秦楠楠采访多位互金大咖，为您…</p></a>
		                    <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16016.html" target="_blank" title="8.24网贷监管细则 二十多位互金大咖解读">显示全部</a></p>
		                </div>
		                <div class="m2-reportNews-listTime">
		                    <p><i></i>2016年08月25日</p>
		                </div>
		            </li><li>
		
		                <div class="m2-reportNews-listMain">
		                    <img class="m2-reportLogo" src="/Finances/statics/front/uploadData/ad/20151130140805550.png" alt="爱钱帮CEO王吉涛：网贷行业格局彻底改变">					<a href="dashiji_show.html#16015.html" target="_blank" title="爱钱帮CEO王吉涛：网贷行业格局彻底改变">
		                    <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >爱钱帮CEO王吉涛：网贷行业格局彻底改变</h3></a>
		                    <a href="dashiji_show.html#16015.html" target="_blank" title="爱钱帮CEO王吉涛：网贷行业格局彻底改变">
		                        <p class="m2-reportNews-listNor">
		                            （8月24日），银监会联合工业和信息化部、公安部、国家互联网信息办公室等四部委制定的《网络借贷信息中介机构业务活动管理暂行办法》正式发布。爱…</p></a>
		                    <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16015.html" target="_blank" title="爱钱帮CEO王吉涛：网贷行业格局彻底改变">显示全部</a></p>
		                </div>
		                <div class="m2-reportNews-listTime">
		                    <p><i></i>2016年08月25日</p>
		                </div>
		            </li><li>
		
		                <div class="m2-reportNews-listMain">
		                    <img class="m2-reportLogo" src="/Finances/statics/front/uploadData/ad/20160819160354185.png" alt="投资人保护再升级">					<a href="dashiji_show.html#16008.html" target="_blank" title="投资人保护再升级">
		                    <h3 style="color: #09c;font-size: 16px; line-height: 25px;" >投资人保护再升级</h3></a>
		                    <a href="dashiji_show.html#16008.html" target="_blank" title="投资人保护再升级">
		                        <p class="m2-reportNews-listNor">
		                            近日，中国互联网金融协会向会员公布了《互联网金融信息披露标准——P2P网贷（征求意见稿）》下称P2P网贷（征求意见稿），正式向其会员单位征求…</p></a>
		                    <p class="m2-reportNews-listLink" ><a href="dashiji_show.html#16008.html" target="_blank" title="投资人保护再升级">显示全部</a></p>
		                </div>
		                <div class="m2-reportNews-listTime">
		                    <p><i></i>2016年08月19日</p>
		                </div>
		            </li>		</ul>
		        </div>
		        <script >
		            function pageclick(channel,index){
		                var ajax_url='/ajaxreport-list-'+index;
		                $.ajax({
		                    type: "POST",
		                    url: ajax_url,
		                    dataType: 'text',
		                    data:{
		                        list:index
		                    },
		                    success: function(data) {
		                        page = index;
		                        pager();
		                        $('.m2-reportNews-list li').remove();
		                        $('.m2-reportNews-list').append(data);
		                    }
		                });
		            }
		        </script>
		        <div class="m2-newListpage-con">
		            <div class="m2-newListpage">
		                <div class="m2-news-pages" style="padding-right:40px;margin:12px auto;"></div>
		            </div>
		        </div>
		        <script>
		
		            var channel = 'meitibaodao_aiqianbang_licaiwang';
		            var page = Number(1); 			//当前页
		
		            pager();
		
		            function pager() {
		
		                var totalpage = Number(22); 	//总页数
		                var n1 = 3;								//前后保留n1项，均分剩余页码，保留最前最后页
		                var n2 = 3;								//当前页两旁保留n2项
		                var pages = '<a onclick="pageclick(\''+channel+'\','+(page-1>0?page-1:1)+')" class="m2-pages-num m2-page-prev">&lt;</a>';
		
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
		                            var a = 1 + Math.floor((page-n2-1)*i/n1);
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
		                            var b = page + n2 + Math.ceil((totalpage-page-n2)*i/n1);
		                            pages += addonepage(b, false);
		                        }
		                    }
		                    pages += '<a onclick="pageclick(\''+channel+'\','+(page+1>totalpage?totalpage:page+1)+')" class="m2-pages-num m2-page-next">&gt;</a>';
		                    $('.m2-news-pages').html(pages);
		                }
		            }
		
		            function addonepage(index, iscurrent) {
		                var pageclass = 'm2-page-unsel';
		                if (iscurrent) {
		                    pageclass = 'm2-page-sel';
		                }
		                return '<a onclick="pageclick(\''+channel+'\','+index+')" class="m2-pages-num ' + pageclass + '">' + index + '</a>';
		            }
		        </script>
		    </div>
		    <script type="text/javascript">
		        $(function(){
		            var vedio_address="/Finances/statics/front/uploadData/vedio/1.mp4";
		            /*列表点击*/
		            function listClick(){
		                $('.m2-repVodlist li').click(function(){
		                    var vodDet =$(this).children().find('p').html(); //视频文字信息
		                    var vodImg =$(this).children().find('img').attr('src'); //图片来源
		                    vedio_address="/uploadData/vedio/"+($(this).index()+1)+".mp4";
		                    //vodSrc =$(this).children().find('img').attr('src');
		                    $('.m2-reportVod-lef video').remove();
		                    $('.m2-reportVod-big').show().attr('src',vodImg);
		                    $('.m2-reportVod-lefBg').show();
		                    $('.m2-reportVod-lefBg p').html(vodDet);
		                    $('.m2-reportVod-lef i').show();
		                });
		            }
		            listClick();
		
		            /*视频播放*/ //poster="/Finances/statics/front/images/vedio1.jpg"  src="/Finances/statics/front/uploadData/vedio/1.mp4"
		            $('.m2-reportVod-lef img,.m2-reportVod-lef i').click(function(){
		                $(this).parent().append('<video class="m2-reportVideo" data-setup="{}" preload="none"  loop="false" controls="controls" "><source src="http://www.iqianbang.com/uploadData/vedio/10.mp4" type="video/mp4">您的浏览器版本过低,不能播放此视频</video>');
		                $('.m2-reportVideo').attr("autoplay","autoplay");
		                $('.m2-reportVideo source').attr('src',vedio_address);
		                $('.m2-reportVod-lefBg').hide();
		                $('.m2-reportVod-big').hide();
		                $('.m2-reportVod-lef i').hide();
		                listClick();
		            });
		        });
		    </script>
		    <script type="text/javascript">
	        $(function(){
	            var listNum = Math.ceil(($('.m2-repVodlist li').length)/2); //列表行数
	            var listTop =0; //ul的top
	            $('.m2-repVodlist-btnDown').click(function(){
	                if (listTop>4-listNum) {
	                    listTop-=1;
	                    $('.m2-repVodlist').animate({top:listTop*140},300);
	                    $('.m2-repVodlist-btnUp').fadeIn(150);
	                }
	                else if(listTop=4-listNum){
	                    listTop-=1;
	                    $('.m2-repVodlist').animate({top:listTop*140},300);
	                    $(this).fadeOut(150);
	                    $('.m2-repVodlist-btnUp').fadeIn(150);
	                }
	
	            });
	
	            $('.m2-repVodlist-btnUp').click(function(){
	                if (listTop<-1) {
	                    listTop+=1;
	                    $('.m2-repVodlist').animate({top:listTop*140},300);
	                    $('.m2-repVodlist-btnDown').fadeIn(150);
	                }
	                else if (listTop=-1) {
	                    listTop+=1;
	                    $('.m2-repVodlist').animate({top:listTop*140},300);
	                    $('.m2-repVodlist-btnDown').fadeIn(150);
	                    $(this).fadeOut(150);
	                }
	
	            });
	            if ($('.m2-repVodlist li').length>6) {$('.m2-repVodlist-btnDown').show();} //显示下按钮
	        });
	    </script>
	    <link rel="stylesheet" href="/Finances/statics/front/statics/home/css/newPage.css" />
		
		<!-- 足部start -->
			<jsp:include page="../include/floot.jsp"></jsp:include>
		<!-- 足部end -->
		
		<script src="/Finances/statics/front/statics/common/js/common.js"></script>
	    <link type="text/css" rel="stylesheet" href="/Finances/statics/front/statics/common/tipBox/colorbox-master/css/colorbox.css">
	    <script src="/Finances/statics/front/statics/common/tipBox/layer-v1.5.1/layer/layer.js"></script>
	    <script src="/Finances/statics/front/statics/common/tipBox/common.js"></script>
	    <!--tipBOx-->
	    <script language=JavaScript type="text/javascript" src="/Finances/statics/front/statics/home/js/tab.js"></script>
	    <script type="text/javascript">$(function () {
	        if ($.browser && $.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
	            $('#fixed-services').css('display', 'none');
	        }
	    })
	    </script>
	</body>
</html>