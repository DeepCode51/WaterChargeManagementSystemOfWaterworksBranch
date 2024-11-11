<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="<%=path%>/js/WdatePicker.js" type="text/javascript"></script>   
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap-theme.min.css"/>
		<script src="<%=path%>/bootstrap3/js/jquery-1.11.2.min.js"></script>
		<script src="<%=path%>/bootstrap3/js/bootstrap.min.js"></script>
		<script language="javascript">
       function check()
       {
       				          if(document.formAdd.username.value=="")
		          {
		             alert("请输入用户名");return false;
		          }
		          if(document.formAdd.userpwd.value=="")
		          {
		             alert("请输入密码");return false;
		          }
		          if(document.formAdd.identity.value=="")
		          {
		             alert("请输入身份");return false;
		          }
					 
          return true;
       }   
    </script>   
	</head>

	<body>
			<div class="col-lg-12">
		<div>
			<ol class="breadcrumb">
				<li><span class="glyphicon glyphicon-home"></span>&nbsp;<a
					href="#">主页</a></li>
				<li class="active">管理员信息修改</li>
			</ol>
		</div>
			<form action="<%=path %>/admin!edit.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="2">&nbsp;修改管理员&nbsp;</td>
						</tr>
						    <tr>
							    <th width="50%">
							         用户名
							    </th>
							    <td width="50%">
							        	<input type="text" id="username" name="username" value="${requestScope.Admin.username}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         密码
							    </th>
							    <td width="50%">
							        	<input type="text" id="userpwd" name="userpwd" value="${requestScope.Admin.userpwd}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         身份
							    </th>
							    <td width="50%">
							          <input type="text" id="identity" name="identity" value="${requestScope.Admin.identity}"/>
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       		<input type="hidden" name="id" value="${requestScope.Admin.id}"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
				</table>
			</form>
		</div>			
   </body>
</html>
