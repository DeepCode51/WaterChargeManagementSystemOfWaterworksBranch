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
		<script src="<%=path%>/js/WdatePicker.js" type="text/javascript"></script>   
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap-theme.min.css"/>
		<link rel="stylesheet" href="<%=path%>/bootstrap3/css/bootstrap-datetimepicker.css" />	
		<script src="<%=path%>/bootstrap3/js/jquery-1.11.2.min.js"></script>
		<script src="<%=path%>/bootstrap3/js/bootstrap.min.js"></script>
		<script language="javascript">
       function check()
       {
       				          if(document.formAdd.biaoti.value=="")
		          {
		             alert("请输入标题");return false;
		          }
		          if(document.formAdd.neirong.value=="")
		          {
		             alert("请输入内容");return false;
		          }
		          if(document.formAdd.shijian.value=="")
		          {
		             alert("请输入发布时间");return false;
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
				<li class="active">公告信息修改</li>
			</ol>
		</div>
			<form action="<%=path %>/gonggao!edit.action" name="formAdd" method="post">
				  <table class="table table-hover  table-bordered table-striped">
						<tr>
							<th colspan="2">&nbsp;修改公告信息&nbsp;</td>
						</tr>
						    <tr>
							    <th width="50%">
							         标题
							    </th>
							    <td width="50%">
							        	<input type="text" id="biaoti" name="biaoti" value="${requestScope.Gonggao.biaoti}" />
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         内容
							    </th>
							    <td width="50%">
							        	<textarea rows="5" cols="120" id="neirong" name="neirong">${requestScope.Gonggao.neirong}</textarea>
							    </td>
								</tr>	
						    <tr>
							    <th width="50%">
							         发布时间
							    </th>
							    <td width="50%">
							        							 <div class="input-group date form_datetime col-md-3" data-date-format="dd MM yyyy - HH:ii p">
		                    <input class="form-control" size="16" type="text"   id="shijian" name="shijian" value="${requestScope.Gonggao.shijian}" readonly>
							<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
		                </div>								        	
							    </td>
								</tr>	
						<tr>
						    <th width="50%">
						        &nbsp;
						    </th>
						    <td width="50%">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       		<input type="hidden" name="id" value="${requestScope.Gonggao.id}"/>
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
        //language:  'fr',
		format: 'yyyy-mm-dd hh:ii'
    });
</script>  		
   </body>
</html>
