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
       				          if(document.formAdd.userId.value=="")
		          {
		             alert("请输入用户Id");return false;
		          }
		          if(document.formAdd.biaono.value=="")
		          {
		             alert("请输入水表编号");return false;
		          }
		          if(document.formAdd.jiesuantype.value=="")
		          {
		             alert("请输入结算方式");return false;
		          }
		          if(document.formAdd.biaovalue.value=="")
		          {
		             alert("请输入水表度数");return false;
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
				<li class="active">水表信息修改</li>
			</ol>
		</div>
			<form action="<%=path %>/shuibiao!edit.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="2">&nbsp;修改水表&nbsp;</td>
						</tr>
						    <tr>
							    <th width="50%">
							         用户Id
							    </th>
							    <td width="50%">
							        	<input type="text" id="userId" name="userId" readonly="readonly" value="${requestScope.Shuibiao.userId}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         水表编号
							    </th>
							    <td width="50%">
							        	<input type="text" id="biaono" name="biaono" value="${requestScope.Shuibiao.biaono}" readonly="readonly"/>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         结算方式
							    </th>
							    <td width="50%">
							        <select id="jiesuantype" name="jiesuantype">
										<c:forEach items="${jiesuantypeList}" var="Jiesuantype">
											<option value="${Jiesuantype.name}">${Jiesuantype.name}</option>
										</c:forEach>
						        	</select>	
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         水表度数
							    </th>
							    <td width="50%">
							        	<input type="text" id="biaovalue" name="biaovalue" value="${requestScope.Shuibiao.biaovalue}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         备注
							    </th>
							    <td width="50%">
							        	<input type="text" id="beizhu" name="beizhu" value="${requestScope.Shuibiao.beizhu}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         水表状态
							    </th>
							    <td width="50%">
								   	<select id="status" name="status">
								   		<option value="0" selected="selected">正常</option>
								   		<option value="1">异常</option>
								   	</select>
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       		<input type="hidden" name="id" value="${requestScope.Shuibiao.id}"/>
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
