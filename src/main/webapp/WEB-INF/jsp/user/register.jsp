<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>  
  <base href="<%=basePath%>">
  <link href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
    <title>后台注册</title>
	<style type="text/css">
	table{
		text-align: center;
	}
	.textSize{
		width: 120px;
		height: 25px;
	}
	* {
		margin: 0px;
		padding: 0px;
	}
	body {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
		margin: 10px 10px auto;

	}
	</style>
	<script type="text/javascript" src="../../JS/jquery-3.6.0.js">
	//确定按钮
	$("#submit").on("click",function () {
		var uname=document.getElementById(uname).valueOf();
		var passwd = document.getElementById(passwd).valueOf();
		var age=document.getElementById(age).valueOf();
		var phone = document.getElementById(phone).valueOf();
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:'user/register',
			async:false,
			data:{
				uname:"uname",
				passwd:"passwd",
				age:"age",
				phone:"phone",
			},
			success:function (result) {
				if(result==true){
					alert("true");
					Console.log("true")
				}else{
					alert("false");
					Console.log("false")
				}
			},
			error:function () {
				alert("ajax异常");
			}
		})
	})
	
	<!-- **************************************************************************************!-->
     function jump(){
    	 window.location.href='register.jsp';
    	 
     }
	
	
	<!-- **************************************************************************************!-->
	</script>
	<style type="text/css">
		
	</style>
  </head>
  <body>
  <%
  if((String)request.getAttribute("fail")!=null){
  %>
  <script type="text/javascript">
  	alert("该用户名已存在！")
  </script>
  <%
  }
  %>
  	<div style="margin:100px 28%;width:800px">
		<span style="font-size:50px">基于ssm的房屋租赁管理系统</span>
	</div>
  <div style="margin: 150px 0 50px">
  	   <form class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath }/user/register"
    style="width: 500px;margin: 50px auto" action="login" method="post">
    
	<table>
		
		<tr>
			<td><span style="font-size:15px">姓名：</span></td>
			<td colspan="2">
				<input name="uname" type="text"  style="width: 375px;height:30px;"/>
			</td>
		</tr>
		<tr style="height:10px;">
		</tr>
		<tr>
			<td><span style="font-size:15px">密码：</span></td>
			<td colspan="2">
				<input name="password" type="password"  style="width: 375px;height:30px;"/>
			</td>
		</tr>
		<tr style="height:10px;">
		</tr>
		<tr>
			<td><span style="font-size:15px">年龄：</span></td>
			<td colspan="2">
				<input name="age" type="text"  style="width: 375px;height:30px;"/>
			</td>
		</tr>
		<tr style="height:10px;">
		</tr>
		<tr>
			<td><span style="font-size:15px">电话：</span></td>
			<td colspan="2">
				<input name="phone" type="text"  style="width: 375px;height:30px;"/>
			</td>
		</tr>
		<tr style="height:10px;">
		</tr>
		<tr>
			<td>
				<input type="submit" src="" class="btn btn-primary" style="margin-left: 60px" value="提交" >
			</td>
			<td>
				<input type="reset" src="" class="btn btn-danger" style="margin-left: 60px" value="重置"  >
			</td>
			<td>
				<input type="button" class="btn btn-primary" style="margin-left: 60px" value="返回" onclick="window.location='user/toLogin'">
			</td>
		</tr>
	</table>
	
	</form>
	
</div>
  </body>
</html>
