<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>head</title>
</head>
<body>
	<!-- headerStart -->
<header>
<div class="m2-commonTop-con">
    <div class="m2-commonTop">
        <div class="m2-commonTop-left">
            <div class="m2-commonTop-tel"><i></i>4006&nbsp;-&nbsp;777&nbsp;-&nbsp;518</div>
            <div class="m2-commonTop-service" style="padding-left:0;"><span style="float:left;">客服：</span>
                <div style="float:left;display:inline-block;width:92px;height:22px;padding:6px 0 13px 0;"></div>
            </div>
            <div class="m2-commonEwm">
                <span class="m2-commonEwm-tit">关注我们：</span>
                <div class="m2-commonEwmwx">
                    <i class="m2-commonEwmicon"></i>
                    <div class="m2-commonEwmhid">
                        <em class="m2-commonEwmhid-arr"></em>
                        <em class="m2-commonEwmhid-arrBg"></em>
                        <b></b>
                        <span>扫一扫<br>关注爱钱帮订阅号</span>
                    </div>
                </div>
                <div class="m2-commonEwmwb">
                    <i class="m2-commonEwmicon" onclick='window.open("http://weibo.com/iqianbang")'></i>
                </div>
            </div>
        </div>
        <div class="m2-commonTop-right">
            <div class="m2-commonTop-link">
                <ul>
                    <!-- 论坛导航栏全部关闭 -->
                    <!--<li class="m2-commonTop-btn" style="display: none" id="bbs"><a id="bbslogin" target="_blank">论坛</a></li>-->
                    <li class="m2-commonTop-btn"><a href="register.html" target="_blank">注册</a></li>
                    <li class="m2-commonTop-btn"><a href="login.html#login_callback=/index" target="_blank" style="border-right:none;">登录</a></li>
                    <li class="m2-commonTop-btn"><a href="company_finance.html" id="cfpage" style="border-right:none;width: 50px;">企业理财</a></li>                </ul>
            </div>
            <div class="m2-commonTop-app" onclick='window.open("appdownload.html")' style="cursor:pointer;">
                <a href="" class="m2-commonTop-and"></a>
                <a href="" class="m2-commonTop-ios"></a>
                <span>app下载入口</span>
            </div>
        </div>
    </div>
</div>
<!--  用户登陆后，（部分用户）导航栏显示论坛选项、现在全部关闭
<script type="text/javascript">
    $(function () {
       $('#bbslogin').click(function(){
    	   var w = window.open(); 
			$.ajax({
				type:"GET",
				url :"/api-bbslogin",
				success:function(msg){
					var obj = eval('('+msg+')');
		        	var obj = eval(obj);
		        	if (obj.status == 1){
		        		w.location = obj.message;
					}
				}
			});
       });
       var _uid = Number();
       var _all_uid = Array(5277,320,25893,77960,70760,4762,36256,59960,126250,75980,4039,68689,133118,185);
       function in_array(uid,array){
			for(var i in array){
				if(array[i] == uid){
					$("#bbs").attr("style","display:block");
				}
			}
       }
       in_array(_uid,_all_uid);
    });
</script>
-->
</div>
<div class="m2-commonNav-con">
    <div class="m2-commonNav-box">
        <div class="m2-commonLogo">
            <a class="m2-comImg-logo" href="/Finances/views/front/index.jsp">
                <img src="/Finances/statics/front/statics/newcommon/images/log.png" title="亿信金融投资理财平台logo" alt="亿信金融标识">
            </a>
            <a class="m2-conImg-slogan" href="">
                <img src="/Finances/statics/front/statics/newcommon/images/m2-sloganHS.png" title="徽商银行投资理财托管" alt="">
            </a>
        </div>
        <div class="m2-commonNav">
            <ul class="m2-commonNavul-fir" data_page='onepage'>
                <!--  <li class="m2-commonNav-fir"><a href="http://huifu.iqianbang.com" target="_blank" >汇付版本</a></li>-->
                <li class="m2-commonNav-fir"><a href="/Finances/views/front/index.jsp" id="onepage">首页</a></li>
                <li class="m2-commonNav-fir"><a href="/Finances/views/front/invest.jsp" id="twopage">我要投资</a></li>
                <li class="m2-commonNav-fir"><a href="/Finances/views/front/membermall.jsp" id="sevenpage">会员商城</a></li>
                <li class="m2-commonNav-fir"><a href="/Finances/views/front/user/usercenter.jsp" id="threepage">我的账户</a></li>
                <li class="m2-commonNav-fir"><a href="/Finances/views/front/guarantee.jsp" id="fourpage">安全保障</a></li>
                <li class="m2-commonNav-fir"><a href="/Finances/views/front/about.jsp" id="fivepage">关于我们</a></li>
                <!-- <li class="m2-commonNav-fir"><a href="guide.html">新手引导</a></li> -->
                <li class="m2-commonNav-fir"><a href="/Finances/views/front/activity.jsp" id="sixpage">活动专区</a></li>
            </ul>
        </div>
    </div>
</div>
</header>

<style>
    .vIVR{display:none}
</style>
<script>
    var page=$(".m2-commonNavul-fir").attr("data_page");
    $("#"+page).parent().css("borderBottom","2px solid #ff6666");
    var queuename = '30017180006';
    function callback() {
        $('#tel').val($('#phonenumber').val());
        call();
    }
    setCallResponse = function (json) {
        var obj = eval('(' + json + ')');
        if (obj['description']) {
            $('#callBack-codeErr').css('display', 'block');
            $('#ivrSecurityCode').val('');
            getCode();
            setTimeout(function () {
                $('#callBack-codeErr').css('display', 'none');
            }, 3000);
        }
    }
	</script>
<!-- headerEnd -->
</body>
</html>