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
           function ShoufeiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/shoufei!del.action?id="+id;
               }
           }
           
           function ShoufeiEdit(id)
           {
				window.location.href="<%=path %>/shoufei!toedit.action?id="+id;
           }
           
            function ShoufeiPrint(id)
           {
				window.location.href="<%=path %>/shoufei!toshow.action?id="+id;
           }
                     
           function ShoufeiAdd()
           {
                 var url="<%=path %>/admin/shoufei/shoufei_add.jsp";

				 window.location.href=url;
           }
       </script>
       					<script>
function printpage(){
	window.print();
}
</script>
	</head>

	<body>
		<div class="col-lg-12">
		<div>
			<ol class="breadcrumb">
				<li><span class="glyphicon glyphicon-home"></span>&nbsp;<a
					href="#">主页</a></li>
				<li class="active">收费信息管理</li>
			</ol>
		</div>

		<div class="row search"  style="margin-bottom:30px;">
			<div class="col-md-10">
				<form  class="form-inline" action="<%=path%>/shoufei!listpage.action" method="post">
				<ul class="list-inline">
				  <li>用户编号<input type="text" class="form-control" name="userno" value="" placeholder="请输入要查询的用户编号..."></li>
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
					onclick="javascript:window.location.href='<%=path%>/shoufei!toadd.action'">添加</button>
			</div>
		</div>
		
		<div>
				<table class="table table-hover  table-bordered table-striped" style="margin-bottom: 0px;">
					<tr>
						<td>ID</td>
						<td>用户编号</td>
						<td>水表编号</td>
						<td>创建时间</td>
						<td>水费价格</td>
						<td>结算方式</td>
						<td>水费金额</td>
						<td>备注信息</td>
						<td>缴费状态</td>
						<td>操作</td>
			        </tr>	
					<c:forEach items="${shoufeiList}" var="Shoufei">
					<tr>
						
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.id}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.userno}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.shuibiaono}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.shijian}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.shuijia}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.jiesuantype}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.shuifeimoney}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							${Shoufei.beizhu}
						</td>
						<td bgcolor="#FFFFFF" align="center">
							<c:if test="${Shoufei.status == 0}">未缴费</c:if>
							<c:if test="${Shoufei.status == 1}">已缴费</c:if>
						</td>
						<td>
								<input type="button" value="删除" class="btn btn-info btn-xs" onclick="ShoufeiDel(${Shoufei.id})"/>
								<input type="button" value="修改" class="btn btn-info btn-xs" onclick="ShoufeiEdit(${Shoufei.id})"/>
								<input type="button" value="打印小票" class="btn btn-info btn-xs" onclick="ShoufeiPrint(${Shoufei.id})"/>
						</td>
					</tr>
					</c:forEach>
				</table>

					
				
		</div>
	</div>
	</body>
</html>
