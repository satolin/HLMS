<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script>
    $(document).ready(function (){ 	
        $.ajax({
            async:true,
            url:"toAdminFormAll",
            type:"post",
            success:function (data) {
            	$('#t1').empty();
            	var t = document.getElementById("t1");
                t.innerHTML = "<thead class=\"thead-dark\">\n" +
                    "            <tr align=\"center\">\n" +
                    "                <th>合同序号</th>\n" +
                    "                <th>房产序号</th>\n" +
                    "                <th>用户id</th>\n" +	
                    "                <th>用户电话</th>\n" +
                    "                <th>房产价格</th>\n" +
                    "                <th>创建日期</th>\n" +
                    "            </tr>\n" +
                    "            </thead>"
				<c:forEach items="${forminfo}" var="form" varStatus="s">
        		<c:if test="${s.index ge 0 && s.index le 7}">
        			var t = document.getElementById("t1");
        			var forms = new Array();
            		forms.push("${form.id}");
            		forms.push("${form.house_id}");
	                forms.push("${form.user_id}");
	                forms.push("${form.user_phone}");
	                forms.push("${form.price}");
	                forms.push("${form.date}");
	                t.appendChild(getDataRow(forms));
        		</c:if>
 			</c:forEach>
            }
        })
    })
    
    function getDataRow(forms) {
	    	var row = document.createElement('tr'); //创建行
	    	row.align = "center";
	        
	    	for(i=0;i<6;i++){
	    		var idCell = document.createElement('td'); //创建第一列td
		        idCell.innerHTML = forms[i];
		        row.appendChild(idCell); //加入行 ，下面类似
	    	}
	        return row; //返回tr数据
    }
    </script>
</head>
<body>
<div class="panel panel-primary" style="margin-top:30px">
	<div class="panel-heading">
		<span class="d-block p-2 bg-dark text-white">房源信息</span>
	</div>
	
    <div class="panel-body">
        <!-- 列表表格 -->
        <table class="table table-hover table-striped table-bordered" id="t1">
            <thead class="thead-dark">
            <tr align="center">
                <th>合同序号</th>
                <th>房产序号</th>
                <th>用户id</th>
                <th>用户电话</th>
                <th>房产价格</th>
                <th>创建日期</th>
            </tr>
            </thead>
         </table>
    </div>
</div>
<div id="page" class="page_div"></div>
    <script>
    $("#page").paging({
        pageNum: 1, //当前页
        totalNum: Math.ceil(${fn:length(forminfo)}/8.0), //总页数
        totalList: ${fn:length(forminfo)}, //总记录数
        callback: function (num) { //响应事件
        	$.ajax({
                async:true,
                url:"toAdminFormAll",
                type:"post",
                success:function (data) {
                	$('#t1').empty();
                	var t = document.getElementById("t1");
                    t.innerHTML = "<thead class=\"thead-dark\">\n" +
                        "            <tr align=\"center\">\n" +
                        "                <th>合同序号</th>\n" +
                        "                <th>房产序号</th>\n" +
                        "                <th>用户id</th>\n" +	
                        "                <th>用户电话</th>\n" +
                        "                <th>房产价格</th>\n" +
                        "                <th>创建日期</th>\n" +
                        "            </tr>\n" +
                        "            </thead>"
    				<c:forEach items="${forminfo}" var="form" varStatus="s">
            		<c:if test="${s.index ge 0 && s.index le 7}">
            			var t = document.getElementById("t1");
            			var forms = new Array();
                		forms.push("${form.id}");
                		forms.push("${form.house_id}");
    	                forms.push("${form.user_id}");
    	                forms.push("${form.user_phone}");
    	                forms.push("${form.price}");
    	                forms.push("${form.date}");
    	                t.appendChild(getDataRow(forms));
            		</c:if>
     			</c:forEach>
                }
            })
        }
    })
    </script>
</body>
</html>