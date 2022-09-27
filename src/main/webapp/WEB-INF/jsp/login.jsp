<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <base href="<%=basePath%>">
  <link href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>基于ssm的房屋租赁管理系统</title>
	<script type="text/javascript" src="JS/jquery-3.6.0.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
  </head>
<body>
  	<div style="margin:100px 28% 0;width:800px">
		<span style="font-size:50px">基于ssm的房屋租赁管理系统</span>
	</div>
　　<div style="margin: 50px 0 50px">
    <form:form class="bs-example bs-example-form" role="form" style="width: 500px;margin: 50px auto" action="login" method="post">
        <div class="input-group mb-3">
            <div class="input-group-prepend" style="width: 75px">
                <span class="input-group-text">用户名</span>
            </div>
            <input type="text" name="uname" class="form-control" placeholder="admin" style="width: 425px">
            <br>
            <div class="input-group-prepend" style="margin-top: 50px;width: 75px;">
                <span class="input-group-text">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
            </div>
            <input type="password" name="passwd" class="form-control" placeholder="admin" style="margin-top: 50px;width: 425px">
        </div>
        <br>
        <div style="margin-top:50px;width: 500px">
            <button type="submit" id="b1" class="btn btn-primary" style="float:left;margin-left: 60px">
                登&nbsp;&nbsp;&nbsp;&nbsp;录
            </button>
           
            <button type="reset" class="btn btn-danger" style="margin-left: 200px">
                重&nbsp;&nbsp;&nbsp;&nbsp;置
            </button>
        </div>
    </form:form>
</div>
</body>
</html>
