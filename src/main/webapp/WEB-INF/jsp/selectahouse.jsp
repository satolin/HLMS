<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    	$('#t1').empty();
    	var t = document.getElementById("t1");
        t.innerHTML = "<thead class=\"thead-dark\">\n" +
            "            <tr align=\"center\">\n" +
            "                <th>序号</th>\n" +
            "                <th>用户</th>\n" +
            "                <th>地址</th>\n" +
            "                <th>面积</th>\n" +
            "                <th>朝向</th>\n" +
            "                <th>联系方式</th>\n" +
            "                <th>价格</th>\n" +
            "                <th>状态</th>\n" +
            "                <th>日期</th>\n" +
            "                <th>操作</th>\n" +
            "            </tr>\n" +
            "            </thead>"
		<c:forEach items="${houseinfo}" var="house" varStatus="s">
		<c:if test="${s.index ge 0 && s.index le 7}">
			var t = document.getElementById("t1");
    		var houses = new Array();
            houses.push("${house.house_id}");
            houses.push("${house.user_name}");
            houses.push("${house.addr}");
            houses.push("${house.area}");
            houses.push("${house.direc}");
            houses.push("${house.phone}");
            houses.push("${house.cost}");
            houses.push("${house.status}");
            houses.push("${house.time}");
            t.appendChild(getDataRow(houses));
		</c:if>
		</c:forEach>
    })
    
    function getDataRow(houses) {
	    	var row = document.createElement('tr'); //创建行
	    	row.align = "center";
	        
	    	for(i=0;i<9;i++){
	    		var idCell = document.createElement('td'); //创建第一列td
		        idCell.innerHTML = houses[i]; //填充数据
		        if(houses[i] === "已售"){
		        	row.setAttribute("class","table-danger");
		        }
		        else if(houses[i] === "待售"){
		        	row.setAttribute("class","table-success");
		        }
		        row.appendChild(idCell); //加入行 ，下面类似
	    	}
	    	var btnCell = document.createElement('td'); //创建最后一列td
	    	btnCell.innerHTML = "<button id='mod' type='button' class='btn btn-primary' data-toggle='modal' data-target='#myMod' onclick='javascript:findahouse(this);'>编辑</button>" +
            "<button id='del' type='button' class='btn btn-danger' data-toggle='modal' data-target='#myDel' style='margin-left:20px' onclick='javascript:deleteahouse(this);'>删除</button>";
	    	row.appendChild(btnCell);
	       
	        return row; //返回tr数据
        }
    
    function findahouse(obj){
        var tmp = obj;
        //触发点击事件时，获取当前点击元素的祖先元素tr中第二个td的第一个input输入的值
        //parents()获取所有的祖先元素td/tr/table/div/div/body/html
        //parents("tr")指定tr元素
        //children("td").eq(1)子节点中的第二个td
        //find("input:first").val()第一个input标签的值
        var value = $(obj).parents("tr").children("td");
        document.getElementById("house_id").value = value[0].innerText;
        document.getElementById("house_span").innerText = value[0].innerText;
        document.getElementById("modal_head").innerText = value[1].innerText;
        document.getElementById("addr").value = value[2].innerText;
        document.getElementById("area").value = value[3].innerText;
        document.getElementById("direc").value = value[4].innerText;
        document.getElementById("cost").value = value[5].innerText;
        document.getElementById("phone").value = value[6].innerText;
        for(var i=0;i<document.getElementById("status").options.length;i++){
        	if(document.getElementById("status").options[i].value === value[7].innerText){
        		document.getElementById("status").options[i].selected = true;
        		break;
        	}
        }
        document.getElementById("date").value = value[8].innerText;
    }
    
    function deleteahouse(obj){
    	var tmp = obj;
        //触发点击事件时，获取当前点击元素的祖先元素tr中第二个td的第一个input输入的值
        //parents()获取所有的祖先元素td/tr/table/div/div/body/html
        //parents("tr")指定tr元素
        //children("td").eq(1)子节点中的第二个td
        //find("input:first").val()第一个input标签的值
        document.getElementById("house_del_id").value = $(obj).parents("tr").children("td")[0].innerText;
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
        <!-- 编辑 -->
		  <div class="modal fade" id="myMod">
		    <div class="modal-dialog">
		      <div class="modal-content">
		   		
		   		<!-- 模态框头部 -->
		        <div class="modal-header">
		          <h4 id="modal_head" class="modal-title"></h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- 模态框主体 -->
		        <div class="modal-body">
		          	<form role="form" action="updateHouse" method="post">
						<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">序号</span>
      						</div>
      						<input id="house_id" type="hidden" class="form-control" name="house_id" style = "visibility: hidden;">
      						<span id="house_span"></span>
    					</div>
		          		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">地址</span>
      						</div>
      						<input id="addr" type="text" class="form-control" name="addr">
    					</div>
		          		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">面积</span>
      						</div>
      						<input id="area" type="text" class="form-control" name="area">
    					</div>
		          		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">朝向</span>
      						</div>
      						<input id="direc" type="text" class="form-control" name="direc">
    					</div>
		          		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">价格</span>
      						</div>
      						<input id="cost" type="text" class="form-control" name="cost">
    					</div>
		          		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">联系</span>
      						</div>
      						<input id="phone" type="text" class="form-control" name="phone">
    					</div>
		          		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">状态</span>
      						</div>
      							<select id="status" class="form-control" value="asddsadsdsa" name="status">
      								<option value="已售">已售</option>
      								<option value="待售">待售</option>
      							</select>
    					</div>
		          		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">日期</span>
      						</div>
      						<input id="date" type="text" class="form-control" name="date">
    					</div>
    					<div class="container">
    						<input type="submit" class="btn btn-primary" value="提交" style="margin-left:100px">
    						<input type="reset" class="btn btn-danger" value="重置" style="margin-left:150px">
    					</div>
		          	</form>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <!-- 删除 -->
		  <div class="modal fade" id="myDel">
		    <div class="modal-dialog">
		      <div class="modal-content">
		   
		        <!-- 模态框头部 -->
		        <div class="modal-header">
		          <h4 class="modal-title">确定删除吗</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		   
		        <!-- 模态框底部 -->
		        <div class="modal-footer">
		        	<form role="form" action="deleteAHouse" method="post" style="margin-left:150px;float:left">
		        		<input id="house_del_id" name="house_id" type="hidden" class="form-control">
		        		<input type="submit" class="btn btn-primary" value="确定" style="float:left">
		        	</form>
		          	<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-right:100px">取消</button>
		        </div>
		   
		      </div>
		    </div>
		  </div>
    </div>
</div>
    <div id="page" class="page_div"></div>
    <script>
    $("#page").paging({
        pageNum: 1, //当前页
        totalNum: Math.ceil(${fn:length(houseinfo)}/8.0), //总页数
        totalList: ${fn:length(houseinfo)}, //总记录数
        callback: function (num) { //响应事件
        	$.ajax({
                async:true,
                url:"HouseInfos",
                type:"post",
                success:function (data) {
                	$('#t1').empty();
                	var t = document.getElementById("t1");
                    t.innerHTML = "<thead class=\"thead-dark\">\n" +
                        "            <tr align=\"center\">\n" +
                        "                <th>序号</th>\n" +
                        "                <th>用户</th>\n" +
                        "                <th>地址</th>\n" +
                        "                <th>面积</th>\n" +
                        "                <th>朝向</th>\n" +
                        "                <th>价格</th>\n" +
                        "                <th>联系方式</th>\n" +
                        "                <th>状态</th>\n" +
                        "                <th>日期</th>\n" +
                        "                <th>操作</th>\n" +
                        "            </tr>\n" +
                        "            </thead>"
                       var start = 0 + (num -1)*8
                       var end = 7 + (num -1)*8
                	<c:forEach items="${houseinfo}" var="house" varStatus="s">
                		if(${s.index}>=start && ${s.index}<= end){
        	            	var t = document.getElementById("t1");
        	            	var houses = new Array();
        	                houses.push("${house.house_id}");
        	                houses.push("${house.addr}");
        	                houses.push("${house.user_name}");
        	                houses.push("${house.area}");
        	                houses.push("${house.direc}");
        	                houses.push("${house.phone}");
        	                houses.push("${house.cost}");
        	                houses.push("${house.status}");
        	                houses.push("${house.time}");
        	                t.appendChild(getDataRow(houses));
                		}
         			</c:forEach>
                }
            })
        }
    })
    </script>
</body>
</html>