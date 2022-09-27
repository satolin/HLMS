<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script>
    $(document).ready(function (){ 	
        $.ajax({
            async:true,
            url:"UserInfos",
            type:"post",
            success:function (data) {
            	$('#t1').empty();
            	var t = document.getElementById("t1");
                t.innerHTML = "<thead class=\"thead-dark\">\n" +
                    "            <tr align=\"center\">\n" +
                    "                <th>序号</th>\n" +
                    "                <th>用户名</th>\n" +
                    "                <th>年龄</th>\n" +	
                    "                <th>联系方式</th>\n" +
                    "                <th>权限</th>\n" +
                    "				 <th>房产</th>\n" +
                    "            </tr>\n" +
                    "            </thead>"
				<c:forEach items="${userinfo}" var="user" varStatus="s">
        		<c:if test="${s.index ge 0 && s.index le 7}">
        			var t = document.getElementById("t1");
            		var users = new Array();
            		users.push("${user.user_id}");
            		users.push("${user.uname}");
            		users.push("${user.age}");
            		users.push("${user.phone}");
            		users.push("${user.power}");
            		users.push("${user.count}");
	                t.appendChild(getDataRow(users));
        		</c:if>
 			</c:forEach>
            }
        })
    })
    
    function getDataRow(users) {
	    	var row = document.createElement('tr'); //创建行
	    	row.align = "center";
	        
	    	for(i=0;i<6;i++){
	    		var idCell = document.createElement('td'); //创建第一列td
		        idCell.innerHTML = users[i]; //填充数据
		        if(i == 5 && users[i] >= 5){
		        	row.setAttribute("class","table-success");
		        }
		        row.appendChild(idCell); //加入行 ，下面类似
	    	}
//	    	var btnCell = document.createElement('td'); //创建最后一列td
//	    	btnCell.innerHTML = "<button id='mod' type='button' class='btn btn-primary' data-toggle='modal' data-target='#myMod'>编辑</button>" +
//            "<button id='del' type='button' class='btn btn-danger' data-toggle='modal' data-target='#myDel' style='margin-left:20px'>删除</button>";
//	    	row.appendChild(btnCell);
	       
	        return row; //返回tr数据
        }
    </script>
</head>
<body>
<div class="panel panel-primary" style="margin-top:30px">
	<div class="panel-heading">
		<span class="d-block p-2 bg-dark text-white" style="font-size:30">用户信息</span>
	</div>
    <div class="panel-body">
        <!-- 列表表格 -->
        <table class="table table-hover table-striped table-bordered" id="t1">
            <thead class="thead-dark">
            <tr align="center">
                <th>序号</th>
                <th>用户</th>
                <th>地址</th>
                <th>面积</th>
                <th>朝向</th>
                <th>价格</th>
                <th>联系方式</th>
                <th>状态</th>
                <th>日期</th>
                <th>操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
    <div id="page" class="page_div"></div>
    <script>
    $("#page").paging({
        pageNum: 1, //当前页
        totalNum: Math.ceil(${fn:length(userinfo)}/8.0), //总页数
        totalList: ${fn:length(userinfo)}, //总记录数
        callback: function (num) { //响应事件
        	$.ajax({
                async:true,
                url:"UserInfos",
                type:"post",
                success:function (data) {
                	$('#t1').empty();
                	var t = document.getElementById("t1");
                    t.innerHTML = "<thead class=\"thead-dark\">\n" +
                    "            <tr align=\"center\">\n" +
                    "                <th>序号</th>\n" +
                    "                <th>用户名</th>\n" +
                    "                <th>年龄</th>\n" +	
                    "                <th>联系方式</th>\n" +
                    "                <th>权限</th>\n" +
                    "				 <th>房产</th>\n" +
                        "            </tr>\n" +
                        "            </thead>"
                       var start = 0 + (num -1)*8
                       var end = 7 + (num -1)*8
                	<c:forEach items="${userinfo}" var="user" varStatus="s">
                		if(${s.index}>=start && ${s.index}<= end){
                			var t = document.getElementById("t1");
                    		var users = new Array();
                    		users.push("${user.user_id}");
                    		users.push("${user.uname}");
                    		users.push("${user.age}");
                    		users.push("${user.phone}");
                    		users.push("${user.power}");
                    		users.push("${user.count}");
        	                t.appendChild(getDataRow(users));
                		}
         			</c:forEach>
                }
            })
        }
    })
    </script>
</body>
</html>