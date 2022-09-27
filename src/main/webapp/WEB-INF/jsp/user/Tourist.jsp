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
	
	<div class="container">
    <div>
        <a class="navbar-brand" href="#" style="float: left;color: black">南信房产</a>
    </div>
    <ul class="nav nav-tabs" style="float: left;margin-left: 100px">
        <li class="nav-item">
            <a class="nav-link active" href="toHouseAll" target="center">房源信息</a>
        </li>
        
    
        <li class="nav-item">
            <a class="nav-link " href="toLogin" style="color: black">安全退出</a>
        </li>
    </ul>

</div>

<div id="content" style="height: 560px;width: 100%">
		<iframe   name="center" src="toHouseAll" width="100%" height="100%" frameborder="0"></iframe>
	</div>


</body>
</html>