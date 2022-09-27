<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/WEB-INF/css/my-page.css" rel="stylesheet">
</head>
<body>
		<form role="form" action="updateHouse" method="post">
		<div class="input-group mb-3">
      						<div class="input-group-prepend">
        						<span class="input-group-text">序号</span>
      						</div>
      						<input id="house_id" type="text" class="form-control" name="house_id">
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
</body>
</html>