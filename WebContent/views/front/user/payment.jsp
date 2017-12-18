<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		    <meta name="keywords" content="网贷平台,网络借贷，网络赚钱项目,理财产品">
    		<meta name="description" content="爱钱帮网贷平台为您提供网络赚钱项目；为此相继推出了许多新的理财产品，在为您创造高收益的同时也优化了理财产品模式。网络借贷，就选爱钱帮。">
    		<title>回款计划--爱钱帮</title>
    		<link rel="shortcut icon" href="/Finances/statics/other/lco/smalllog.png"> 
   			<link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-commonNew.css">
    		<link rel="stylesheet" href="/Finances/statics/front/statics/newcommon/css/m2-common.css">
    		<link rel="shortcut icon" href="/Finances/statics/other/lco/smalllog.png">
    		<link rel="stylesheet" href="/Finances/statics/front/statics/usercenter/css/userCenter.css">
    		<script type="text/javascript" src="/Finances/statics/front/statics/newcommon/js/jquery.min.js"></script>
    		<script type="text/javascript" src="/Finances/statics/front/statics/newcommon/js/common.js"></script>
    		<script type="text/javascript" src="/Finances/statics/front/statics/usercenter/js/esl.js"></script>
    		<link rel="stylesheet" href="/Finances/statics/front/statics/usercenter/css/jquery.datetimepicker.css" />
    		<script type="text/javascript" src="/Finances/statics/front/statics/usercenter/js/jquery.datetimepicker.js"></script>
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
	
		<!-- 内容 -->
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
                        <a class="m2-aside-secLink-item" href="/Finances/views/front/management/interestcoupon.jsp">我的加息券</a>
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

    <style>
        .n-hid {
            display:block;
            position:relative;
            cursor: pointer;
            height: 20px;
            width: 20px;
            margin:10px auto;
            background:url("/Finances/statics/front/statics/usercenter/images/mark.png") no-repeat 0px 0px;
        }
        .n-hid .n-hov {
            background-color: #f5f5f5;
            border: 2px solid #d4a439;
            border-radius: 8px;
            color: #717171;
            display: none;
            font-size: 12px;
            line-height: 24px;
            padding: 12px 5px;
            position: absolute;
            right: -200px;
            top: -45px;
            width: 170px;
            z-index: 100;
        }
        .n-hid .n-hov i {
            background: rgba(0, 0, 0, 0) url("/Finances/statics/front/statics/usercenter/images/n-arr.png") no-repeat scroll 0 0;
            display: block;
            height: 15px;
            left: -10px;
            position: absolute;
            top: 47px;
            width: 11px;
        }
        .n-hid:hover .n-hov {
            display: block;
        }

        .m2-userInevst-linkHide{
            position: absolute;
            top: 37px;
            right: -10px;
            width: 426px;
            padding-left: 14px;
            border: 1px solid #bebebe;
            background-color: #fff;
            z-index: 10;
        }
        .m2-userInevst-linkHide h3{
            width:442px;
            height: 34px;
            line-height: 34px;
            color: #4e4e4e;
            font-size:15px;
            text-align: left;
            border-bottom:none;
        }
        .m2-userInevst-linkHide ul{
            zoom: 1;
        }
        .m2-userInevst-linkHide ul:after{display:block;clear:both;visibility:hidden;height:0;content:'-';}
        .m2-userInevst-linkHide ul li{
            float: left;
            width: 190px;
            font-size: 14px;
            height: 28px;
            line-height: 28px;
            text-align: left;
        }
        .m2-userInevst-linkHide ul li span{
            display: inline-block;
            height: 28px;
            line-height: 28px;
            color: #0996cc;
        }
        .m2-userInevst-linkHide-table{
            width: 424px;
        }
        .m2-user-newsmanage table tr td table td{
            text-align: left;
            border:none;
            padding: 5px 0;
            line-height: 24px;
        }
        .m2-userInevst-linkHide-tableHead{
            width:
        }

        .m2-userInevst-linkHide-arr{
            position: absolute;
            top: -15px;
            right: 30px;
            width: 0;
            height: 0;
            border-width: 8px;
            border-style: solid;
            border-color: transparent transparent #fff transparent;
        }
        .m2-userInevst-linkHide-arrBg{
            position: absolute;
            top: -16px;
            right: 30px;
            width: 0;
            height: 0;
            border-width: 8px;
            border-style: solid;
            border-color: transparent transparent #bebebe transparent;
        }
        .m2-userInevst-linkHidetable-unpay{color:#e64648 ;}
        .m2-userInevst-linkHidetable-payed{color:#717171 ;}


        /*----项目名称隐藏部分----*/

        .m2-userInvest-hide{
            display: none;
            z-index: 5;
            position: absolute;
            left: 0px;
            top: 39px;
            width: 328px;
            border:1px solid #e1e1e1;
            font-size: 14px;
            text-align: left;
            background: #fff;
        }
        .m2-userInvest-hide ul{
            padding: 18px 0 0 0;
            padding: 5px 10;
            min-height: 90px;
        }
        .m2-userInvest-hide ul li{
            min-height: 25px;
            width: 275px;
            line-height: 25px;
            padding-left: 15px;
        }
        .m2-userInvest-hideRig{
            position: absolute;
            right: 0;
            top: 0;
            vertical-align: center;
            height: 100%;

        }
        .m2-userInvest-hideRig a{
            display: block;
            width: 34px;
            height: 105px;
            font-size: 14px;
            line-height: 17px;
            text-align: center;
            background-color: #0996cc;
            color: #fff;
            padding-top: 3px;
            vertical-align: center;
            height: 100%;
        }
        .m2-userInvest-hideRig a:link{background-color: #0996cc;}
        .m2-userInvest-hideRig a:visited{background-color: #0996cc;}
        .m2-userInvest-hideRig a:hover{background-color: #0486BC;}
        .m2-userInvest-hideRig a:active{background-color: #0486BC;}

        .m2-userInvest-hide em{
            position: absolute;
            display: block;
            width: 0;
            height: 0;
            border-width: 8px;
            border-style: solid;
        }
        .m2-userInvesthide-arr{
            top:-17px;
            left: 58px;
            border-color: transparent transparent #e1e1e1 transparent;
        }
        .m2-userInvesthide-arrBg{
            top:-16px;
            left: 58px;
            border-color: transparent transparent #fff transparent;
        }
        .b-indHide-tit:hover .m2-userInvest-hide{
            display: block;
        }
    </style>
    <div class="m2-userCentermanage-con">
        <div class="m2-user-recharge">
            <h3><i class="m2-user-record"></i>回款计划</h3>
        </div>
        <div class="m2-manage-search-selector">
            <ul class="m2-manageSearchsel-time">
                <li class="m2-manageSearchsel-link"><span class="m2-manSealink-unsel" href="#">2014年</span></li>
                <li class="m2-manageSearchsel-link"><span class="m2-manSealink-sel" href="#">2015及以后</span></li>
            </ul>
        </div>
        <div class="m2-recharge-mainbody">

            <div class="m2-user-newsmanage">
                <table cellpadding="0" cellspacing="0" border="0" id='table2014'>
                    <tr>
                        <th>年月</th>
                        <th>计划还款总额(元)</th>
                        <th>实际还款总额(元)</th>
                        <th>待还款(元)</th>
                        <th></th>
                    </tr>

                </table>
            </div>
            <div class="m2-user-newsmanage">
                <table cellpadding="0" cellspacing="0" border="0" id='table2015'>
                    <tr>
	                        <th>年月</th>
	                        <th>计划还款总额(元)</th>
	                        <th>实际还款总额(元)</th>
	                        <th>待还款(元)</th>
	                        <th></th>
		                    </tr>
		                </table>
		            </div>
		        </div>
		    </div>
		</div>
		
		<script>
	    $(function(){
	        var listYear = $(".m2-manage-search-selector ul li");
	        var listCon = $(".m2-user-newsmanage");
	        $(listYear[0]).click(function(){
	            $(listCon[0]).fadeIn();
	            $(listCon[1]).hide();
	            $(listYear[0]).find('span').removeClass('m2-manSealink-unsel');
	            $(listYear[0]).find('span').addClass('m2-manSealink-sel');
	            $(listYear[1]).find('span').removeClass('m2-manSealink-sel');
	            $(listYear[1]).find('span').addClass('m2-manSealink-unsel');
	        });
	        $(listYear[1]).click(function(){
	            $(listCon[1]).fadeIn();
	            $(listCon[0]).hide();
	            $(listYear[1]).find('span').removeClass('m2-manSealink-unsel');
	            $(listYear[1]).find('span').addClass('m2-manSealink-sel');
	            $(listYear[0]).find('span').removeClass('m2-manSealink-sel');
	            $(listYear[0]).find('span').addClass('m2-manSealink-unsel');
	        });
	        $(listCon[0]).hide();
	
	        $("a.m2-news-detail").toggle(function(){
	            $(this).html("收起");
	            getDetailData(this);
	        },function(){
	            $(this).parent('td').parent('tr').next('tr.sublist').hide();
	            $(this).html("详情");
	        });
	
	        calculateSumNew(2014);
	        calculateSumNew(2015);
	
	    });
	    //计算年总计
	    function calculateSum(year){
	        var sum1 = 0;
	        var sum2 = 0;
	        var sum3 = 0;
	        $('.data'+year).each(function(){
	            sum1 = numPlus(sum1,Number($(this).find('td').get(1).innerHTML.replace(/,/g,'')));
	            sum2 = numPlus(sum2,Number($(this).find('td').get(2).innerHTML.replace(/,/g,'')));
	            sum3 = numPlus(sum3,Number($(this).find('td').get(3).innerHTML.replace(/,/g,'')));
	        })
	        var tr = '<tr><td>总计：</td>';
	        tr += '<td>'+parseFloat(sum1).toLocaleString()+'元</td>';
	        tr += '<td>'+parseFloat(sum2).toLocaleString()+'元</td>';
	        tr += '<td>'+parseFloat(sum3).toLocaleString()+'元</td>';
	        tr += '<td></td></tr>';
	        $('#table'+year).append(tr);
	    }
	    //计算年总计
	    function calculateSumNew(year){
	        var sum_capital = 0;
	        var sum_interest = 0;
	        var sum_capital_rcv = 0;
	        var sum_interest_rcv = 0;
	        var sum1 = 0;
	        var sum2 = 0;
	        var sum3 = 0;
	        $('.data'+year).each(function(){
	            sum1 = numPlus(sum1,Number($(this).find('td').get(1).innerHTML.replace(/,/g,'')));
	            sum2 = numPlus(sum2,Number($(this).find('td').get(2).innerHTML.replace(/,/g,'')));
	            sum3 = numPlus(sum3,Number($(this).find('td').get(3).innerHTML.replace(/,/g,'')));
	        })
	        var tr = '<tr><td>总计：</td>';
	        tr += '<td title="其中本金：'+sum_capital_rcv+'，利息：'+sum_interest_rcv+'">'+parseFloat(sum1).toLocaleString()+'元</td>';
	        var capital_left = numPlus(sum_capital,-sum_capital_rcv);
	        var interest_left = numPlus(sum_interest,-sum_interest_rcv);
	        tr += '<td title="其中本金：'+capital_left+'，利息：'+interest_left+'">'+parseFloat(sum2).toLocaleString()+'元</td>';
	        tr += '<td title="其中本金：'+sum_capital+'，利息：'+sum_interest+'">'+parseFloat(sum3).toLocaleString()+'元</td>';
	        tr += '<td></td></tr>';
	        $('#table'+year).append(tr);
	    }
	    //取单月回款明细
	    function getDetailData(dom){
	
	        var date = $(dom).data('date');
	        if($(dom).data('flag') != 1){
	            $.ajax({
	                url:"/usercenter-Investcontrol-getMonthlyPaymentAjax",
	                data:{date:date},
	                success:function(data){
	                    obj = eval('('+data+')');
	                    makeTr(dom,obj);
	                }
	            });
	        }else{
	            $(dom).parent('td').parent('tr').next('tr.sublist').show();
	        }
	    }
	
	    function makeTr(dom,obj){
	        var hover = "<div class='n-hid'><div class='n-hov'><i></i><p>借款人在有能力且有意愿提前归还本金的时候，提前清偿了所有的剩余本金，则投资者的本金及借款期间所产生的收益会及时返还投资者的账户余额。</p></div></div>";
	        if(obj){
	            var sum_income = 0;
	            var sum_payed = 0;
	            var sum_income_capital = 0;
	            var sum_real_capital = 0;
	            var sum_income_interest = 0;
	            var sum_receive_capital = 0;
	            var sum_receive_interest = 0;
	            var tr = '<tr class="m2-news-addInfo sublist"><td colspan="5"><table cellpadding="0" cellspacing="0" border="0" class="m2-user-newsContent">'
	                    +'<tr><td style="width:140px;padding:0 4px;">项目名称</td><td>计划还款时间</td><td>实际还款时间</td><td>计划还款金额</td><td>实际还款金额</td><td>待还款</td><td>类型</td><td>还款状态</td><td>详情</td>'
	                    +'</tr>';
	            for(var i in obj){
	                tr += '<tr><td style="padding:0 4px;">'+obj[i]['borrow_name']+'</td>';
	                tr += '<td>'+obj[i]['date']+'</td>';
	                tr += '<td>'+obj[i]['paydate']+'</td>';
	                tr += '<td title="其中本金：'+parseFloat(obj[i]['income_capital']).toLocaleString()+',利息：'+parseFloat(obj[i]['income_interest']).toLocaleString()+'">'+parseFloat(obj[i]['income']).toLocaleString()+'</td>';
	                +'</div>'
	                tr += '<td title="其中本金：'+parseFloat(obj[i]['receive_capital']).toLocaleString()+',利息：'+parseFloat(obj[i]['receive_interest']).toLocaleString()+'">'+parseFloat(obj[i]['receive_income']).toLocaleString()+'</td>';
	                tr+='<td>'+obj[i]['real_capital']+'</td>';
	                if(obj[i]['receive_capital']>0&&obj[i]['receive_interest']==0){
	                    tr += '<td>本金</td>';
	                }else if(obj[i]['receive_capital']==0&&obj[i]['receive_interest']>0){
	                    tr += '<td>利息</td>';
	                }else if(obj[i]['receive_capital']>0&&obj[i]['receive_interest']>0){
	                    tr += '<td>本息</td>';
	                }else{
	                    tr += '<td>--</td>';
	                }
	                tr += '<td><i class="m2-news-'+obj[i]['class']+'"></i>'+obj[i]['status']+'</td>';
	                tr += '<td><div class="b-indHide tog_add" onclick="det_toggle('+obj[i]['id']+',$(this))"><div class="b-indHide-tit" style="line-height:45px" >'+'详情'+'</div>';
	                tr += '</tr>';
	                sum_income = numPlus(sum_income,Number(obj[i]['income']));
	                sum_income_capital = numPlus(sum_income_capital,Number(obj[i]['income_capital']));
	                sum_income_interest = numPlus(sum_income_interest,Number(obj[i]['income_interest']));
	                sum_real_capital = numPlus(sum_real_capital,Number(obj[i]['real_capital']));
	                sum_payed = numPlus(sum_payed,Number(obj[i]['receive_income']));
	                sum_receive_capital = numPlus(sum_receive_capital,Number(obj[i]['receive_capital']));
	                sum_receive_interest = numPlus(sum_receive_interest,Number(obj[i]['receive_interest']));
	            }
	            tr += '<tr><td>总计：</td><td></td><td></td>';
	            tr += '<td title="其中本金：'+parseFloat(sum_income_capital).toLocaleString()+',利息：'+parseFloat(sum_income_interest).toLocaleString()+'">'+parseFloat(sum_income).toLocaleString()+'元</td>';
	            tr += '<td title="其中本金：'+parseFloat(sum_receive_capital).toLocaleString()+',利息：'+parseFloat(sum_receive_interest).toLocaleString()+'">'+parseFloat(sum_payed).toLocaleString()+'元</td>';
	            tr += '<td title="其中本金：'+parseFloat(sum_income_capital).toLocaleString()+',利息：'+parseFloat(sum_income_interest).toLocaleString()+'">'+parseFloat(sum_real_capital).toLocaleString()+'元</td>';
	            tr += '<td>--</td>';
	            tr += '<td></td><td></td></tr>';
	            tr += '</table></td></tr>';
	
	            $(dom).parent('td').parent('tr').after(tr);
	            $(dom).parent('td').parent('tr').next('tr.sublist').show();
	            $(dom).data('flag',1);
	        }
	    }
	    function det_toggle(investDetailId,target){
	        if(target.hasClass('tog_add')){
	            remove_tr(target);
	            getBorrowListByBorrowId(investDetailId,target);
	            target.addClass('tog_rem').removeClass('tog_add');
	            target.children('.b-indHide-tit').html('隐藏');
	        }else if(target.hasClass('tog_rem')){
	            target.addClass('tog_add').removeClass('tog_rem');
	            remove_tr(target);
	            target.children('.b-indHide-tit').html('详情');
	        }
	    }
	    function getBorrowListByBorrowId(investDetailId,target){
	        var th = target;
	        $.ajax({
	            url:"/usercenter-investcontrol-getInvestDetaile",
	            data:{investDetailId:investDetailId},
	            success:function(data){
	                obj = eval('('+data+')');
	                generateBorrowTable(obj,th);
	            }
	        });
	    }
	    function  generateBorrowTable(obj,th){
	        for(var i=0; i<obj.length;i++){
	            var div='<div class="m2-userInevst-linkHide" style="width:560px;">'
	                    +'<div class="m2-userInevst-linkHide-arrBg"></div>'
	                    +'<div class="m2-userInevst-linkHide-arr"></div>'
	                    +'<h3>还款计划表</h3>'
	                    +'  <table class="m2-userInevst-linkHide-table" cellpadding="0" cellspacing="0">'
	                    +'      <tr class="m2-userInevst-linkHide-tableHead">'
	                    +'          <td style="width:132px;text-align:center">预计支付时间</td>'
	                    +'          <td style="width:90px;text-align:center">实际支付时间</td>'
	                    +'          <td style="width:110px;text-align:center">计划支付金额</td>'
	                    +'          <td style="width:110px;text-align:center">实际支付金额</td>'
	                    +'          <td style="width:120px;text-align:center">支付状态</td>'
	                    +'      </tr>'
	                    +'  </table>'
	                    +' </div>'
	                    +'</div>';
	            th.append(div);
	
	            for(var i=0; i<obj.length;i++){
	                var tr = '<tr class="teses paylist-tr showmark-'+obj[i]['class']+'">';
	                tr += '<td class="b-indTd" style="text-align:center">'+obj[i]['date']+'</td>';
	                tr += '<td class="b-indTd" style="text-align:center">'+obj[i]['paydate']+'</td>';
	                if(obj[i]['extramoney']==0){
	                    tr += '<td style="width:130px;text-align:center">'+obj[i]['income']+'</td>';
	                }else{
	                    tr += '<td style="width:130px;text-align:center">'+obj[i]['income']+'+<span style="color:#E25353">'+obj[i]['extramoney']+'</span></td>';
	                }
	                if(obj[i]['repayment_status']==0){
	                    tr += '<td style="width:130px;text-align:center">'+obj[i]['receive_income']+'</td>';
	                }else{
	                    if(obj[i]['extramoney_real']==0){
	                        tr += '<td style="width:130px;text-align:center">'+obj[i]['receive_income']+'</td>';
	                    }else{
	                        tr += '<td style="width:130px;text-align:center">'+obj[i]['receive_income']+'+<span style="color:#E25353">'+obj[i]['extramoney_real']+'</span></td>';
	                    }
	                }
	                tr += '<td class="m2-userInevst-linkHidetable-'+obj[i]['class']+'" style="text-align:center">'+obj[i]['status']+'</td>';
	                tr += '</tr>';
	                $('.m2-userInevst-linkHide-table').append(tr);
	
	            }
	        }
	    }
	
	    function remove_tr(t){
	        t.children('.m2-userInevst-linkHide').remove();
	        t.parent().parent().siblings('tr').children('td').children('.b-indHide').children('.m2-userInevst-linkHide').remove();
	        t.parent().parent().siblings('tr').children('td').children('.b-indHide').children('.b-indHide-tit').html('详情');
	    }
	
	    function numPlus(num1,num2){
	        var sq1,sq2,m;
	        try{sq1=num1.toString().split(".")[1].length;} catch(e){sq1=0;}
	        try{sq2=num2.toString().split(".")[1].length;} catch(e){sq2=0;}
	        m=Math.pow(10,Math.max(sq1,sq2));
	        return Math.round(( num1 * m + num2 * m ) / m * 100)/100;
	    }
	</script>
	</body>
</html>