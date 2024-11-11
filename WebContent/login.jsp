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
    
     <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
 <script type="text/javascript" src="<%=path %>/js/public.js"></script>

<script type="text/javascript">

   function check1()
 {                                                                                         
     if(document.loginForm.userName.value=="")
	 {
	 	alert("请输入用户名");
		document.loginForm.userName.focus();
		return false;
	 }
	 if(document.loginForm.userPw.value=="")
	 {
	 	alert("请输入密码");
		document.loginForm.userPw.focus();
		return false;
	 }
	 document.getElementById("indicator").style.display="block";
	 loginService.login(document.loginForm.userName.value,document.loginForm.userPw.value,0,callback);
 }

 function callback(data)
 {
    document.getElementById("indicator").style.display="none";
    if(data=="no")
    {
        alert("用户名或密码错误");
    }
    if(data=="yes")
    {
        alert("通过验证,系统登录成功");
        window.location.href="<%=path %>/loginSuccess.jsp";
    }
 }
 
</script>
</head>
<body>
<div class="container">
    <div class="line">
        <div class="x4 x4-move ">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form name="loginForm" id="loginForm" method="POST" action="">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>自来水分公司水费系统(管理员)</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="userName" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="userPw" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                </div>
                <div style="padding:30px;">
                <img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/>
                <input type="button" class="button button-block bg-main text-big input-big" onClick="check1()" value="登录">
                </div>
                <div class="panel-foot text-center" target="_blank"><a href="/ssh_shuifei_sys/userlogin.jsp">用户角色登录</a></div>     
            </div>
            </form>  
              
        </div>
    </div>
</div>

</body>
</html>