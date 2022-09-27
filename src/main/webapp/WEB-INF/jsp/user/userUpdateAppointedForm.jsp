<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>updateAgoods.jsp</title>
<link href="css/admin/common.css" type="text/css" rel="stylesheet">
<link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/my-page.css" rel="stylesheet">
    
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="JS/my-page.js"></script>
</head>    
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js">
 	window.onload=function(){
 		
 	}
</script>
<body>
<p style="text:align:center">
	<font size=4 face=华文新魏>修改合同信息</font>
</p>
	<form class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath }/user/updateFormInfo">
		<table class="table table-hover table-striped table-bordered" id="t1" border="1">
			<tr>
				<td>合同序号</td>
				<td>
					<input id="id" value="${userAppointedForm.id}" name="id" class="form-control" style="width: 425px" readonly="readonly">
				</td>
			</tr>
		
			<tr>
				<td>房产序号</td>
				<td>
					<input id="house_id" value="${userAppointedForm.house_id}" name="house_id" class="form-control" style="width: 425px">
				</td>
			</tr>
			
			<tr>
				<td>用户id</td>
				<td>
					<input id="user_id" value="${userAppointedForm.user_id}" name="user_id" class="form-control" style="width: 425px" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<td>用户电话</td>
				<td>
					<input id="user_phone" value="${userAppointedForm.user_phone}" name="user_phone" class="form-control" style="width: 425px">
				</td>
			</tr>
			
			<tr>
				<td>房产价格</td>
				<td>
					<input id="price" value="${userAppointedForm.price}" name="price" class="form-control" style="width: 425px">
				</td>
			</tr>
			<tr>
				<td>创建日期</td>
				<td>
					<input id="date" value="${userAppointedForm.date}" name="date" class="form-control" style="width: 425px" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="submit" value="提交"/>
				</td>
				<td align="left">
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>