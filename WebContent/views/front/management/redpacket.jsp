<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
	    <!--[if lt IE 9]>
	    <script src="statics/newcommon/js/html5shiv.js"></script>
	    <![endif]-->
	    <meta name="keywords" content="网贷平台,网络借贷，网络赚钱项目,理财产品">
	    <meta name="description" content="爱钱帮网贷平台为您提供网络赚钱项目；为此相继推出了许多新的理财产品，在为您创造高收益的同时也优化了理财产品模式。网络借贷，就选爱钱帮。">
	    <meta charset="UTF-8">
	    <link  rel="Shortcut  Icon"  href="/Finances/statics/other/lco/smalllog.png">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-commonNew.css">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-common.css">
	    <link rel="Shortcut  Icon" href="/Finances/statics/other/lco/smalllog.png">
	    <link rel="stylesheet" href="/Finances/statics/front/statics/usercenter/css/userCenter.css">
	    <script type="text/javascript" src="/Finances/statics/front/statics/newcommon/js/jquery.min.js"></script>
	    <script type="text/javascript" src="/Finances/statics/front/statics/newcommon/js/common.js"></script>
	    <script type="text/javascript" src="/Finances/statics/front/statics/usercenter/js/esl.js"></script>
	    <link rel="stylesheet" href="/Finances/statics/front/statics/usercenter/css/jquery.datetimepicker.css" />
	    <script type="text/javascript" src="/Finances/statics/front/statics/usercenter/js/jquery.datetimepicker.js"></script>
		<title>我的红包--爱钱帮</title>
	</head>
	<body>
		<!-- 右侧边栏start -->
		<div class="m2-commonRight">
		    <ul class="m2-comRiglist">
		        <li class="m2-comRigli m2-comRigli-ewm">
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
		                        <img id="ivrSecurityCodeImg" onclick="getCode()" src="/Finances/statics/front/statics/home2/images/code.png" alt="验证码" title="点击更新验证码">
		                    </div>
		                </div>
		                <div class="m2-comRigtel-rig">
		                    <span  onclick='callback()'>免费<br>拨打</span>
		                </div>
		            </div>
		        </li>
		        <li class="m2-comRigli m2-comRigli-qq">
		            <a  target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=2522274059&amp;site=qq&amp;menu=yes">
		                <i class="m2-comRigli-icon"></i>
		                <span class="m2-comRigli-hov">在线<br>客服</span>
		            </a>
		            <!-- <div class="m2-comRighide"></div> -->
		        </li>
		        <!--<li class="m2-comRigli m2-comRigli-sug">-->
		        <!--<i class="m2-comRigli-icon"></i>-->
		        <!--<span class="m2-comRigli-hov">意见<br>反馈</span>-->
		        <!-- <div class="m2-comRighide"></div> -->
		        <!--</li>-->
		        <li class="m2-comRigli m2-comRigli-top">
		            <i class="m2-comRigli-icon"></i>
		            <span class="m2-comRigli-hov">返回<br>顶部</span>
		            <!-- <div class="m2-comRighide"></div> -->
		        </li>
		    </ul>
		</div>
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
		
		<!-- 内容start -->
		<div class="m2-userCentermain">
	    <div class="m2-userCentermain-aside">
	        <ul>
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item" href="/Finances/views/front/user/usercenter.jsp"><i class="m2-asideIcon1"></i>我的账户</a>
	            </li>
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item" href="/Finances/views/front/user/growthcenter.jsp"><i class="m2-asideIcon-vip"></i>成长值中心</a>
	            </li>
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item m2-aside-toggle" ><i class="m2-asideIcon2"></i>投资管理<b class="m2-asideIcon-new"></b></a>
	                <ul class="m2-aside-secItem" style="display:none">
	                    <!--             取消自动投标-->
	                    <!--                   <li>-->
	                    <!--                        <a class="m2-aside-secLink-item" href="/usercenter-investcontrol-autoinvest"><b class="m2-asideIcon-new"></b>自动投标</a>-->
	                    <!--                    </li>-->
	
	                    <li>
	                        <a class="m2-aside-secLink-item" href="/Finances/views/front/user/investrecord.jsp">投资记录</a>
	                    </li>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="/Finances/views/front/user/payment.jsp">回款计划</a>
	                    </li>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="/Finances/views/front/user/transfer.jsp">债权转让</a>
	                    </li>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="/Finances/views/front/invest.jsp" target="_blank">立即投资</a>
	                    </li>
	
	                </ul>
	            </li>
	
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item" href="/Finances/views/front/inviting.jsp">
	                    <i class="m2-asideIcon-invit"></i>
	                    <b class="m2-asideIcon-prize"></b>
	                    邀请好友
	                </a>
	            </li>
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item m2-aside-toggle" href="/Finances/views/front/openbankid.jsp"><i class="m2-asideIcon3"></i>徽商资金管理</a>            <ul class="m2-aside-secItem" style="display:none">
	                <li><a class="m2-aside-secLink-item" href="#">充&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;值</a></li>
	                <li><a class="m2-aside-secLink-item" href="#">提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现</a></li>
	                <li><a class="m2-aside-secLink-item" href="#">资金流水</a></li>
	
	            </ul>
	            </li>
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item m2-aside-toggle" ><i class="m2-asideIcon4"></i>奖励管理</a>
	                <ul class="m2-aside-secItem" style="display:none">
	                    <li>
	                        <a class="m2-aside-secLink-item" href="/Finances/views/front/management/rewardrecord.jsp">奖励金流水</a>
	                    </li>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="/Finances/views/front/management/redpacket.jsp">我的红包</a>
	                    </li>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="usercenter-rewardcontrol-interestcoupon.html">我的加息券</a>
	                    </li>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="usercenter-rewardcontrol-mycoin.html">我的钱帮币</a>
	                    </li>
	                </ul>
	            </li>
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item m2-aside-toggle" ><i class="m2-asideIcon5"></i>消息管理 </a>
	                <ul class="m2-aside-secItem" style="display:none">
	                    <li>
	                        <a class="m2-aside-secLink-item" href="usercenter-messagecontrol-sitemsg.html">站内消息</a>
	                    </li>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="usercenter-messagecontrol-set_message.html">通知设置</a>
	                    </li>
	                </ul>
	            </li>
	            <li class="m2-asideListitem">
	                <a class="m2-aside-item m2-aside-toggle" ><i class="m2-asideIcon6"></i>账户管理</a>
	                <ul class="m2-aside-secItem" style="display:none" id='aaa'>
	                    <li>
	                        <a class="m2-aside-secLink-item" href="#">账户设置</a>
	                    </li>
	                </ul>
	            </li>
	        </ul>
	    </div>
	    <script>
	        // 		$(document).ready(function(){
	        var href = window.location.href;
	        var search = window.location.search;
	        $('.m2-asideListitem ul a').each(function () {
	            if ($(this).prop('href') + search == href) {
	                if ($(this).prop('href') == "/usercenter-wangbaoqiang" || $(this).prop('href') == "/usercenter-sirendingqi") {
	                } else {
	                    $(this).parent().parent('ul').show();
	                    $(this).parent().parent('ul').prev('a').removeClass('m2-aside-item');
	                    $(this).parent().parent('ul').prev('a').addClass('m2-aside-cur');
	                    $(this).css('text-decoration', 'underline');
	                    $(this).css('color', '#0996CC');
	                }
	            }
	        });
	        $('.m2-asideListitem a:not(.m2-asideListitem ul a)').each(function () {
	            if ($(this).prop('href') + search == href) {
	                if ($(this).prop('href').search("usercenter-wangbaoqiang") > -1) {
	                    $(this).removeClass('m2-aside-wbq');
	                    $(this).addClass('m2-aside-cur');
	                } else if ($(this).prop('href').search("usercenter-sirendingqi") > -1) {
	                    $(this).removeClass('m2-aside-wbq');
	                    $(this).addClass('m2-aside-cur');
	                } else {
	                    $(this).removeClass('m2-aside-item');
	                    $(this).addClass('m2-aside-cur');
	                }
	            }
	        });
	        $('.m2-asideListitem a:not(.m2-asideListitem ul a)').click(function () {
	            if ($(this).prop('href') == '') {
	                $(this).siblings('ul').slideToggle();
	                $(this).parent().siblings('.m2-asideListitem').children('.m2-aside-secItem').slideUp();
	            }
	        });
	        // 		});
	    </script>
	    <div class="m2-ticketCon">
	        <div class="m2-ticketHead">
	            <h3><i class="m2-tickHead-red1"></i>我的红包</h3>
	        </div>
	        <div class="m2-recharge-tips" style="margin-bottom:10px;">
	            <p class="m2-ticPsg-nor">红包使用</p>
	            <ul style="padding-bottom:18px;">
	                <li><i class="m2-recharge-tips01"></i><b>投资时根据单笔投资金额选择红包</b></li>
	                <li><i class="m2-recharge-tips02"></i><b>一次投资可使用一个红包</b></li>
	                <li><i class="m2-recharge-tips03"></i><b>红包过期后将不能使用</b></li>
	            </ul>
	        </div>
	
	        <div class="m2-ticketHead">
	            <h3><i class="m2-tickHead-red2"></i>红包列表</h3>
	        </div>
	        <div class="m2-ticSearch">
	            <ul>
	                <li class="m2-ticSea-tit">红包状态：</li>
	                <li class="m2-ticSea-sel m2-ticSea-click" data="1"><span>未使用</span></li>
	                <li class="m2-ticSea-unsel m2-ticSea-click" data="2"><span>已使用</span></li>
	                <li class="m2-ticSea-unsel m2-ticSea-click" data="3"><span>已过期</span></li>
	            </ul>
	        </div>
	        <div id="tab1" class="m2-ticSea-sel-content">
	            <div class="m2-ticResult">
	                <div class="m2-ticResult_container">
	
	                    <div class="m2_ticresult_reword m2_ticresult_unuse">						<div class="packet_title">
	                        <span>注册奖励</span>
	                        <span class="packet_where"></span>
	                    </div>
	                        <div class="packet_introduce_left">
	                            <span class="number">8</span>
	                            <span class="unit">元</span>
	                        </div>
	                        <div class="packet_introduce_right">
	                            <div class="packet_introduce_right_con">
	
	                                <p>·&nbsp;投资额≥200元可使用</p>
	                            </div>
	                            <i></i>
	                        </div>
	                        <div class="packet_bottom">
	                            <span>起效期：2016-09-05</span>
	                            <span class="packet_endtime">有效期至：2016-09-12 09:29:52</span>
	                        </div>
	                    </div>
	                    <div class="m2_ticresult_reword m2_ticresult_unuse">						<div class="packet_title">
	                        <span>注册奖励</span>
	                        <span class="packet_where"></span>
	                    </div>
	                        <div class="packet_introduce_left">
	                            <span class="number">10</span>
	                            <span class="unit">元</span>
	                        </div>
	                        <div class="packet_introduce_right">
	                            <div class="packet_introduce_right_con">
	
	                                <p>·&nbsp;投资额≥1000元可使用</p>
	                            </div>
	                            <i></i>
	                        </div>
	                        <div class="packet_bottom">
	                            <span>起效期：2016-09-05</span>
	                            <span class="packet_endtime">有效期至：2016-10-05 09:29:52</span>
	                        </div>
	                    </div>
	                    <div class="m2_ticresult_reword m2_ticresult_unuse">						<div class="packet_title">
	                        <span>注册奖励</span>
	                        <span class="packet_where"></span>
	                    </div>
	                        <div class="packet_introduce_left">
	                            <span class="number">20</span>
	                            <span class="unit">元</span>
	                        </div>
	                        <div class="packet_introduce_right">
	                            <div class="packet_introduce_right_con">
	
	                                <p>·&nbsp;投资额≥5000元可使用</p>
	                            </div>
	                            <i></i>
	                        </div>
	                        <div class="packet_bottom">
	                            <span>起效期：2016-09-05</span>
	                            <span class="packet_endtime">有效期至：2016-10-05 09:29:52</span>
	                        </div>
	                    </div>			</div>
	                <div class="m2-ticTotbottom-red">
	                    <span><i></i><span id="wsyljkyze">累计可用总额：38元</span></span>
	                </div>
	            </div>
	        </div>
	        <div id="tab2" class="m2-ticSea-sel-content" style="display:none;">
	            <div class="m2-ticResult">
	                <div class="m2-ticResult_container">
	                </div>
	                <div class="m2-ticTotbottom-red">
	                    <span><i></i><span id="ysyljkyze">累计可用总额：0元</span></span>
	                </div>
	            </div>
	        </div>
	        <div id="tab3" class="m2-ticSea-sel-content" style="display:none;">
	            <div class="m2-ticResult">
	                <div class="m2-ticResult_container">
	                </div>
	                <div class="m2-ticTotbottom-red">
	                    <span><i></i><span id="ygqljkstze">累计可用总额：0元</span></span>
	                </div>
	            </div>
	        </div>
	        <div class="m2-ticMoreadd">
	            <span>加载更多</span>
	        </div>
	    </div>
	    <script type="text/javascript">
	        var wsyljze="38";
	        var ysyljze="0";
	        var ygqljze="0";
	
	        //筛选栏点击
	        $('.m2-ticSearch ul li').click(function () {
	            if ($(this).hasClass('m2-ticSea-unsel')) {
	                $(".m2-ticSea-click").addClass('m2-ticSea-unsel').removeClass('m2-ticSea-sel');
	                $(this).addClass('m2-ticSea-sel').removeClass('m2-ticSea-unsel');
	                $(".m2-ticSea-sel-content").hide();
	                $("#tab"+$(this).attr("data")).show();
	            }
	        });
	
	        //发送页数的数组
	        var selectpage=[2,2,2];
	
	        $(".m2-ticMoreadd").click(function(){
	            var type=$(".m2-ticSearch .m2-ticSea-sel").attr("data");
	            var page=selectpage[Number(type)-1];
	            var dataStr;
	            $.ajax({
	                url: 'usercenter-rewardcontrol-getRewardNew',
	                type: 'POST',
	                data: {
	                    index: page,
	                    cate: type,
	                    type: 1
	                },
	                success:function(data){
	                    var obj = eval('(' + data + ')');
	                    var str="";
	                    var dataStr="";
	
	                    for (var i in obj['list']) {
	                        var xtwz="";
	                        if(type==1){
	                            if(obj['list'][i]['type']==1){
	                                str="<div class='m2_ticresult_reword m2_ticresult_unuse'>";
	                            }else if (obj['list'][i]['type']==3){
	                                str="<div class='m2_ticresult_reword m2_ticresult_unactive'>";
	                            }
	                        }else if(type==2){
	                            str=" <div class='m2_ticresult_reword m2_ticresult_hasused'>";
	                        }else if(type==3){
	                            str=" <div class='m2_ticresult_reword m2_ticresult_endtime'>";
	                        }
	                        console.log(obj['list'][i]['allow_project_period']);
	                        if(obj['list'][i]['allow_project_period']==0){
	
	                        }else{
	                            xtwz="·&nbsp;限投"+obj['list'][i]['allow_project_period']+"个月及以上项目";
	                        }
	
	                        dataStr +=str+"<div class='packet_title'><span>"+obj['list'][i]['info']+"</span>"
	                        +"<span class='packet_where'>"+obj['list'][i]['allow_client_type']+"</span></div><div class='packet_introduce_left'>"
	                        +"<span class='number'>"+obj['list'][i]['money']+"</span><span class='unit'>元</span></div>"
	                        +"<div class='packet_introduce_right'><div class='packet_introduce_right_con'><p>"+xtwz+"</p><p>"
	                        +"·&nbsp;投资额≥"+obj['list'][i]['use_condition']+"元可使用</p></div><i></i></div><div class='packet_bottom'><span>起效期："+obj['list'][i]['date1']+"</span><span class='packet_endtime'>有效期至："+obj['list'][i]['date2']+"</span></div></div>";
	                    }
	                    if(type==1){
	                        wsyljze= Number( wsyljze) +Number(obj['ljkyze']) ;
	                        $("#wsyljkyze").html("累计可用总额："+wsyljze+"元");
	                    }else if(type==2){
	                        ysyljze=Number(ysyljze) +Number( obj['ljkyze']);
	                        $("#ysyljkyze").html("累计可用总额："+ysyljze+"元");
	                    }else if(type==3){
	                        ygqljze=Number(ygqljze)+Number( obj['ljkyze']);
	                        $("#ygqljkstze").html("累计可用总额："+ygqljze+"元");
	                    }
	
	                    $("#tab"+type).find(".m2-ticResult_container").append(dataStr);
	                    selectpage[Number(type)-1]++;
	                }
	            });
	        });
	    </script>
	</body>
</html>