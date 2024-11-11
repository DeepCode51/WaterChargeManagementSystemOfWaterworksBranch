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
		          if(document.formAdd.shuifeimoney.value=="")
		          {
		             alert("请输入水费金额");return false;
		          }
		          if(document.formAdd.beizhu.value=="")
		          {
		             alert("请输入备注信息");return false;
		          }
		          if(document.formAdd.status.value=="")
		          {
		             alert("请输入缴费状态");return false;
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
				<li class="active">收费信息修改</li>
			</ol>
		</div>
			<form action="<%=path %>/shoufei!edit.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="2">&nbsp;修改收费信息&nbsp;</td>
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
							        	<input type="text" id="shijian" name="shijian" value="${requestScope.Shoufei.shijian}" readonly="readonly"/>
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
							    	<input type="text" id="shuifeivalue" name="shuifeivalue" value="${requestScope.Shoufei.shuifeivalue}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							    </td>
								</tr>									
						    <tr>
							    <th width="50%">
							         水费金额
							    </th>
							    <td width="50%">
							        	<input type="text" id="shuifeimoney" name="shuifeimoney" value="${requestScope.Shoufei.shuifeimoney}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         备注信息
							    </th>
							    <td width="50%">
							        	<input type="text" id="beizhu" name="beizhu" value="${requestScope.Shoufei.beizhu}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         缴费状态
							    </th>
							    <td width="50%">
							        	<input type="text" id="status" name="status" value="${requestScope.Shoufei.status}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       		<input type="hidden" name="id" value="${requestScope.Shoufei.id}"/>
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
