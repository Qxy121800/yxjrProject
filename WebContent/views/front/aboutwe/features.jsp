<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
	    <meta name="keywords" content="互联网金融平台,业务">
	    <meta name="description" content="爱钱帮业务模式，金融局监管的融资性担保公司保本保息，资金第三方支付监管，当日投资当日计息，双重风控；是一个公平、透明、安全、高效的互联网金融平台。">
	    <title>业务特色丨关于我们丨亿信金融</title>
	    <!--[if lt IE 9]>
	    	<script src="<%=path%>/statics/front/statics/newcommon/js/html5shiv.js"></script>
	    <![endif]-->
	    <link  rel="Shortcut  Icon"  href="/Finances/statics/other/lco/6.png">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-commonNew.css">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/m2-main.css">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-common.css">
	    <script type="text/javascript" src="/Finances/statics/front/statics/home/js/jquery.min.js"></script>
	    <script type="text/javascript" src="/Finances/statics/front/statics/newcommon/js/common.js"></script>
	</head>
	<body>
    <head>
        <meta charset="UTF-8">
        <title>业务特色</title>
        <link rel="stylesheet" href="/Finances/statics/front/statics/home2/css/m2-main.css">
    </head>
    <!-- 右侧边栏start -->
    <!-- 右侧登录窗口 -->
    <!--右侧登录框-->
	    <div class="mo2-indexLoginbox" id="right-fix">
	        <!-- 登录注册start -->
	        <div class="mo2-indLogreg" style="display: none">
	            <div class="mo2-indLogtab">
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
		                    <div class="num num1">
		                        3                </div>
		                    <div class="toAbs">
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
		                                <img id="ivrSecurityCodeImg" onclick="getCode()" src="/Finances/statics/front/statics/home2/images/home-register-VerifyCode.png" alt="验证码" title="点击更新验证码">
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
		        $(function(){
		            $(".fixbox_bar").click(function(event){
		                event.stopPropagation();
		            });
		
		            $("#fixbar .myclick li").click(function(event){
		                var select=$(this).attr("data");
		                $(".fixnavbar").css("display","none");
		                $(select).css("display","block");
		                $('#fixbar').animate({ right: '300'}, "slow");
		                $("#fixbar .fixbox_bar").animate({ right: '-18'}, "slow");
		
		                // 阻止事件冒泡
		                event.stopPropagation();
		                if(select=="#fixnavbar_one"){
		                    $.ajax({
		                        type:'POST',
		
		                        url:"/Home-RightHomePage-account_right_new",
		                        success:function(msg){
		                            var obj = eval('('+msg+')');
		                            $("#right_today_earn").text(obj.today_earn);
		                            $("#right_total_capital").text(obj.total_capital);
		                            $("#right_account_money").text(obj.account_money);
		                            $("#right_reward_money").text(obj.reward_money);
		                            $("#right_total_asset").text(obj.total_asset);
		                            $("#right_total_wait_interest").text(obj.total_wait_interest);
		                            $("#right_name_info").text(obj.real_name);
		                            $("#right_total_reward_normal_interest").text(obj.total_reward_normal_interest);
		                        }
		
		                    });
		                }else if(select=="#fixnavbar_two"){
		                    $.ajax({
		                        type: "POST",
		                        url: '/Home-RightHomePage-hb_right_new',
		                        success: function(data) {
		                            $('#fixnavbar_two').empty();
		                            $('#fixnavbar_two').append(data);
		                        }
		                    });
		                }else if(select=="#fixnavbar_three"){
		                    $.ajax({
		                        type: "POST",
		                        url: '/Home-RightHomePage-jxq_right_new',
		                        success: function(data) {
		                            $('#fixnavbar_three').empty();
		                            $('#fixnavbar_three').append(data);
		                        }
		                    });
		                }else if(select=="#fixnavbar_four"){
		                    $.ajax({
		                        type: "POST",
		                        url: '/Home-RightHomePage-sitemsg_right_new',
		                        success: function(data) {
		                            $('#fixnavbar_four').empty();
		                            $('#fixnavbar_four').append(data);
		                        }
		                    });
		                }
		
		
		
		            });
		            // 点击页面其他地方框消失
		            $("body").click(function(){
		                $('#fixbar').animate({ right: '0'}, "slow");
		                $("#fixbar .fixbox_bar").animate({ right: '-318'}, "slow");
		            });
		
		        })
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
		
		<body style="background-color:#f0f0f0;">
	    <div class="m2-bus-bannerCon">
	
	    </div>
	    <div class="m2-busMain-con">
	        <div class="m2-busMainsec1">
	            <h2>关于文化</h2>
	            <div class="m2-busSec1box">
	                <div class="m2-busSec1box-lef">
	                    <img src="/Finances/statics/front/statics/home2/images/m2-busMainsec1.jpg" alt="">
	                </div>
	                <div class="m2-busSec1box-rig">
	                    <div class="m2-busSec1-det1">
	                        <p class="m2-busSec1-big">企业投资文化</p>
	                        <p class="m2-busSec1-nor">用互联网精神变革金融投资生活。</p>
	                    </div>
	                    <div class="m2-busSec1-det2">
	                        <p class="m2-busSec1-big">企业愿景</p>
	                        <p class="m2-busSec1-nor">打造最好玩安全的互联网金融理财！</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="m2-busTable">
	            <h1 class="m2-busTab-tit">产品特色</h1>
	            <div class="m2-busTabcon">
	                <div class="m2-busTabbox">
	                    <div class="m2-busTablist">
	                        <b></b>
	                        <ul>
	                            <li class="m2-busTab-sel m2-busTabbar1"><i class="m2-busTabicon1"></i></li>
	                            <li class="m2-busTab-unsel m2-busTabbar6"><i class="m2-busTabicon6"></i></li>
	                            <li class="m2-busTab-unsel m2-busTabbar7"><i class="m2-busTabicon7"></i></li>
	                            <li class="m2-busTab-unsel m2-busTabbar2"><i class="m2-busTabicon2"></i></li><!--
								<li class="m2-busTab-unsel m2-busTabbar3"><i class="m2-busTabicon3"></i></li>
								<li class="m2-busTab-unsel m2-busTabbar4"><i class="m2-busTabicon4"></i></li>
								--><li class="m2-busTab-unsel m2-busTabbar5"><i class="m2-busTabicon5"></i></li>
	                        </ul>
	                    </div>
	
	                    <div class="m2-busTabmain">
	                        <div class="m2-busLi m2-busLi1">
	                            <div class="m2-busLitop">
	                                <h3>汽车金融</h3>
	                                <p class="m2-busLitop-nor">汽车行业是爱钱帮专注发展的重点领域，随着进口汽贸商抵质押业务、个人车辆抵质押业务的逐步开展，爱钱帮已经逐步建立了汽车金融多产品齐头并进的局面。</p>
	                                <div class="m2-busLitop-btn"><a href="/Finances/toinvest">项目详情&raquo;</a></div>
	                            </div>
	                            <div class="m2-busLibottom m2-busLibottom1">
	                                <div class="m2-busBotsec" style="margin-bottom:15px;">
	                                    <h4><i></i>汽车帮</h4>
	                                    <p class="m2-busBotsec-nor">进口汽贸商车辆质押融资业务，安全性、流动性和收益型结合最好的项目。</p>
	                                </div>
	                                <div class="m2-busBotsec">
	                                    <h4><i></i>爱车贷</h4>
	                                    <p class="m2-busBotsec-nor">汽车质押贷款是爱钱帮在汽车金融垂直领域的新产品，联手线下专业车贷团队，为爱亲们提供期限1至3个月，年化收益8%~10%的优质短期投资项目。</p>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="m2-busLi m2-busLi2" style="display:none">
	                            <div class="m2-busLitop">
	                                <h3>文创金融</h3>
	                                <p class="m2-busLitop-nor">爱钱帮是网贷行业内唯一一家专注影视、动漫、游戏等文化创意产业的互联网金融服务平台，独到的行业理解，专业的风控结构，充满乐趣的附加权益。咱也任性起来，玩着把钱挣了！</p>
	                                <div class="m2-busLitop-btn"><a href="/Finances/toinvest">项目详情&raquo;</a></div>
	                            </div>
	                            <div class="m2-busLibottom m2-busLibottom2">
	                                <div class="m2-busBotsec">
	                                    <h4><i></i>娱乐帮</h4>
	                                    <p class="m2-busBotsec-nor">安全有保障，高端大气又好玩的影视投资项目，百元即为影视人，支持你喜爱的电影和明星。</p>
	                                </div>
	                            </div>
	                        </div><!--
	
							<div class="m2-busLi m2-busLi3" style="display:none">
								<div class="m2-busLitop">
									<h3>商圈金融</h3>
									<p class="m2-busLitop-nor">爱钱帮针对专业市场、产业园区、产业集群等各类商圈，采用批量信贷开发模式，增强商圈整体风控能力，为单一商户增信解决其融资难的问题。</p>
									<div class="m2-busLitop-btn"><a href="/haixiangbang_licai_chanpin.html">项目详情&raquo;</a></div>
								</div>
								<div class="m2-busLibottom m2-busLibottom3">
									<div class="m2-busBotsec">
										<h4><i></i>海鲜帮</h4>
										<p class="m2-busBotsec-nor">爱钱帮针对辽宁省大连国际水产品交易中心大宗商品交易商，采用存货质押形式，让投资人享受高收益，还能吃到海鲜美味！。</p>
									</div>
								</div>
							</div>
	
							<div class="m2-busLi m2-busLi4" style="display:none">
								<div class="m2-busLitop" style="width:512px;padding-top:85px;">
									<h3>债权优选</h3>
									<p class="m2-busLitop-nor">联合小贷公司、典当行、融资租赁、资管公司等优质初始债权渠道，承接其优质的债权项目，由初始债权方承诺无限回购，将项目的风险进一步降低。</p>
									<div class="m2-busLitop-btn"><a href="/wangshang_licai_chanpin.html">项目详情&raquo;</a></div>
								</div>
							</div>
	
							--><div class="m2-busLi m2-busLi5" style="display:none">
	                        <div class="m2-busLitop" style="width:382px;padding-top:85px;">
	                            <h3>公益普惠</h3>
	                            <h4 class="m2-busli-h4" style="margin:4px 0 2px 0;">投资一个希望&nbsp;&nbsp;&nbsp;点亮一个梦想</h4>
	                            <p class="m2-busLitop-nor">奉献爱心，让每一个人都有自由逐梦的权利。爱钱帮携手公益项目，确保每一份爱心用到实处。勿以善小而不为，与其摇摆不定，不如即刻行动！</p>
	                            <div class="m2-busLitop-btn"><a href="/Finances/toinvest">项目详情&raquo;</a></div>
	                        </div>
	                    </div>
	
	                        <div class="m2-busLi m2-busLi6" style="display:none">
	                            <div class="m2-busLitop">
	                                <h3>房产金融</h3>
	                                <p class="m2-busLitop-nor">“爱房贷”是银行认可的以自有物业为抵押品，或银行已批贷但急需资金的借款人，向投资人申请短期借款，还款来源有三重保证，一是借款人在取得银行贷款后第一时间归还投资人；二是担保公司为该笔借款提供全额保证；三是北京优质房产低折扣率抵押担保，是目前市场上及其安全的房产抵押类理财产品。</p>
	                                <div class="m2-busLitop-btn"><a href="/Finances/toinvest">项目详情&raquo;</a></div>
	                            </div>
	                            <div class="m2-busLibottom m2-busLibottom2" style="width:542px">
	                                <div class="m2-busBotsec">
	                                    <h4><i></i>爱房贷</h4>
	                                    <ul class="m2-busBotsec-nor">
	                                        <li>1. 京城核心区域房产，房屋不易贬值，资产损失风险低；</li>
	                                        <li>2. 房产抵押登记手续完备规范，抵押率合理，资产处置风险低；</li>
	                                        <li>3. 依托银行审核，上线前三方四道流程无死角审核，确保产品的安全性；</li>
	                                        <li>4. 担保机构为借款提供债权回购保障，本息保障高。</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="m2-busLi m2-busLi7" style="display:none">
	                            <div class="m2-busLitop">
	                                <h3>消费金融</h3>
	                                <p class="m2-busLitop-nor">“消费金融”是针对在特定消费场景中真实交易的特定人群，解决消费者分期消费及时享受产品及服务的需求，故向投资人申请中长期借款，还款来源有三重保证，一是借款人在特别设计的风控模型中进行严格的审查流程；二是担保公司为该笔借款提供全额保证；三是合作商户进行全面支持，反馈市场产品价格及消费趋势信息，做到特定场景特定项目的精准对焦。</p>
	                                <div class="m2-busLitop-btn"><a href="/Finances/toinvest">项目详情&raquo;</a></div>
	                            </div>
	                            <div class="m2-busLibottom m2-busLibottom2">
	                                <div class="m2-busBotsec">
	                                    <h4><i></i>消费金融</h4>
	                                    <ul class="m2-busBotsec-nor">
	                                        <li>1. 优质消费场景，持续的消费习惯，资产损失风险低；</li>
	                                        <li>2. 风控模型严格，风控条件只针对特定人群特定场景特定项目； </li>
	                                        <li>3. 担保机构为借款提供债权回购保障，本息保障高。</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	
	                    </div>
	                </div>
	
	
	                <div class="m2-busImgbox">
	                    <b class="m2-busImg1 m2-busImg"></b>
	                    <b class="m2-busImg2 m2-busImg" style="display:none;height: 256px;"></b>
	                    <!--					<b class="m2-busImg3 m2-busImg" style="display:none"></b>-->
	                    <!--					<b class="m2-busImg4 m2-busImg" style="display:none"></b>-->
	                    <b class="m2-busImg5 m2-busImg" style="display:none"></b>
	                    <b class="m2-busImg6 m2-busImg" style="display:none"></b>
	                    <b class="m2-busImg7 m2-busImg" style="display:none;height:230px;width:390px;"></b>
	                </div>
	            </div>
	        </div>
	    </div>
	
	
	    <script type="text/javascript">
	        $(function(){
	            // 左侧列表状态切换
	            $('.m2-busTablist ul li').mouseenter(function(){
	                if ($(this).hasClass('m2-busTab-unsel')) {
	                    $(this).addClass('m2-busTab-sel').removeClass('m2-busTab-unsel');
	                    $(this).siblings('.m2-busTab-sel').addClass('m2-busTab-unsel').removeClass('m2-busTab-sel');
	                }
	            });
	
	            rightReset();
	            // 重置7张图片right值
	            function rightReset(){
	                $('.m2-busImg1').css('right',-70);
	                $('.m2-busImg2').css('right',-63);
	                $('.m2-busImg3').css('right',-70);
	                $('.m2-busImg4').css('right',-25);
	                $('.m2-busImg5').css('right',-59);
	                $('.m2-busImg6').css('right',-59);
	                $('.m2-busImg7').css('right',-59);
	            }
	
	            //鼠标划过效果
	            $('.m2-busTabbar1').mouseenter(function(){
	                rightReset();
	                $('.m2-busLi1').siblings('.m2-busLi').stop().hide();
	                $('.m2-busImg1').siblings('.m2-busImg').stop().hide();
	                $('.m2-busLi1').fadeIn(300);
	                $('.m2-busImg1').stop().show().animate({right:"0px"},300);
	            });
	
	            $('.m2-busTabbar2').mouseenter(function(){
	                rightReset();
	                $('.m2-busLi2').siblings('.m2-busLi').stop().hide();
	                $('.m2-busImg2').siblings('.m2-busImg').stop().hide();
	                $('.m2-busLi2').fadeIn(300);
	                $('.m2-busImg2').stop().show().animate({right:"7px"},300);
	            });
	
	//		$('.m2-busTabbar3').mouseenter(function(){
	//			rightReset();
	//			$('.m2-busLi3').siblings('.m2-busLi').stop().hide();
	//			$('.m2-busImg3').siblings('.m2-busImg').stop().hide();
	//			$('.m2-busLi3').fadeIn(300);
	//			$('.m2-busImg3').stop().show().animate({right:"0px"},300);
	//		});
	//
	//		$('.m2-busTabbar4').mouseenter(function(){
	//			rightReset();
	//			$('.m2-busLi4').siblings('.m2-busLi').stop().hide();
	//			$('.m2-busImg4').siblings('.m2-busImg').stop().hide();
	//			$('.m2-busLi4').fadeIn(300);
	//			$('.m2-busImg4').stop().show().animate({right:"45px"},300);
	//		});
	
	            $('.m2-busTabbar5').mouseenter(function(){
	                rightReset();
	                $('.m2-busLi5').siblings('.m2-busLi').stop().hide();
	                $('.m2-busImg5').siblings('.m2-busImg').stop().hide();
	                $('.m2-busLi5').fadeIn(300);
	                $('.m2-busImg5').stop().show().animate({right:"11px"},300);
	            });
	
	            $('.m2-busTabbar6').mouseenter(function(){
	                rightReset();
	                $('.m2-busLi6').siblings('.m2-busLi').stop().hide();
	                $('.m2-busImg6').siblings('.m2-busImg').stop().hide();
	                $('.m2-busLi6').fadeIn(300);
	                $('.m2-busImg6').stop().show().animate({right:"11px"},300);
	            });
	
	            $('.m2-busTabbar7').mouseenter(function(){
	                rightReset();
	                $('.m2-busLi7').siblings('.m2-busLi').stop().hide();
	                $('.m2-busImg7').siblings('.m2-busImg').stop().hide();
	                $('.m2-busLi7').fadeIn(300);
	                $('.m2-busImg7').stop().show().animate({right:"11px"},300);
	            });
	        });
	    </script>
	</body>
</html>