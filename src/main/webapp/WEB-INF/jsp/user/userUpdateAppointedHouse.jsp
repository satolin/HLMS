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
 	<!--
 	$(document).ready(function(){
 		$("#addr").attr("value","1111");
 	});
 	-->
 	function init(){
 		document.getElementById("addr").value="1111";
 	}
 	window.onload=function(){
 		
 	}

</script>
<body>
<p style="text:align:center">
				<font size=4 face=华文新魏>修改房屋信息</font>
		</p>
	<form class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath }/user/toUpdateHouseInfo">
		<table class="table table-hover table-striped table-bordered" id="t1" border="1">
		
			<tr>
				<td>序号<font color="red">*</font></td>
				<td>
					<input id="house_id" value="${userAppointedHouse.house_id}" name="house_id" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
			<tr>
				<td>地址<font color="red">*</font></td>
				<td>
					<input id="addr" value="${userAppointedHouse.addr}" name="addr" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
			<tr>
				<td>用户<font color="red">*</font></td>
				<td>
					<input id="user_name" value="${userAppointedHouse.user_name}" name="user_name" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
			<tr>
				<td>面积</td>
				<td>
					<input id="area" value="${userAppointedHouse.area}" name="area" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
			<tr>
				<td>朝向</td>
				<td>
					<input id="direc" value="${userAppointedHouse.direc}" name="direc" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
				<tr>
				<td>联系方式</td>
				<td>
					<input id="phone" value="${userAppointedHouse.phone}" name="phone" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
				<tr>
				<td>价格</td>
				<td>
					<input id="cost" value="${userAppointedHouse.cost}" name="cost" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
				<tr>
				<td>状态</td>
				<td>
					<input id="status" value="${userAppointedHouse.status}" name="status" class="form-control" placeholder="admin" style="width: 425px">
				</td>
			</tr>
				<tr>
				<td>日期</td>
				<td>
					<input id="time" value="${userAppointedHouse.time}" name="time" class="form-control" placeholder="admin" style="width: 425px">
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
