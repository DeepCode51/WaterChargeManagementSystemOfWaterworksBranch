<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>自来水分公司水费管理系统</title>  
    <link rel="stylesheet" href="<%=path %>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path %>/css/admin.css">
    <style type="text/css">
	    body{
			background:#68a5f8;
		}
    </style>
    <script src="<%=path %>/js/jquery.js"></script>
    <script src="<%=path %>/js/pintuer.js"></script>  

</head>
<body>
<div class="container">
    <div class="line" style="margin-top: 150px;">
        <div class="xs6 xm4 xs3-move xm4-move">
            <form name="loginForm" id="loginForm" method="post" action="<%=path%>/admin!userlogin.action">
            <div class="panel">
                <div class="panel-head"><strong>自来水分公司水费系统(用户)</strong></div>
                <div class="panel-body" style="padding:30px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <span class="icon icon-user"></span>
                            <input type="tel" class="input" name="userName" placeholder="您登记的账号" data-validate="required:请填写账号" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <span class="icon icon-key"></span>
                            <input type="password" class="input" name="userPw" placeholder="您登记的密码" data-validate="required:请填写密码" />
                        </div>
                    </div>
                </div>
                <div class="panel-foot text-center"><button type="submit" class="button button-block bg-main text-big" value="立即登录">立即登录</button></div>
            	<div class="panel-foot text-center" target="_blank"><a href="/ssh_shuifei_sys">管理员角色登录</a> </div>
            </div>
            </form>
            
            <div class="text-right text-small text-gray padding-top"></div>
        </div>
    </div>

</div>

</body>
</html>