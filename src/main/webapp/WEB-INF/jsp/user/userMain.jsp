<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>基于ssm的房屋租赁系统</title>
  <link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
   <%
  if((String)request.getAttribute("yes")!=null){
  %>
  <script type="text/javascript">
  	alert("登陆成功！")
  </script>
  <%
  }
  %>
<div id="header">
		<br>
		<br>
		<h1>欢迎${userInfo.uname}！</h1>
	</div>	
	
	<div class="container">
    <div>
        <a class="navbar-brand" href="#" style="float: left;color: black">南信房产</a>
    </div>
    <ul class="nav nav-tabs" style="float: left;margin-left: 100px">
        <li class="nav-item">
            <a class="nav-link active" href="toHouseAll" target="center">房源信息</a>
        </li>
       
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="color: black">我的房子</a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="toUserInsertHouse?user_uname=${userInfo.uname}" target="center">房屋新增</a>
                <a class="dropdown-item" href="toUserDeleteHouse?user_uname=${userInfo.uname}" target="center">房屋删除</a>
                <a class="dropdown-item" href="toUserUpdateHouse?user_uname=${userInfo.uname}" target="center">房屋修改</a>
                <a class="dropdown-item" href="toUserSelectHouse?user_uname=${userInfo.uname}" target="center">房屋查询</a>
            </div>
        </li>
         <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="color: black">用户中心</a>
            <div class="dropdown-menu">
                 <a class="dropdown-item" href="toUpdateInformation?user_uname=${userInfo.uname}" target="center">信息修改</a>
            </div>
        </li>
    
		 <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" style="color: black">合同管理</a>
            <div class="dropdown-menu">
            	<a class="dropdown-item" href="toFormAll?user_id=${userInfo.user_id}" target="center">查看所有合同</a>
                <a class="dropdown-item" href="toAddUserForm?user_id=${userInfo.user_id}" target="center">添加合同</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link " href="toLogin" style="color: black">安全退出</a>
        </li>
    </ul>

</div>


<div id="content" style="height: 280px;width: 100%">
		<iframe   name="center" src="toHouseAll" width="100%" height="200%" frameborder="0"></iframe>
	</div>


</body>
</html>