<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%> 
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%  
    String empName = (String) session.getAttribute("empName");  
    pageContext.setAttribute("currentUser", org.apache.shiro.SecurityUtils.getSubject().getPrincipal().toString());  
%>    
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>后台首页</title>
    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/statics/back/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/statics/back/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/statics/back/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/statics/back/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/back/static/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/statics/back/static/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/back/static/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="${pageContext.request.contextPath}/statics/back/static/js/plugins/pace/pace.min.js"></script>
    
	

	<link rel="Shortcut  Icon" href="${pageContext.request.contextPath}/statics/other/lco/smalllog.png">
    <link href="${pageContext.request.contextPath}/statics/back/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/back/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/back/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/back/static/css/style.css?v=4.1.0" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/statics/back/static/bootstrapValidator/js/bootstrapValidator.min.js"></script>
	<link href="${pageContext.request.contextPath}/statics/back/static/bootstrapValidator/css/bootstrapValidator.min.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/front/js/jquery.form.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#pwdForm')
		        .bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {
		                 OldEpassword: {
		                     message:'密码无效',
		                     validators: {
		                         notEmpty: {
		                             message: '密码不能为空'
		                         },
		                         stringLength: {
		                             min: 1,
		                             max: 30,
		                             message: '用户名长度必须在6到30之间'
		                         },
		                         threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
		                         remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
		                             url: '${pageContext.request.contextPath}/back/selePwd',//验证地址
		                             message: '原密码不正确',//提示消息
		                             delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
		                             type: 'POST',//请求方式
		                             /**自定义提交数据，默认值提交当前input value*/
		                              data: {
		                            	  eid:$("#pwdForm #eid").val(),
		                            	  OldEpassword:$("#pwdForm #OldEpassword").val(),
		                              }
		                         },
		                         regexp: {
		                             regexp: /^[a-zA-Z0-9_\.]+$/,
		                             message: '密码只能由字母、数字、点和下划线组成'
		                         }
		                     }
		                 },
		                 NewEpassword: {
		                     message:'密码无效',
		                     validators: {
		                         notEmpty: {
		                             message: '密码不能为空'
		                         },
		                         stringLength: {
		                             min: 6,
		                             max: 30,
		                             message: '用户名长度必须在6到30之间'
		                         },
		                         different: {//不能和用户名相同
		                             field: 'OldEpassword',
		                             message: '不能和原密码相同'
		                         },
		                         regexp: {
		                             regexp: /^[a-zA-Z0-9_\.]+$/,
		                             message: '密码只能由字母、数字、点和下划线组成'
		                         }
		                     }
		                 },
		                 SureEpassword: {
		                     message: '密码无效',
		                     validators: {
		                         notEmpty: {
		                             message: '确认密码不能为空'
		                         },
		                         stringLength: {
		                             min: 6,
		                             max: 30,
		                             message: '确认密码长度必须在6到30之间'
		                         },
		                         identical: {//相同
		                             field: 'NewEpassword',
		                             message: '两次密码不一致'
		                         },
		                         different: {//不能和用户名相同
		                             field: 'OldEpassword',
		                             message: '不能和原密码相同'
		                         },
		                         regexp: {//匹配规则
		                             regexp: /^[a-zA-Z0-9_\.]+$/,
		                             message: '密码只能由字母、数字、点和下划线组成。'
		                         }
		                     }
		                 },
		            }
		        })
		        .on('success.form.bv', function(e) {
		        	$("#upPwd").modal('hide');
		            // Prevent form submission
		            e.preventDefault();
					alert("sdfgsdfgh");
		            // Get the form instance
		            var $form = $(e.target);
		
		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');
		            var eid =$("#pwdForm #eid").val();
		            var epassword = $("#pwdForm #SureEpassword").val();
		            alert(eid);
		            alert(epassword);
		            if(epassword !="" || epassword !=null && eid !="" || eid!=null){
		            	var url = "${pageContext.request.contextPath }/back/updatePwd";
		        		$.post(
		        			url,
		        			{
		        				eid:eid,
		        				epassword:epassword,
		        			},
		        			function(data){
		        				//后台返回int类型的数据
		        				if(data>0){
		        					//新增成功，下面是后台框架的提示
		        					parent.layer.alert('修改密码成功');
		        				}else{
		        					//新增失败
		        					parent.layer.alert('修改密码失败');
		        				}
		        			},
		        			"text"
		        		);		
		              	
		            }
		        });
		});
