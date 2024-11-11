<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<script src="<%=path%>/js/WdatePicker.js" type="text/javascript"></script>   
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap-theme.min.css"/>
		<script src="<%=path%>/bootstrap3/js/jquery-1.11.2.min.js"></script>
		<script src="<%=path%>/bootstrap3/js/bootstrap.min.js"></script>
		
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		
        <script language="javascript">
            function check()
            {
                 var userPwReal="${sessionScope.admin.userpwd}";
                 if(document.formPw.userPw.value !=userPwReal)
                 {
                     alert("原密码不正确");
                     return ;
                 }
                 
                 if(document.formPw.userPw1.value =="")
                 {
                     alert("新密码不能空");
                     return ;
                 }
                 if(document.formPw.userPw1.value != document.formPw.userPw2.value)
                 {
                     alert("两次输入的密码不一致");
                     return ;
                 }
                 
                 document.getElementById("indicator").style.display="block";
                 loginService.adminPwEdit(document.formPw.userPw1.value,callback);
            }
            function callback(data)
            {
                document.getElementById("indicator").style.display="none";
                alert("修改成功");
            }
        </script>
	</head>

	<body>
			<form method="post" action="<%=path %>/userPwEdit.action" name="formPw">
			<table class="table table-hover table-striped">
				<tr bgcolor="#EEF4EA">
				    <td colspan="2" bgcolor='#FFFFFF' class='title'><span>密码修改</span></td>
				</tr>
				<tr>
				    <td width="25%"  align="right">
				         登录名：
				    </td>
				    <td width="75%">
				        <input type="text" value="${sessionScope.admin.username }" name="userName" size="20" disabled="disabled"/>
				    </td>
				</tr>
				<tr>
				    <td width="25%"  align="right">
				        原密码：
				    </td>
				    <td width="75%">
				        <input type="password" name="userPw" id="userPw" size="22"/>
				    </td>
				</tr>
				<tr>
				    <td width="25%"  align="right">
				         新密码：
				    </td>
				    <td width="75%">
				        <input type="password" id="userPw1" name="userPw1" size="22"/>
				    </td>
				</tr>
				<tr>
				    <td width="25%"  align="right">
				        确认密码：
				    </td>
				    <td width="75%">
				           <input type="password" name="userPw2" id="userPw2" size="22"/>
				    </td>
				</tr>
				<tr>
				    <td width="25%"  align="right">
				        &nbsp;
				    </td>
			        <td width="75%">
			             <input type="button" class="btn btn-success" value="修改" onclick="check()"/>
			             &nbsp;&nbsp;&nbsp;
			             <input type="reset" value="重置" class="btn btn-warning"/>
			             <img id="indicator" src="<%=path %>/images/loading.gif" alt="Loading..." style="display:none"/>
			        </td>
				</tr>
			</table>
			</form>
   </body>
</html>
