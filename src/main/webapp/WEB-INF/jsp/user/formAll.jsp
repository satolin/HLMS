<%@ page language="java" contentType="text/html;  charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>基于ssm的房屋租赁系统</title>
<link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/my-page.css" rel="stylesheet">
    
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="JS/my-page.js"></script>
</head>
<body>
<script>
	function checkDel(id,user_id){
		if(window.confirm("是否删除该合同？")){
			window.location.href = "/HLMS/user/deleteForm?id="+id+"&user_id="+user_id;
		}
	}
</script>
<c:if test="${formAll.size() == 0 }">
		您还没有商品。
	</c:if>
	<c:if test="${formAll.size() != 0 }">
		<table class="table table-hover table-striped table-bordered" id="t1" border="1">
            <thead class="thead-dark">
            <tr align="center">
                <th>合同序号</th>
                <th>房产序号</th>
                <th>用户id</th>
                <th>用户电话</th>
                <th>房产价格</th>
                <th>创建日期</th>
                <th>操作</th>
            </tr>
            </thead>
			<c:forEach items="${formAll }" var="node">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					 <td>    <c:out value="${node.id}"></c:out>  </td>
    				 <td>    <c:out value="${node.house_id}"></c:out>  </td>
     				 <td>    <c:out value="${node.user_id}"></c:out>  </td>
     				 <td>    <c:out value="${node.user_phone}"></c:out>  </td>
    				 <td>    <c:out value="${node.price}"></c:out>  </td>
    				 <td>    <c:out value="${node.date}"></c:out>  </td>
    				 <td>
    				 	&nbsp;<a href="toUpdateAppointedForm?id=${node.id}" target="center" >修改</a>&nbsp;
    				 	<a href="javascript:checkDel('${node.id}','${node.user_id}')" target="center" >删除</a>
    				 </td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>