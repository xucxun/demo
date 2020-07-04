<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人博客系统后台登录页面</title>
<!-- 引入 Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<link rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/favicon.ico" >
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<!-- 引入 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<style>
body{
	background: #ebebeb;
	font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
	color: #222;
	font-size: 12px;
	background:url("${pageContext.request.contextPath}/static/images/loginbg.jpg") no-repeat center ;
}
a:hover{
	text-decoration: none;
}
*{
	padding: 0px;
	margin: 0px;
	}
.top{
	width: 100%;
	height: 400px;
}
.top_title p {
    font-size: 25px;
    text-align: center;
    color:#fff;
    position: relative;
    top: 250px;
}
.textbox{
	background: rgb(255, 255, 255);
  	margin: -100px auto ;
	border: 1px solid rgb(231, 231, 231);
	border-radius:3px;
	width: 400px;
	height:210px;
	text-align: center;
	padding-top:30px;
}
.form-control{
	width: 300px;
	padding-top: -5px;
}
.glyphicon-user{
	font-size:15px;
	padding-top:2px;
}
.glyphicon-lock{
	font-size:15px;
	padding-top:2px;
}
.textbox .bottom{
	height: 50px;
	line-height: 50px; 
	margin-top: 30px; 
	border-top-color: rgb(231, 231, 231);
	border-top-width: 1px; 
	border-top-style: solid;
}
.bottom .error{
	color:red;
}

.glyphicon-log-in{  
	color:#fff;
}
.textbox .login{
	background: #2e6da4; 
	padding: 7px 10px; 
	border-radius: 4px; border: 1px solid #2e6da4;
	color: rgb(255, 255, 255); 
	font-weight: bold;
	height: 40px;
    margin-top: 12px;
    padding-left: 25px;
    padding-top: 0;
    /* text-align: center; */
    /* margin: auto; */
    line-height: 40px;
    margin-left:-22px;
	}
</style>
     
<script type="text/javascript">
function toLogin(){
	this.location.href="${pageContext.request.contextPath}/admin/main.jsp";
}

/*验证用户名密码不能为空*/
 function checkText(){
	var userName=$("#userName").val();
	var password=$("#password").val();
	if(userName==null||userName==""){
		$(".error").html("用户名不能为空！");
		return false;
	}
	if(password==null||password==""){
		$(".error").html("密码不能为空！");
		return false;
	}
	return true;	
}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/blogger/login.do" method="post" class="form-horizontal" role="form" onsubmit="return checkText()">
	<div class="top">
	<div class="top_title">
		<p>XUN个人博客   欢迎你</p>
	</div>
	</div>
	<div class="textbox">
	  <div class="form-group">
	    <label class="col-sm-2 control-label"><span class="glyphicon glyphicon-user"></span></label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="userName" id="userName" placeholder="请输入用户名" value="${blogger.userName}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span></label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码" value="${blogger.password}">
	    </div>
	  </div>
	  
		<div class="bottom" >
			<p style="margin: 0px 35px 20px 45px;">
			<span style="float: left;margin-top:8px;font-size:12px;"><a href="${pageContext.request.contextPath}/index.html">个人博客系统</a></span> 
			<span><a class="error" style="line-height:66px;">${requestScope.erroInfo}</a></span>
			 <span style="float: right;">
			 	<span class="glyphicon glyphicon-log-in"></span> 
	              <input class="login" type="submit" value="登录"/> 
	         </span>
	         </p>
	         
	    </div>
	</div>
</form>
</body>
</html>