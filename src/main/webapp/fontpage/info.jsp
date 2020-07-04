<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="breadcrumbs" id="breadcrumbs">
	<!-- 面包屑导航 --> 
	<ul class="breadcrumb">
		<li>
		<a href="${pageContext.request.contextPath}/index.html">首页</a>
		</li>
		<li class="active">关于博主</li>
	</ul>
	</div>
<div class="data_list">
	<div class="data_list_title" style="font-size: 18px;padding-left: 20px;">
		关于博主
	</div>
	<div style="padding:30px">
		${blogger.info}
	</div>

</div>