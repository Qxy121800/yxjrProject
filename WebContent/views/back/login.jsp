<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<jsp:include page="/statics/back/static/jsp/init.jsp"></jsp:include>
<html>
	<head>
		<link rel="Shortcut  Icon" href="/Finances/statics/other/lco/smalllog.png">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>亿信金融</title>
		<link href="${pageContext.request.contextPath}/statics/back/assets/css/style.css" rel="stylesheet" type="text/css" />
		<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/statics/back/assets/js/jquery-1.8.3.min.js"></script> --%>
		<!-- <title>Insert title here</title> -->
		<script  type="text/javascript">
	        function reloadValidateCode(){
	            $("#validateCodeImg").attr("src","<%=basePath%>/back/validateCode?data=" + new Date() + Math.floor(Math.random()*24));
	        }
	        
	        //判断用户名
	        function empName(){
	        	var name =$("#name").val();
	        	if(name==null || name==''){
	        		$("#nameNull").show();
	        	}
	        	else{
	        		$("#nameNull").hide();
	        	}
	        }
	        
	       function empPassword(){
	    	   var password =$("#password").val();
	        	if(password==null || password==''){
	        		$("#passwordNull").show();
	        	} 
	        	else{
	        		$("#passwordNull").hide();
	        	}
	       } 
	       
	       function empImgcode(){
	    	   var imgcode =$("#imgcode").val();
	    	   var url = "${pageContext.request.contextPath}/back/SureCode";
	        	if(imgcode==null || imgcode==''){
	        		$("#imgcodeNull").show();
	        	}else{
	        		$.post(
			    			url,
			    			{
			    				imgcode:imgcode,
			    			},
			    			function(data){
			    				//后台返回int类型的数据
			    				if(data<0){
			    					$("#imgcodeNull").hide();
			    					$("#imgcodeError").show();
			    				}else{
			    					$("#imgcodeNull").hide();
			    					$("#imgcodeError").hide();
			    				}
			    			},
			    			"text"
			    		);	
	        	}
	       } 
	       function login(){
	    	   var name =$("#name").val();
	    	   var password =$("#password").val();
	    	   var imgcode =$("#imgcode").val();
	    	   if(name==null || name==''){
	        		$("#nameNull").show();
	        	}
	        	else if(password==null || password==''){
	        		$("#nameNull").hide();
	        	}
	        	else if(imgcode==null || imgcode==''){
	        		$("#imgcodeNull").show();
	        	}
	    	   else{
	    		   $("#nameNull").hide();
	    		   $("#passwordNull").hide();
	    		   $("#imgcodeNull").hide();
	    		   location.href="<%=path%>/back/loginindex?name="+name+"&password="+password+"&imgcode="+imgcode;
	    	   }
	    	   
	       }
    </script>
	</head>
	<body onLoad="sendRequest()" >
	<div class="videozz"></div>
	<!--  
		<video  autoplay muted loop poster="/Finances/statics/back/assets/images/fallba1ck.jpg">
			<source src="/Finances/statics/back/assets/images/mov.mp4">		
			你的游览器不支持video支持
		</video>
	-->
		<div class="box">
			<div class="box-a">
			    <div class="m-2">
			          <div class="m-2-1">
			            <form  method="post">
			                <div class="m-2-2">
			                   <input type="text" name="name" id="name" placeholder="请输入账号" onblur="empName()"/>
			                </div>
			                <div id="nameNull" style="color: red;display:none">用户名不能为空!</div>
			                <div class="m-2-2">
			                   <input type="password" name="password" id="password" placeholder="请输入密码" onblur="empPassword()"/>
			                </div>
			                <div id="passwordNull" style="color: red;display:none">密码不能为空!</div>
			                <div class="m-2-2-1">
			                   <input type="text" name="imgcode" id="imgcode" placeholder="请输入验证码" onblur="empImgcode()"/>
			                   <img id="validateCodeImg" src="<%=basePath%>/back/validateCode" onclick="reloadValidateCode()"/>&nbsp;&nbsp;
			                </div>
			                <div>
			                	<span id="imgcodeNull" style="color: red;display:none">验证码不能为空!</span>
			                	<span id="imgcodeError" style="color: red;display:none">验证码错误!</span>
			                </div>
			                <div class="m-2-2">
			                   <button type="button" value="登录" onclick="login()"/> 登录
			                   	   <h4 style="color: red;">${sessionScope.message_login}</h4>
	                  	  	<%
		                    	if(session.getAttribute("message_login")!=null){
		                    		session.removeAttribute("message_login");
		                            
		                    	}
	                    	%>
			                </div>
			            </form>
			        </div>
			    </div>
			    <div class="m-5"> 
				    <div id="m-5-id-1"> 
					    <div id="m-5-2"> 
					    	<div id="m-5-id-2"></div> 
					    	<div id="m-5-id-3"></div> 
					    </div> 
				    </div> 
			    </div>   
			    <div class="m-10"></div>
			    <div class="m-xz7"></div>
			    <div class="m-xz8 xzleft"></div>
			    <div class="m-xz9"></div>
			    <div class="m-xz9-1"></div>
			    <div class="m-x17 xzleft"></div>
			    <div class="m-x18"></div>
			    <div class="m-x19 xzleft"></div>
			    <div class="m-x20"></div>  
			    <div class="m-8"></div>
			    <div class="m-9">
			    	<div class="masked1" id="sx8">亿信金融</div>
			    </div> 
			    <div class="m-11">
			    	<div class="m-k-1"><div class="t1"></div></div>
			        <div class="m-k-2"><div class="t2"></div></div>
			        <div class="m-k-3"><div class="t3"></div></div>
			        <div class="m-k-4"><div class="t4"></div></div>
			        <div class="m-k-5"><div class="t5"></div></div>
			        <div class="m-k-6"><div class="t6"></div></div>
			        <div class="m-k-7"><div class="t7"></div></div>
			    </div>   
			    <div class="m-14">
			    	<div class="ss"></div>
			    </div>
			    <div class="m-15-a">
				    <div class="m-15-k">
				    	<div class="m-15xz1">
				            <div class="m-15-dd2"></div>
				        </div>
				    </div>
			    </div>
			    <div class="m-16"></div>
			    <div class="m-17"></div>
			    <div class="m-18 xzleft"></div>
			    <div class="m-19"></div>
			    <div class="m-20 xzleft"></div>
			    <div class="m-21"></div>
			    <div class="m-22"></div>
			    <div class="m-23 xzleft"></div>
			    <div class="m-24" id="localtime"></div>
		    </div>
		</div>
		<script src="/Finances/statics/back/assets/js/common.min.js"></script>
		<div style="text-align:center;"></div>
	</body>
</html>