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
				<li class="active">收费信息打印</li>
			</ol>
		</div>
			<form action="<%=path %>/shoufei!edit.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="2">&nbsp;收费信息打印&nbsp;</td>
						</tr>
						    <tr>
							    <th width="50%">
							         用户编号
							    </th>
							    <td width="50%">
							    	${requestScope.Shoufei.userno}
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         水表编号
							    </th>
							    <td width="50%">
							    	${requestScope.Shoufei.shuibiaono}
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         创建时间
							    </th>
							    <td width="50%">
							    	${requestScope.Shoufei.shijian}
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         水费价格(元)
							    </th>
							    <td width="50%">
							    	${requestScope.Shoufei.shuijia}
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         结算方式
							    </th>
							    <td width="50%">
							    	${requestScope.Shoufei.jiesuantype}
							    </td>
								</tr>		
						    <tr>
							    <th width="50%">
							         水费金额
							    </th>
							    <td width="50%">
							    	${requestScope.Shoufei.shuifeimoney}
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         备注信息
							    </th>
							    <td width="50%">
							    	${requestScope.Shoufei.beizhu}
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         缴费状态
							    </th>
							    <td width="50%">
							    								<c:if test="${Shoufei.status == 0}">未缴费</c:if>
									<c:if test="${Shoufei.status == 1}">已缴费</c:if>
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						    				<button type="button" style="float: right;margin-right:30px;" class="btn btn-primary"
					onclick="printpage()">打印</button>		
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
