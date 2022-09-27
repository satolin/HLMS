<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/my-page.css" rel="stylesheet">
    
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="JS/my-page.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
	<script>
		window.onload=function()
		{
			var date = new Date()<!--获得日期数据-->
	        var y = date.getFullYear();<!--年-->
	        var m = date.getMonth()+1;<!--月，这里的月份必须要+1才是当前月份-->
	        var d = date.getDate();
	        document.getElementById("time").value = y+"-"+m+"-"+d;
		}
    </script>
<body>
	<p style="text:align:center">
		<font size=4 face=华文新魏>新增房屋信息</font>
	</p>
	 <form class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath }/user/InsertHouseInfo">
		<table class="table table-hover table-striped table-bordered" id="t1" border="1">
			<tr>
				<td>地址<font color="red"></font></td>
				<td>
					<input id="addr" name="addr" class="form-control" style="width: 425px">
				</td>
			</tr>
			<tr>
				<td>用户<font color="red"></font></td>
				<td>
					<input id="user_name" name="user_name" class="form-control" value=${param.user_uname} style="width: 425px" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>面积</td>
				<td>
					<input id="area" name="area" class="form-control" style="width: 425px">
				</td>
			</tr>
			<tr>
				<td>朝向</td>
				<td>
					<input id="direc" name="direc" class="form-control" style="width: 425px">
				</td>
			</tr>
				<tr>
				<td>电话</td>
				<td>
					<input id="phone" name="phone" class="form-control" style="width: 425px">
				</td>
			</tr>
				<tr>
				<td>价格</td>
				<td>
					<input id="cost" name="cost" class="form-control" style="width: 425px">
				</td>
			</tr>
				<tr>
				<td>状态</td>
				<td>
					<input id="status" name="status" class="form-control" style="width: 425px" value="未售" readonly="readonly">
				</td>
			</tr>
				<tr>
				<td>日期</td>
				<td>
					<input id="time" name="time" class="form-control" style="width: 425px" readonly="readonly">
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