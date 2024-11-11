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
       				          if(document.formAdd.name.value=="")
		          {
		             alert("请输入结算类型");return false;
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
				<li class="active">结算类型信息添加</li>
			</ol>
		</div>
			<form action="<%=path %>/jiesuantype!add.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="4">&nbsp;添加结算类型&nbsp;</td>
						</tr>
						    <tr>
							    <th width="50%">
							         结算类型
							    </th>
							    <td width="50%">
							        	<input type="text" id="name" name="name" />
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
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
