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
			<h3>
				自来水分公司水费管理系统
			</h3>
		</div>
	</div>
	
    <div class="line" style="margin-top: 50px;margin-bottom: 50px;">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div class="panel">
                <div class="panel-head"><strong>水费详情</strong></div>
                <div class="panel-body" style="padding:30px;">
                    <div class="form-group">
                        <a href="<%=path %>/shoufei!toadd.action">水费详情</a>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                        	<a href="<%=path%>/userlogin.jsp">退出系统</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>	
	
	
	
	<div style="text-align:center;">
		<p>自来水分公司水费管理系统</p>
	</div>
</body>
</html>