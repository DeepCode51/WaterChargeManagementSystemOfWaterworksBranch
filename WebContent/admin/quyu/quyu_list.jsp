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
           function QuyuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/quyu!del.action?id="+id;
               }
           }
           
           function QuyuEdit(id)
           {
				window.location.href="<%=path %>/quyu!toedit.action?id="+id;
           }
           
           function QuyuAdd()
           {
                 var url="<%=path %>/admin/quyu/quyu_add.jsp";

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
				<li class="active">社区区域信息管理</li>
			</ol>
		</div>

		<div class="row search"  style="margin-bottom:30px;">
			<div class="col-md-10">
				<form  class="form-inline" action="<%=path%>/quyu!listpage.action" method="post">
				<ul class="list-inline">
				  <li>社区区域编号<input type="text" class="form-control" name="no" value="" placeholder="请输入要查询的社区区域编号..."></li>
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
					onclick="javascript:window.location.href='<%=path%>/quyu!toadd.action'">添加</button>
			</div>
		</div>
		
		<div>
				<table class="table table-hover  table-bordered table-striped" style="margin-bottom: 0px;">
					<tr>
						<td>ID</td>
						<td>社区区域编号</td>
						<td>社区区域名称</td>
						<td>社区区域说明</td>
						<td>操作</td>
			        </tr>	
					<c:forEach items="${quyuList}" var="Quyu">
					<tr>
						
						<td bgcolor="#FFFFFF" align="center">
							${Quyu.id}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Quyu.no}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Quyu.name}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Quyu.detail}
						</td>
						<td>
								<input type="button" value="删除" class="btn btn-info btn-xs" onclick="QuyuDel(${Quyu.id})"/>
								<input type="button" value="修改" class="btn btn-info btn-xs" onclick="QuyuEdit(${Quyu.id})"/>
						</td>
					</tr>
					</c:forEach>
				</table>

					
				
		</div>
	</div>
	</body>
</html>