</script>
	<script  type="text/javascript">
		//修改密码弹窗
	function upPwdShow(){
		$("#upPwd #OldEpassword").val('');
		$("#upPwd #NewEpassword").val('');
		$("#upPwd #SureEpassword").val('');
		
		$("#upPwd").modal('show');
	}
	</script>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="${sessionScope.employee.eimage}" width='90px' height='80px'/></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">欢迎您:${sessionScope.employee.ename}</strong></span>
                                <span class="text-muted text-xs block">
                                	<shiro:user>
                                		您的权限为:${sessionScope.employee.role.rename}
                                	</shiro:user>
                                <b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem"  onclick="upPwdShow()">修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/back/adminlogout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+</div>
                    </li>
                     <shiro:hasPermission name="管理设置">
                          <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">用户管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                           <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/back/toRole" data-index="0">权限管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="index_v2.jsp">会员账户管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/use.jsp">用户列表</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/contact.jsp">联系我们</a></li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/back/toEmploye">员工列表</a>
                            </li><li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/record.jsp">管理员操作列表</a>
                            </li>
                        </ul>
                    </li>   	
                     </shiro:hasPermission>
                    <li>
                        <a class="J_menuItem" href="layouts.jsp">
                        	<i class="fa fa-columns"></i> 
                        	<span class="nav-label">系统维护管理(待定)</span>
                        </a>
                    </li>
                    <shiro:hasPermission name="首页管理">
                    	<li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">首页管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<shiro:hasPermission name="轮播图管理">
                        		<li>
                               		 <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/Indexpic.jsp">轮播图管理</a>
                            	</li>
                        	</shiro:hasPermission>
                        	<li>

                                <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/about.jsp">关于我们管理</a>
                            </li>
                            <li>

                                <a class="J_menuItem" href="${pageContext.request.contextPath}/back/toRedmoney">红包管理</a>
                            </li>
                             <li>

                                <a class="J_menuItem" href="${pageContext.request.contextPath}/back/toUservouch">代金券管理</a>
                            </li>
                            <shiro:hasPermission name="联系管理">
                            	<li>
                               	 	<a class="J_menuItem" href="graph_flot.jsp">联系管理</a>
                           		</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="合作机构管理">
                            	<li>
                                	<a class="J_menuItem" href="graph_morris.jsp">合作机构管理</a>
                            	</li>
                            </shiro:hasPermission>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/activity.jsp">活动专区</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/notice.jsp">公告管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/Cooorganiz.jsp">合作机构</a>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/noticeType.jsp">公告类型管理</a>
                            </li>
                        </ul>
                    </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="贷款管理">
                    	<li>
                        <a href="mailbox.jsp">
	                        <i class="fa fa-envelope"></i> 
	                        <span class="nav-label">贷款管理</span>
	                        <span class="label label-warning pull-right">16</span>
                        </a>
                        <ul class="nav nav-second-level">
                            <shiro:hasPermission name="贷款管理与审核">
                            	 <li>
                            	 	<a class="J_menuItem" href="mailbox.jsp">贷款管理与审核</a>
                           		 </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="额度管理与审核">
                            	<li>
                            		<a class="J_menuItem" href="mail_detail.jsp"> 额度管理与审核</a>
                           		</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="还款管理与审核">
                            	<li>
                            		<a class="J_menuItem" href="mail_compose.jsp">还款管理与审核</a>
                            	</li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="资金管理">
                    	<li>
                        <a href="#">
                        	<i class="fa fa-edit"></i> 
                        	<span class="nav-label">资金管理</span>
                        	<span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">

                            <li><a class="J_menuItem" href="form_basic.jsp">后台充值</a>
                            </li>
                            <li><a class="J_menuItem" href="form_validate.jsp">充值管理与审核</a>
                            </li>
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/back/toWithdrawals">提现管理与审核</a>
                            </li>
                            <li><a class="J_menuItem" href="form_wizard.jsp">银行卡管理</a>
                            </li>
                              <li><a class="J_menuItem" href="${pageContext.request.contextPath}/back/toUserlevel">成长等级</a>
                            </li>
                            

                        	<shiro:hasPermission name="后台充值管理">
                        		<li>	
                        			<a class="J_menuItem" href="form_basic.jsp">后台充值</a>
                            	</li>
                        	</shiro:hasPermission>
                        	<shiro:hasPermission name="充值管理与审核">
                        		<li>
                        			<a class="J_menuItem" href="form_validate.jsp">充值管理与审核</a>
                            	</li>
                        	</shiro:hasPermission>
                            <shiro:hasPermission name="提现管理与审核">
                            	<li>
                            		<a class="J_menuItem" href="form_advanced.jsp">提现管理与审核</a>
                           		</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="银行卡管理">
                            	<li>
                            		<a class="J_menuItem" href="form_wizard.jsp">银行卡管理</a>
                            	</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="文件上传管理">
                            	<li>

                                <a href="#">文件上传 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="form_webuploader.jsp">百度WebUploader</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_file_upload.jsp">DropzoneJS</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_avatar.jsp">头像裁剪上传</a>
                                    </li>
                                </ul>
                            </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="编辑器管理">
                            	<li>
                                	<a href="#">编辑器 <span class="fa arrow"></span></a>
                                	<ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="form_editors.jsp">富文本编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_simditor.jsp">simditor</a>
                                    </li>
                                    <li><a class="J_menuItem" href="form_markdown.jsp">MarkDown编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="code_editor.jsp">代码编辑器</a>
                                    </li>
                                </ul>
                            	</li>
                            </shiro:hasPermission>
                            </ul>
                           </li>
                    	</shiro:hasPermission>
                    	<shiro:hasPermission name="资金记录管理">
                    		<li>
	                        <a href="#">
	                        	<i class="fa fa-desktop"></i> 
	                        	<span class="nav-label">资金记录管理</span>
	                        	<span class="fa arrow"></span>
	                        </a>
                        <ul class="nav nav-second-level">
                        	<shiro:hasPermission name="资金使用明细管理">
                        		<li>
                        			<a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/Moneyrecord.jsp">资金使用明细管理</a>
                            	</li>
                        	</shiro:hasPermission>
                        	<shiro:hasPermission name="投资记录与排行管理">
                        		<li>
                        			<a class="J_menuItem" href="profile.jsp"></a>
                            	</li>
                        	</shiro:hasPermission>
                        </ul>
                    </li>
                    	</shiro:hasPermission>
                    <shiro:hasPermission name="会员管理">
                    	<li>
                        <a href="#">
                        	<i class="fa fa-desktop"></i> 
                        	<span class="nav-label">会员管理</span>
                        	<span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                       		<shiro:hasPermission name="会员与积分管理">
                       			<li>
                       				<a class="J_menuItem" href="contacts.jsp">会员与积分管理</a>
                           		</li>	
                       		</shiro:hasPermission>
                       		<shiro:hasPermission name="资料认证管理与审核">
                       			<li>
                           			<a class="J_menuItem" href="profile.jsp">资料认证管理与审核</a>
                           		</li>
                       		</shiro:hasPermission>
                       		 </li>
                              <li><a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/vipdetail.jsp">会员明细管理</a>
                            </li>
                        </ul>
                    </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="认证管理">
                    	 <li>
                        <a href="#">
                        	<i class="fa fa-flask"></i> 
                        	<span class="nav-label">认证审核管理</span>
                        	<span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<shiro:hasPermission name="身份认证">
                        		<li>
                        			<a class="J_menuItem" href="typography.jsp">身份认证</a>
                            	</li>
                        	</shiro:hasPermission>
                        	<shiro:hasPermission name="邮箱认证">
                        		<li>
                        			<a class="J_menuItem" href="typography.jsp">邮箱认证</a>
                            	</li>
                        	</shiro:hasPermission>
                        	<shiro:hasPermission name="资本资料认证">
                        		<li>
                        			<a class="J_menuItem" href="typography.jsp">资本资料认证</a>
                            	</li>
                        	</shiro:hasPermission>
                        	<shiro:hasPermission name="用户基本信息审核">
                        		<li>
                        			<a class="J_menuItem" href="typography.jsp">用户基本信息审核</a>
                                </li>
                        	</shiro:hasPermission>
                        	<shiro:hasPermission name="认证资料审核">
                        		<li>
                        			<a class="J_menuItem" href="tabs_panels.jsp">认证资料审核</a>
                            	</li>
                        	</shiro:hasPermission>
                            <shiro:hasPermission name="额度审核">
                            	<li>
                            		<a class="J_menuItem" href="notifications.jsp">额度审核</a>
                           		</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="会员申请审核">
                            	<li>
	                            	<a class="J_menuItem" href="badges_labels.jsp">会员申请审核</a>
                            	</li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="统计管理">
                    	<li>
                        <a href="#">
                        	<i class="fa fa-table"></i> 
                        	<span class="nav-label">统计管理</span>
                        	<span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<shiro:hasPermission name="登录统计">
                        		 <li>
                        		 	<a class="J_menuItem" href="table_basic.jsp">登录统计</a>
                            	</li>
                        	</shiro:hasPermission>
                            <shiro:hasPermission name="投资统计">
                            	<li>
                            		<a class="J_menuItem" href="table_data_tables.jsp">投资统计</a>
                            	</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="投标统计">
                            	<li>
                            		<a class="J_menuItem" href="table_jqgrid.jsp">投标统计</a>
                           		</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="借款统计">
                            	<li>
                            		<a class="J_menuItem" href="table_foo_table.jsp">借款统计</a>
                            	</li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="网站统计">
                            	<li>
                            		<a class="J_menuItem" href="table_bootstrap.jsp">网站统计
                                	<span class="label label-danger pull-right">奖励统计</span></a>
                            	</li>
                            </shiro:hasPermission>
                        </ul>
                    </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="报表分析管理">
                    	<li>
                        <a href="#">
                        	<i class="fa fa-picture-o"></i> 
                        	<span class="nav-label">报表分析管理</span>
                        	<span class="fa arrow"></span>
                        </a>
                    </li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="奖励与费用管理">
                    	<li>
	                        <a class="J_menuItem" href="css_animation.jsp">
	                        	<i class="fa fa-magic"></i> 
	                        	<span class="nav-label">奖励与费用管理</span>
	                        </a>
                    	</li>
                    </shiro:hasPermission>
                    
                    <li>
                        <a href="#">
                        	<i class="fa fa-desktop"></i> 
	                        	<span class="nav-label">投资管理</span>
	                        	<span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li>
                        		 <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/bid.jsp">投标管理</a>
                           </li>
                           <li>
                        		 <a class="J_menuItem" href="${pageContext.request.contextPath}/views/back/fabiao.jsp">发标管理</a>
                           </li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.jsp">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="profile.jsp" class="pull-left">
                                            <img alt="image" class="img-circle" src="/Finances/statics/back/static/img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="profile.jsp" class="pull-left">
                                            <img alt="image" class="img-circle" src="/Finances/statics/back/static/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="mailbox.jsp">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="mailbox.jsp">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="profile.jsp">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="notifications.jsp">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="hidden-xs">
                            <a href="index_v1.jsp" class="J_menuItem" data-index="0">
                            	<i class="fa fa-cart-arrow-down"></i> 购买
                            </a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="${pageContext.request.contextPath}/views/back/rightindex.jsp">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${pageContext.request.contextPath}/back/adminlogout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i>退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/views/back/rightindex.jsp" frameborder="0" data-id="index_v1.jsp" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 <a href="http://www.zi-han.net/" target="_blank">zihan's blog</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="#tab-3">
                        项目进度
                    </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>

                        <div>

                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a1.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">

                                        据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        写的好！与您分享
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a4.jpg">
                                    </div>

                                    <div class="media-body">
                                        国外极限小子的炼成！这还是亲生的吗！！
                                        <br>
                                        <small class="text-muted">昨天 8:37</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a8.jpg">
                                    </div>
                                    <div class="media-body">

                                        一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        这哥们的新视频又来了，创意杠杠滴，帅炸了！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        最近在补追此剧，特别喜欢这段表白。
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="/Finances/statics/back/static/img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        我发起了一个投票 【你认为下午大盘会翻红吗？】
                                        <br>
                                        <small class="text-muted">星期一 8:37</small>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> 最新任务</h3>
                            <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>市场调研</h4> 按要求接收教材；

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>可行性报告研究报上级批准 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>设计阶段</h4>
                                    <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
                                    项目进度报告(Project Progress Report)
                                    <div class="small">已完成： 22%</div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>建设阶段 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>

                        </ul>

                    </div>
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->
        <!--mini聊天窗口开始-->
        <div class="small-chat-box fadeInRight animated">

            <div class="heading" draggable="true">
                <small class="chat-date pull-right">
                    2015.9.1
                </small> 与 Beau-zihan 聊天中
            </div>

            <div class="content">

                <div class="left">
                    <div class="author-name">
                        Beau-zihan <small class="chat-date">
                        10:02
                    </small>
                    </div>
                    <div class="chat-message active">
                        你好
                    </div>

                </div>
                <div class="right">
                    <div class="author-name">
                        游客
                        <small class="chat-date">
                            11:24
                        </small>
                    </div>
                    <div class="chat-message">
                        你好，请问H+有帮助文档吗？
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Beau-zihan
                        <small class="chat-date">
                            08:45
                        </small>
                    </div>
                    <div class="chat-message active">
                        有，购买的H+源码包中有帮助文档，位于docs文件夹下
                    </div>
                </div>
                <div class="right">
                    <div class="author-name">
                        游客
                        <small class="chat-date">
                            11:24
                        </small>
                    </div>
                    <div class="chat-message">
                        那除了帮助文档还提供什么样的服务？
                    </div>
                </div>
                <div class="left">
                    <div class="author-name">
                        Beau-zihan
                        <small class="chat-date">
                            08:45
                        </small>
                    </div>
                    <div class="chat-message active">
                        1.所有源码(未压缩、带注释版本)；
                        <br> 2.说明文档；
                        <br> 3.终身免费升级服务；
                        <br> 4.必要的技术支持；
                        <br> 5.付费二次开发服务；
                        <br> 6.授权许可；
                        <br> ……
                        <br>
                    </div>
                </div>


            </div>
            <div class="form-chat">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control"> <span class="input-group-btn"> <button
                        class="btn btn-primary" type="button">发送
                </button> </span>
                </div>
            </div>

        </div>
        <div id="small-chat">
            <span class="badge badge-warning pull-right">5</span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>

            </a>
        </div>
        <!--mini聊天窗口结束-->
    </div>
    
    <!-- 修改密码弹窗 -->
		<div class="modal fade" id="upPwd" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">密码修改</h4>
					</div>
					<div class="modal-body">
						<!-- 新增系别 -->
						<form id="pwdForm" class="form-horizontal m-t">
							<div class="form-group">
								<label for="urlName" class="control-label col-sm-3">登录名</label>
								<div class="col-sm-6">
									<input type="hidden" id="eid" name="eid"
										value="${sessionScope.employee.eid}"> 
									<input type="hidden"
										id="ephone" name="ephone" value="${sessionScope.employee.ephone}">
									<input name="" class="form-control" id="ename"
										value="${sessionScope.employee.ename}" disabled="disabled">
								</div>
							</div>
							<div class="form-group">
								<label for="urlName" class="control-label col-sm-3">旧密码</label>
								<div class="col-sm-6">
									<input type="password" name="OldEpassword" class="form-control"
										id="OldEpassword">
								</div>
							</div>
							<div class="form-group">
								<label for="urlName" class="control-label col-sm-3">新密码</label>
								<div class="col-sm-6">
									<input type="password" name="NewEpassword" class="form-control"
										id="NewEpassword">
								</div>
							</div>
							<div class="form-group">
								<label for="urlName" class="control-label col-sm-3">确认密码</label>
								<div class="col-sm-6">
									<input type="password" name="SureEpassword" class="form-control"
										id="SureEpassword">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-default" data-dismiss="modal">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
								</button>
								<button type="submit" id="btn_submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>

</html>
