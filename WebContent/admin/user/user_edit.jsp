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
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap-theme.min.css"/>
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap-datetimepicker.css" />
		<script src="<%=path%>/bootstrap3/js/jquery-1.11.2.min.js"></script>
		<script src="<%=path%>/bootstrap3/js/bootstrap.min.js"></script>
		<script language="javascript">
       function check()
       {
       				          if(document.formAdd.loginname.value=="")
		          {
		             alert("请输入用户编号");return false;
		          }
		          if(document.formAdd.pwd.value=="")
		          {
		             alert("请输入密码");return false;
		          }
		          if(document.formAdd.realname.value=="")
		          {
		             alert("请输入真实姓名");return false;
		          }
		          if(document.formAdd.address.value=="")
		          {
		             alert("请输入地址");return false;
		          }
		          if(document.formAdd.tel.value=="")
		          {
		             alert("请输入电话");return false;
		          }
		          if(document.formAdd.bumen.value=="")
		          {
		             alert("请输入社区区域");return false;
		          }
		          if(document.formAdd.status.value=="")
		          {
		             alert("请输入用户状态");return false;
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
				<li class="active">用户信息修改</li>
			</ol>
		</div>
			<form action="<%=path %>/user!edit.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="2">&nbsp;修改用户信息&nbsp;</td>
						</tr>
						    <tr>
							    <th width="50%">
							         用户编号
							    </th>
							    <td width="50%">
							        	<input type="text" id="loginname" name="loginname" value="${requestScope.User.loginname}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         密码
							    </th>
							    <td width="50%">
							        	<input type="text" id="pwd" name="pwd" value="${requestScope.User.pwd}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         真实姓名
							    </th>
							    <td width="50%">
							        	<input type="text" id="realname" name="realname" value="${requestScope.User.realname}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         地址
							    </th>
							    <td width="50%">
							        	<input type="text" id="address" name="address" value="${requestScope.User.address}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         电话
							    </th>
							    <td width="50%">
							        	<input type="text" id="tel" name="tel" value="${requestScope.User.tel}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         社区区域
							    </th>
							    <td width="50%">
							        <select id="bumen" name="bumen">
										<c:forEach items="${quyuList}" var="Quyu">
											<option value="${Quyu.name}">${Quyu.no}_${Quyu.name}</option>
										</c:forEach>
						        	</select>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         用户状态
							    </th>
							    <td width="50%">
							        	<input type="text" id="status" name="status" value="${requestScope.User.status}" />
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       		<input type="hidden" name="id" value="${requestScope.User.id}"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
				</table>
			</form>
		</div>	
		<script src="<%=path%>/bootstrap3/js/bootstrap-datetimepicker.js"></script>
		<script src="<%=path%>/bootstrap3/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script type="text/javascript">
		    $('.form_datetime').datetimepicker({
		        language:  'zh',
				format: 'yyyy-mm-dd'
		    });
		</script> 		
   </body>
</html>
