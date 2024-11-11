<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
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
           function UserDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/user!del.action?id="+id;
               }
           }
           
           function UserEdit(id)
           {
				window.location.href="<%=path %>/user!toedit.action?id="+id;
           }
           
           function UserAdd()
           {
                 var url="<%=path %>/admin/user/user_add.jsp";

				 window.location.href=url;
           }
       </script>
	</head>

	<body>
		<div class="col-lg-12">
		<div>
			<ol class="breadcrumb">
				<li><span class="glyphicon glyphicon-home"></span>&nbsp;<a
					href="#">主页</a></li>
				<li class="active">用户信息管理</li>
			</ol>
		</div>

		<div class="row search"  style="margin-bottom:30px;">
			<div class="col-md-10">
				<form  class="form-inline" action="<%=path%>/user!listpage.action" method="post">
				<ul class="list-inline">
				  <li>用户编号<input type="text" class="form-control" name="loginname" value="" placeholder="请输入要查询的用户编号..."></li>
				  <li>
							<button class="btn btn-default" type="submit">
								<span class="glyphicon glyphicon-search"></span>&nbsp;查询
							</button> 
				  </li>
				</ul>
				</form>
			</div>
			<div class="col-md-2">
				<button type="button" style="float: right;margin-right:30px;" class="btn btn-primary"
					onclick="javascript:window.location.href='<%=path%>/user!toadd.action'">添加</button>
			</div>
		</div>
		
		<div>
				<table class="table table-hover  table-bordered table-striped" style="margin-bottom: 0px;">
					<tr>
						<td>ID</td>
						<td>用户编号</td>
						<td>密码</td>
						<td>真实姓名</td>
						<td>地址</td>
						<td>电话</td>
						<td>社区区域</td>
						<td>用户状态</td>
						<td>操作</td>
			        </tr>	
					<c:forEach items="${userList}" var="User">
					<tr>
						
						<td bgcolor="#FFFFFF" align="center">
							${User.id}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${User.loginname}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${User.pwd}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${User.realname}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${User.address}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${User.tel}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${User.bumen}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${User.status}
						</td>
						<td>
								<input type="button" value="删除" class="btn btn-info btn-xs" onclick="UserDel(${User.id})"/>
								<input type="button" value="修改" class="btn btn-info btn-xs" onclick="UserEdit(${User.id})"/>
						</td>
					</tr>
					</c:forEach>
				</table>

					
				
		</div>
	</div>
	</body>
</html>
