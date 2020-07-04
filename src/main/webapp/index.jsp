<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人博客系统</title>
<!-- 引入 Bootstrap --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static//css/blog.css">
<!-- 引入标题图片 -->
<link rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/favicon.ico" >
 <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<!-- 引入 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<!-- 引入日历插件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/moment-with-locales.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-datetimepicker.min.css">
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap-datetimepicker.min.js"></script>
<style type="text/css">  
	body{
		background:url('${pageContext.request.contextPath}/static/images/bg.png') repeat;
	}
	a:hover,a:visited {
	text-decoration: none;
	
	}
	a:hover{
	 color:#d9534f; 
	}
	
	.navbar-header .navbar-brand {
    color: #000;
	}
	.navbar-default .navbar-nav>.active>a{
	color:#000;
	}
	.navbar-default .navbar-nav > li > a {
	color:#333;
    padding: 15px 20px;
    margin-left:15px;
	}
	.navbar-default .navbar-nav > li > a:hover{
	color: #2e6da4;
	}
	.navbar-default .navbar-nav >.login> a:hover{
	color: #000;
	}
	#date1{
		background-color: #fff;
		margin-bottom:10px;
	}
	
	.footer{
	width:100%; 
 	height:30px;
 	align:center;
 	text-align: center;
	padding: 20px 0;       
 	}
 	.datas #type_list li{
	border: 1px solid #ccc;
    float: left;
    padding: 5px;
    border-radius: 5px;
    margin-right:10px;
	}
 	.blogs:hover{
 	box-shadow: 0 8px 8px rgba(10, 16, 20, .24), 0 0 8px rgba(10, 16, 20, .12);
 	}
 	.blogs:hover .title a{
	color:#337ab7; 
	}
	.pagination{
	background-color: #ffffff;
    margin-top: 10px;
    padding-left: 35%;
    padding-top:10px;
    font-size: 15px;
    color: #ed0a03;
    width: 100%;
    height: 50px;
    line-height: 50px;
	}
	.article .article_info a:hover{
    color:#337ab7;
    cursor: pointer;
    }
    .breadcrumb{
    background-color:#fff;
    } 
</style>
<script type="text/javascript">
	$(function () {
    $(".navbar-nav").find("li").each(function () {
      var a = $(this).find("a:first")[0];
      if ($(a).attr("href") === location.pathname) {
        $(this).addClass("active");
      } else {
        $(this).removeClass("active");
      }
    });
  })
	
	$(function () {  
    $('#date1').datetimepicker({  
        format: 'YYYY-MM-DD',  
        locale: moment.locale('zh-cn')  
    }); 
    $('#date1').datetimepicker('show');
    });
	
	$(document).ready(function() {
	    //首先将#btn隐藏
	    $("#btn").hide();
	    //当滚动条的位置处于距顶部50像素以下时，跳转链接出现，否则消失
	    $(function() {
	      $(window).scroll(function() {
	        if ($(window).scrollTop() > 50) {
	          $("#btn").fadeIn(200);
	        } else {
	          $("#btn").fadeOut(200);
	        }
	      });
	      //当点击跳转链接后，回到页面顶部位置
	      $("#btn").click(function() {
	        $('body,html').animate({
	          scrollTop: 0 
	        },
	        500);
	        return false;
	      });
	    });
	  });
</script>  
</head>
<body>
	<nav class="navbar navbar-default"" role="navigation">
	<div class="container">
    <div class="navbar-header">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">XUN个人博客</a>
    </div>
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/index.html">首页</a></li>
            <li><a href="#">随笔</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/blogger/aboutBlogger.html">关于博主</a></li>
            <li><a href="${pageContext.request.contextPath}/message.html">留言板</a></li>
        </ul>   
    <ul class="nav navbar-nav navbar-right">
      <li class="login"><a href="${pageContext.request.contextPath}/login.jsp"><span class="glyphicon glyphicon-pencil" style="color:#fe0700;"></span>&nbsp&nbsp写博客&#160&#160&#160&#160<span style="color:#000;" class="glyphicon glyphicon-log-in"></span> 登录</a></li>
    </ul>
	</div>
	</div>
</nav>
<div class="container">
	<div class="row"> 
		<div class="col-md-3">
			<!-- 博主信息 -->
			<div class="blogger_list">
				<div class="blogger_list_title">
					<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;博主信息
				</div>
				<div class="user_image"> 
					<img class="img-circle" src="${pageContext.request.contextPath}/static/images/${blogger.imagePath}"/>
				</div>
				<div class="nickName">${blogger.nickName}</div>		
				<div class="userSign">${blogger.sign}</div>
			</div> 
			<!-- 日历插件 -->
			<div class="input-group datepicker date" id='date1'>  
       		 <input type="hidden" class="form-control">  
    		</div>  
    		<!-- 博客分类 -->
			<div class="data_list">
				<div class="data_list_title">
					<span class="glyphicon glyphicon-tags"></span> &nbsp;&nbsp;博客分类
				</div>
				<div class="datas">
					<ul id="type_list" style="height:80px;">
					 <c:forEach var="blogTypeCount" items="${blogTypeCountList}">
					  <li><span><a href="${pageContext.request.contextPath}/index.html?typeId=${blogTypeCount.id}">${blogTypeCount.typeName}(${blogTypeCount.blogCount})</a></span></li>
					 </c:forEach>
					</ul>
				</div>
			</div>
			<!-- 归档 -->
			<div class="data_list">
				<div class="data_list_title">
					<span class="glyphicon glyphicon-file"></span> &nbsp;&nbsp;归档
				</div>
				<div class="datas">
				 <ul>					
					<c:forEach var="blogCount" items="${blogCountList}">
					 <li><span><a href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blogCount.releaseDateStr}">${blogCount.releaseDateStr}(${blogCount.blogCount})</a></span></li>
					</c:forEach>
				 </ul>
				</div>
			</div>
			<!-- 友情链接 -->
			<div class="data_list">
				<div class="data_list_title">
					<span class="glyphicon glyphicon-link"></span> &nbsp;&nbsp;友情链接
				</div>
				<div class="datas">
				 <ul>
					<c:forEach var="link" items="${linkList}">
					 <li><span><a href="${link.linkUrl}" target="_blank">${link.linkName}</a></span></li>
					</c:forEach>
				</ul>
				</div>
			</div>
		
			
		</div>
		<div class="col-md-9">	
			<jsp:include page="${ListPage}"></jsp:include>
		</div>
		
		
	</div>	
</div>
<div class="footer">
	<strong>© CopyRight   2020   XUN的个人博客系统  </strong>
</div>
<div>
<a href="javascript:;" id="btn" title="回到顶部"style="width:50px; 
         height:50px; position:fixed; right:30px; bottom:10px; 
         background:url('${pageContext.request.contextPath}/static/images/top.png') no-repeat center #000;">
 </a>
</div>

<!--网页背景特效引入  -->
<script type="text/javascript" color="0,0,0" pointColor="255,0,255" opacity='0.7' zIndex="-2" count="99" src="${pageContext.request.contextPath}/static/effect/canvas-nest.js"></script>
</body>
</html>