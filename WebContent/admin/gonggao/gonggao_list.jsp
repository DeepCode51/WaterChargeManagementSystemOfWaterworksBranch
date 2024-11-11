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
           function GonggaoDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/gonggao!del.action?id="+id;
               }
           }
           
           function GonggaoEdit(id)
           {
				window.location.href="<%=path %>/gonggao!toedit.action?id="+id;
           }
           
           function GonggaoAdd()
           {
                 var url="<%=path %>/admin/gonggao/gonggao_add.jsp";

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
				<li class="active">公告信息管理</li>
			</ol>
		</div>

		<div class="row search"  style="margin-bottom:30px;">
			<div class="col-md-10">
				<form  class="form-inline" action="<%=path%>/gonggao!listpage.action" method="post">
				<ul class="list-inline">
				  <li>公告标题<input type="text" class="form-control" name="biaoti" value="" placeholder="请输入要查询的公告标题..."></li>
				  <li>
							<button class="btn btn-default" type="submit">
								<span class="glyphicon glyphicon-search"></span>&nbsp;查询
							</button> 
				  </li>
				</ul>
				</form>
			</div>
			<div class="col-md-2">
			</div>
		</div>
		
		<div>
				<table class="table table-hover  table-bordered table-striped" style="margin-bottom: 0px;">
					<tr>
						<td>ID</td>
						<td>标题</td>
						<td width="50%">内容</td>
						<td>发布时间</td>
						<td>操作</td>
			        </tr>	
					<c:forEach items="${gonggaoList}" var="Gonggao">
					<tr>
						
						<td bgcolor="#FFFFFF" align="center">
							${Gonggao.id}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Gonggao.biaoti}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Gonggao.neirong}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Gonggao.shijian}
						</td>
						<td>
							<c:if test="${sessionScope.userType==0}">
								<input type="button" value="删除" class="btn btn-info btn-xs" onclick="GonggaoDel(${Gonggao.id})"/>
								<input type="button" value="修改" class="btn btn-info btn-xs" onclick="GonggaoEdit(${Gonggao.id})"/>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</table>

					
				
		</div>
	</div>
	</body>
</html>
