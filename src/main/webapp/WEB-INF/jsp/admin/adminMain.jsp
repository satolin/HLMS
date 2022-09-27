<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>基于ssm的房屋租赁系统</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
    $(document).ready(function (){
        var a = document.getElementById("month");
        for (let i=1;i<=12;i++)
        {
            var t = document.createElement("option");
            t.value=i;
            t.text=i+"月";
            a.appendChild(t);
        }
        a = document.getElementById("day");
        for (let i=1;i<=31;i++)
        {
            var t = document.createElement("option");
            t.value=i;
            t.text=i+"日";
            a.appendChild(t);
        }
    })
    </script>
</head>
<body>
<div class="container">
    <div>
        <a class="navbar-brand" href="#" style="float: left;color: black">南信房产</a>
    </div>
    <ul class="nav nav-tabs" style="float: left;margin-left: 100px">
        <li class="nav-item">
            <a id="info" class="nav-link active" href="HouseInfos" target="page">房源信息</a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="color: black">房源管理</a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#selecthousebyid">序号查找</a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#selecthousebyuser">用户查找</a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#selecthousebycost">价格查找</a>
            </div>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="color: black">用户管理</a>
            <div class="dropdown-menu">
            	<a id="user" class="dropdown-item" href="UserInfos" target="page">用户信息</a>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#selectuserbyname">用户名查找</a>
                <a class="dropdown-item" href="VipInfos" target="page">大客户</a>
            </div>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="color: black">合同管理</a>
            <div class="dropdown-menu">
            	<a class="dropdown-item" href="toAdminFormAll" target="page">查看所有合同</a>
            	<a class="dropdown-item" href="#" data-toggle="modal" data-target="#selectformbydate">日期查找</a>
            </div>
        </li>
           <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="color: black">购房流程</a>
              <div class="dropdown-menu">
                 <a class="dropdown-item" href="process"    target="page">流程介绍</a>
                
            </div>
          
        </li>
    </ul>
  <!-- 序号查找 -->  
  <div class="modal fade" id="selecthousebyid">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">请输入房屋序号</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body" style="height:80px">
          	<form class="form-inline" action="selectAHouse" method="post" target="page">
		    	<input class="form-control" name="house_id" type="text" style="width:300px;float:left">
		    	<input class="btn btn-primary" style="margin-left: 20px" type="submit" value="提交" >
		    	<button type="button" class="btn btn-danger" data-dismiss="modal" style="float:right;margin-left:20px">取消</button>
			</form>
        </div>
      </div>
    </div>
  </div>
    
<!-- 用户查找 -->  
  <div class="modal fade" id="selecthousebyuser">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">请输入用户名</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body" style="height:80px">
          	<form class="form-inline" action="selectHouses" method="post" target="page">
		    	<input class="form-control" name="user_name" type="text" style="width:300px;float:left">
		    	<input class="btn btn-primary" style="margin-left: 20px" type="submit" value="提交" >
		    	<button type="button" class="btn btn-danger" data-dismiss="modal" style="float:right;margin-left:20px">取消</button>
			</form>
        </div>
      </div>
    </div>
  </div>
  
<!-- 价格查找 -->  
  <div class="modal fade" id="selecthousebycost">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">请输入价格</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body" style="height:80px">
          	<form class="form-inline" action="selectHouses" method="post" target="page">
		    	<input class="form-control" name="cost" type="text" style="width:300px;float:left">
		    	<input class="btn btn-primary" style="margin-left: 20px" type="submit" value="提交" >
		    	<button type="button" class="btn btn-danger" data-dismiss="modal" style="float:right;margin-left:20px">取消</button>
			</form>
        </div>
      </div>
    </div>
  </div>      


<!-- 用户名查找用户 -->  
  <div class="modal fade" id="selectuserbyname">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">请输入用户名</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body" style="height:80px">
          	<form class="form-inline" action="selectUsers" method="post" target="page">
		    	<input class="form-control" name="uname" type="text" style="width:300px;float:left">
		    	<input class="btn btn-primary" style="margin-left: 20px" type="submit" value="提交" >
		    	<button type="button" class="btn btn-danger" data-dismiss="modal" style="float:right;margin-left:20px">取消</button>
			</form>
        </div>
      </div>
    </div>
  </div>
 
 <!-- 日期查找合同 -->
  <div class="modal fade" id="selectformbydate">
    <div class="modal-dialog">
      <div class="modal-content">
   
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h4 class="modal-title">请选择日期</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body" style="height:80px">
          	<form class="form-inline" action="selectByDay" method="post" target="page">
		    	月：
		    	<select id="month" name="month">
	                <option value="0" selected="selected">--请选择--</option>
            	</select>
		    	日：<select id="day" name="day">
		    		<option value="0" selected="selected">--请选择--</option>
		    	</select>
		    	<input class="btn btn-primary" style="margin-left: 20px" type="submit" value="确定" >
		    	<button type="button" class="btn btn-danger" data-dismiss="modal" style="float:right;margin-left:20px">取消</button>
			</form>
        </div>
      </div>
    </div>
  </div>
    
    <div>
        <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" style="float: right">${userinfo.uname }&nbsp;</a>
        <ul class="dropdown-menu">
            <li>
                <a class="dropdown-item" href="user/toLogin">
                    安全退出
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="container-fluid">
    <div id="content" style="height: 700px;width: 100%">
        <iframe id="iframe" name="page" style="width: 100%;height:100%" frameborder="0"></iframe>
    </div>
</div>
<script >
$(document).ready(function(){
	document.getElementById("info").click();
});
</script>
</body>
</html>