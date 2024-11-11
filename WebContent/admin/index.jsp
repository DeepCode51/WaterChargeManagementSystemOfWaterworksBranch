<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>后台管理中心</title>
<link rel="stylesheet" href="<%=path%>/css/pintuer.css">
<link rel="stylesheet" href="<%=path%>/css/admin.css">
<script src="<%=path%>/js/jquery.js"></script>
<script>
	function logout()
	{
	   if(confirm("确定要退出本系统吗??"))
	   {
		   window.parent.location="<%=path%>/login.jsp";
		}
	}
</script>
</head>
<body style="background-color:#f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				自来水分公司水费管理系统
			</h1>
		</div>
		<div class="head-l">
		您好： <c:if test="${sessionScope.userType==0}">admin </c:if> 
		<a href="#" onclick='javascript:window.parent.location="<%=path%>/login.jsp"'> 退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<c:if test="${sessionScope.userType==0}">
			<h2>
				<span class="icon-user"></span>系统管理
			</h2>
			<ul>
				<li><a href="<%=path %>/admin/userinfo/userPw.jsp"
					target="right"><span class="icon-caret-right"></span>密码修改</a></li>
				<li><a href="<%=path %>/admin!listpage.action"
					target="right"><span class="icon-caret-right"></span>管理员管理</a></li>
				<li><a href="<%=path %>/admin!toadd.action"
					target="right"><span class="icon-caret-right"></span>添加管理员</a></li>
			</ul>
			<h2>
				<span class="icon-user"></span>用户信息管理
			</h2>
			<ul>
				<li><a href="<%=path %>/user!listpage.action"
					target="right"><span class="icon-caret-right"></span>用户信息管理</a></li>
				<li><a href="<%=path %>/user!toadd.action"
					target="right"><span class="icon-caret-right"></span>添加用户信息</a></li>
			</ul>
			<h2>
				<span class="icon-user"></span>区域信息列表
			</h2>
			<ul>
				<li><a href="<%=path %>/quyu!listpage.action"
					target="right"><span class="icon-caret-right"></span>区域信息管理</a></li>
				<li><a href="<%=path %>/quyu!toadd.action"
					target="right"><span class="icon-caret-right"></span>区域信息添加</a></li>
			</ul>
			<h2>
				<span class="icon-user"></span>水表结算类型维护
			</h2>
			<ul>
				<li><a href="<%=path %>/jiesuantype!listpage.action"
					target="right"><span class="icon-caret-right"></span>水表结算类型维护</a></li>
				<li><a href="<%=path %>/jiesuantype!toadd.action"
					target="right"><span class="icon-caret-right"></span>水表结算类型添加</a></li>
			</ul>
			<h2>
				<span class="icon-user"></span>水费单价信息维护
			</h2>
			<ul>
				<li><a href="<%=path %>/shuifeijiage!listpage.action"
					target="right"><span class="icon-caret-right"></span>水费单价维护</a></li>
				<li><a href="<%=path %>/shuifeijiage!toadd.action"
					target="right"><span class="icon-caret-right"></span>水费单价添加</a></li>
			</ul>
			<h2>
				<span class="icon-pencil-square-o"></span>水表信息管理
			</h2>
			<ul>
				<li><a href="<%=path%>/shuibiao!listpage.action"
					target="right"><span class="icon-caret-right"></span>水表信息管理</a></li>
				<li><a href="<%=path %>/shuibiao!toadd.action"
					target="right"><span class="icon-caret-right"></span>水表信息添加</a></li>
			</ul>
			<h2>
				<span class="icon-pencil-square-o"></span>水费信息管理
			</h2>
			<ul>
				<li><a href="<%=path%>/shoufei!listpage.action"
					target="right"><span class="icon-caret-right"></span>水费信息管理</a></li>
				<li><a href="<%=path %>/shoufei!toadd.action"
					target="right"><span class="icon-caret-right"></span>水费信息添加</a></li>
			</ul>
		</c:if>
		<c:if test="${sessionScope.userType==1}">
			<h2>
				<span class="icon-pencil-square-o"></span>水表信息管理
			</h2>
			<ul>
				<li><a href="<%=path%>/shuibiao!listpage.action"
					target="right"><span class="icon-caret-right"></span>水表信息管理</a></li>
				<li><a href="<%=path %>/shuibiao!toadd.action"
					target="right"><span class="icon-caret-right"></span>水表信息添加</a></li>
			</ul>
			<h2>
				<span class="icon-pencil-square-o"></span>水费信息管理
			</h2>
			<ul>
				<li><a href="<%=path%>/shoufei!listpage.action"
					target="right"><span class="icon-caret-right"></span>水费信息管理</a></li>
				<li><a href="<%=path %>/shoufei!toadd.action"
					target="right"><span class="icon-caret-right"></span>水费信息添加</a></li>
			</ul>
		</c:if>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a href="{:U('Index/info')}" target="right" class="icon-home">首页</a>
		</li>
	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0"
			src="<%=path%>/admin/userinfo/readme.jsp" name="right" width="100%"
			height="100%"></iframe>
	</div>
	<div style="text-align:center;">
		<p>自来水分公司水费管理系统</p>
	</div>
</body>
</html>