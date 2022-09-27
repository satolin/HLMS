<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/my-page.css" rel="stylesheet">
    
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="JS/my-page.js"></script>
</head>
<body>
	<c:if test="${userSelectHouse.size() == 0 }">
		您还没有商品。
	</c:if>
	<c:if test="${userSelectHouse.size() != 0 }">
			<table class="table table-hover table-striped table-bordered" id="t1" border="1">
            <thead class="thead-dark">
            <tr align="center">
                <th>序号</th>
                <th>地址</th>
                <th>用户</th>
                <th>面积</th>
                <th>朝向</th>
                <th>价格</th>
                <th>联系方式</th>
                <th>状态</th>
                <th>日期</th>
            </tr>
            </thead>
			<c:forEach items="${userSelectHouse }" var="node">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)" align="center">
					<td>    <c:out value="${node.house_id}"></c:out>  </td>
    				<td>    <c:out value="${node.addr}"></c:out>  </td>
     				<td>    <c:out value="${node.user_name}"></c:out>  </td>
     				<td>    <c:out value="${node.area}"></c:out>   </td>
    				<td>    <c:out value="${node.direc}"></c:out>  </td>
     				<td>    <c:out value="${node.cost}"></c:out>   </td>
     				<td>    <c:out value="${node.phone}"></c:out>  </td>
    				<td>    <c:out value="${node.status}"></c:out> </td>
     				<td>    <c:out value="${node.time}"></c:out> </td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>