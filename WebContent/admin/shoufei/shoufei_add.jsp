<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
String path = request.getContextPath();
SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd- HH-mm-ss");
String sGenCode = sdfTime.format(new Date());
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
       				          if(document.formAdd.userno.value=="")
		          {
		             alert("请输入用户编号");return false;
		          }
		          if(document.formAdd.shuibiaono.value=="")
		          {
		             alert("请输入水表编号");return false;
		          }
		          if(document.formAdd.shijian.value=="")
		          {
		             alert("请输入创建时间");return false;
		          }
		          if(document.formAdd.shuijia.value=="")
		          {
		             alert("请输入水费价格");return false;
		          }
		          if(document.formAdd.jiesuantype.value=="")
		          {
		             alert("请输入结算方式");return false;
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
				<li class="active">收费信息添加</li>
			</ol>
		</div>
			<form action="<%=path %>/shoufei!add.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="4">&nbsp;添加收费信息&nbsp;</td>
						</tr>
						    <tr>
							    <th width="50%">
							         用户编号
							    </th>
							    <td width="50%">
						        	<select id="userno" name="userno">
										<c:forEach items="${userList}" var="User">
											<option value="${User.loginname}">${User.loginname}_${User.realname}</option>
										</c:forEach>
						        	</select>								    
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         水表编号
							    </th>
							    <td width="50%">
							    	<select id="shuibiaono" name="shuibiaono">
										<c:forEach items="${shuibiaoList}" var="Shuibiao">
											<option value="${Shuibiao.biaono}">${Shuibiao.biaono}</option>
										</c:forEach>
						        	</select>	
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         创建时间
							    </th>
							    <td width="50%">
							        	<input type="text" id="shijian" name="shijian" value="<%=sGenCode%>"/>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         水费价格(元)
							    </th>
							    <td width="50%">
							    <select id="shuijia" name="shuijia">
							    	<c:forEach items="${shuifeijiageList}" var="Shuifeijiage">
							    		<option value="${Shuifeijiage.jiage}">${Shuifeijiage.jiage}</option>
							    	</c:forEach>
							    </select>
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
							    	<input type="text" id="shuifeivalue" name="shuifeivalue" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         备注信息
							    </th>
							    <td width="50%">
							        	<input type="text" id="beizhu" name="beizhu" />
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						    	<input type="hidden" id="shuifeimoney" name="shuifeimoney" value="0"/>
						    	<input type="hidden" id="status" name="status" value="0"/>
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       <a href="<%=path%>/admin/index1.jsp">返回首页</a>
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
