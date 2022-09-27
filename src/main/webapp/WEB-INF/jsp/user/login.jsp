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
    <title>基于ssm的房屋租赁管理系统</title>
	<script type="text/javascript" src="../../JS/jquery-3.6.0.js">
	var commonUtil = {
	        /**
	         * 弹出消息框
	         * @param msg 消息内容
	         * @param type 消息框类型（参考bootstrap的alert）
	         */
	        alert: function(msg, type){
	            if(typeof(type) =="undefined") { // 未传入type则默认为success类型的消息框
	                type = "success";
	            }
	            // 创建bootstrap的alert元素
	            var divElement = $("<div></div>").addClass('alert').addClass('alert-'+type).addClass('alert-dismissible').addClass('col-md-4').addClass('col-md-offset-4');
	            divElement.css({ // 消息框的定位样式
	                "position": "absolute",
	                "top": "80px"
	            });
	            divElement.text(msg); // 设置消息框的内容
	            // 消息框添加可以关闭按钮
	            var closeBtn = $('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>');
	            $(divElement).append(closeBtn);
	            // 消息框放入到页面中
	            $('body').append(divElement);
	            return divElement;
	        },

	        /**
	         * 短暂显示后上浮消失的消息框
	         * @param msg 消息内容
	         * @param type 消息框类型
	         */
	        message: function(msg, type) {
	            var divElement = commonUtil.alert(msg, type); // 生成Alert消息框
	            var isIn = false; // 鼠标是否在消息框中

	            divElement.on({ // 在setTimeout执行之前先判定鼠标是否在消息框中
	                mouseover : function(){isIn = true;},
	                mouseout  : function(){isIn = false;}
	            });

	            // 短暂延时后上浮消失
	            setTimeout(function() {
	                var IntervalMS = 20; // 每次上浮的间隔毫秒
	                var floatSpace = 60; // 上浮的空间(px)
	                var nowTop = divElement.offset().top; // 获取元素当前的top值
	                var stopTop = nowTop - floatSpace;    // 上浮停止时的top值
	                divElement.fadeOut(IntervalMS * floatSpace); // 设置元素淡出

	                var upFloat = setInterval(function(){ // 开始上浮
	                    if (nowTop >= stopTop) { // 判断当前消息框top是否还在可上升的范围内
	                        divElement.css({"top": nowTop--}); // 消息框的top上升1px
	                    } else {
	                        clearInterval(upFloat); // 关闭上浮
	                        divElement.remove();    // 移除元素
	                    }
	                }, IntervalMS);

	                if (isIn) { // 如果鼠标在setTimeout之前已经放在的消息框中，则停止上浮
	                    clearInterval(upFloat);
	                    divElement.stop();
	                }

	                divElement.hover(function() { // 鼠标悬浮时停止上浮和淡出效果，过后恢复
	                    clearInterval(upFloat);
	                    divElement.stop();
	                },function() {
	                    divElement.fadeOut(IntervalMS * (nowTop - stopTop)); // 这里设置元素淡出的时间应该为：间隔毫秒*剩余可以上浮空间
	                    upFloat = setInterval(function(){ // 继续上浮
	                        if (nowTop >= stopTop) {
	                            divElement.css({"top": nowTop--});
	                        } else {
	                            clearInterval(upFloat); // 关闭上浮
	                            divElement.remove();    // 移除元素
	                        }
	                    }, IntervalMS);
	                });
	            }, 1500);
	        }
	    }
	//确定按钮
	
	
	<!-- **************************************************************************************!-->
  
     $("#reset").on("click",function (){
    	 var uname=document.getElementById(uname).valueOf();
 		var passwd = document.getElementById(passwd).valueOf();
    	 $.ajax({
 			type:"post",
 			dataType:"json",
 			url:'upload',
 			data:{
				uname:"uname",
				passwd:"passwd",
			},
 			async:false;
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
     });
 	function userLogin () {
		var uname=document.getElementById(uname).valueOf();
		var passwd = document.getElementById(passwd).valueOf();
		$.ajax({
			type:"post",
			dataType:"json",
			url:'loginToUserMain',
			async:false,
			data:{
				uname:"uname",
				passwd:"passwd",
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
	}
	
	<!-- **************************************************************************************!-->

	</script>
	    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
  </head>
<body>
 <%
  if((String)request.getAttribute("successful")!=null){
  %>
  <script type="text/javascript">
  	alert("注册成功！")
  </script>
  <%
  }
  %>
   <%
  if((String)request.getAttribute("hasbeen")!=null){
  %>
  <script type="text/javascript">
  	alert("密码错误！")
  </script>
  <%
  }
  %>
  	<div style="margin:100px 28%;width:800px;margin-bottom: 50px;">
		<span style="font-size:50px">基于ssm的房屋租赁管理系统</span>
	</div>
　　<div style="margin: 150px 0 50px;margin-top: 50px;">
    <form class="bs-example bs-example-form" role="form" action="${pageContext.request.contextPath }/user/loginToUserMain"
    style="width: 500px;margin: 50px auto" action="login" method="post">
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
            <button type="submit" class="btn btn-primary" style="float:left;margin-left: 60px">
                登&nbsp;&nbsp;&nbsp;&nbsp;录
            </button>
       </div>
        <button type="reset" class="btn btn-danger" style="margin-left: 60px" >
                重&nbsp;&nbsp;&nbsp;&nbsp;置
            </button>
       
       
            <button type="button" name="registerUser" class="btn btn-primary" style="margin-left: 60px" onclick="window.location='toRegister'">
                注&nbsp;&nbsp;&nbsp;&nbsp;册
            </button>
         </form>
         <p style="text-align:center"> <a href="${pageContext.request.contextPath }/user/toTourist"  >游客模式</a></p>
         <p style="text-align:center"> <a href="${pageContext.request.contextPath }/toLogin"  >管理员模式</a></p>
        
    
</div>
</body>
</html> 
