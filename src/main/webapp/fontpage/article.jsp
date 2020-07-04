<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	//点击重新加载验证码
	function reloadImage(){
	  document.getElementById("randImage").src="${pageContext.request.contextPath}/verifycode.jsp?"+Math.random();
	}
	//提交评论
	function publishComment(){
		//获取用户名
		var userName=$("#userName").val();
		//获取评论内容
		var content=$("#content").val();
		//获取验证码
		var verCode=$("#verCode").val();
		//校验提交评论
		if(content==null||content==''){
			alert("请输入评论内容！");
		}
		else if(userName==null||userName==''){
			alert("请输入用户名！");
		}else if(verCode==null||verCode==''){
			alert("请填写验证码！");
		}
		else{
			$.post("${pageContext.request.contextPath}/comment/saveComment.do",
					{'content':content,'userName':userName,'verCode':verCode,'blog.id':'${blog.id}'},
					function(result){
						if(result.success){
							window.location.reload();
							alert("评论已提交成功");
						}else{
							alert(result.errorInfo);
						}
					},"json");
		}
		
	}
</script>
	<div class="breadcrumbs" id="breadcrumbs">
	<!-- 面包屑导航 --> 
	<ul class="breadcrumb">
		<li>
		<a href="${pageContext.request.contextPath}/index.html">首页</a>
		</li>
		<li class="active">博客内容</li>
	</ul>
	</div>
	<!-- 博客内容 -->
	<div class="article">
	  <div class="article_title"><h1><strong>${blog.title}</strong></h1></div>
	  	<!-- 博客标题 -->
		<div class="article_info">
			<span><a style="color:#e1110b;">${blogger.nickName}</a></span>&nbsp;&nbsp;&nbsp;
			<span>最后发布于<fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></span>&nbsp;&nbsp;&nbsp;			
			<span>阅读数 ${blog.viewNum}</span>&nbsp;&nbsp;&nbsp;
			<span>评论数 ${blog.replyNum}</span>&nbsp;&nbsp;&nbsp;
			<span>博客类别: &nbsp;<a href="${pageContext.request.contextPath}/index.html?typeId=${blogTypeCount.id}" class="article_type">${blog.blogType.typeName}</a></span>
		</div>
		<!-- 博客正文 -->
		<div class="article_content">
			${blog.content}
		</div>
		<!-- 显示上下篇 -->
		<div class="article_lastAndNext"> 
			${pageHtml}
		</div>
	</div>
	
	<!-- 发表评论 -->
	<div class="publish_comment" style="padding: 10px;background-color: #fff;margin-top: 0px;margin-bottom: 10px;border-bottom: 1px solid #E5E5E5;">
		<div style="padding: 15px 15px;">
			<textarea rows="3" style="width:100%" id="content" name="content" placeholder="前方高能，火速评论.."></textarea>
		</div>
		<div style="padding-left:20px;padding-bottom:10px;">
			用户名：<input type="text" name="userName" id="userName" size="10"/>
		</div>
		<div class="verCode" style="padding-left:20px;">
			验证码：<input type="text" name="verCode" id="verCode" size="10" onkeydown="if(event.keyCode==13) publishComment()"/>
			&nbsp;<img src="${pageContext.request.contextPath}/verifycode.jsp" name="randImage" id="randImage"
			title="换一张试试" onclick="javascript:reloadImage()" width="60" height="20" border="1" align="absmiddle">
		</div>
		
		<div class="publishButton" style="padding: 5px 20px;">
			<button class="btn btn-info" type="button" onclick="publishComment()">提交</button>
		</div>
	</div>
	
	<!-- 显示评论 -->
	<div class="comment_list">
	<div class="comment_list_title"> 
		<p>文章评论  &nbsp;&nbsp; <span style="font-size: 15px;
    color: #d9534f;">共${commentList.size()}条评论</span></p>  
	</div>
	<div class="commentDatas">
		<c:choose>
		<c:when test="${commentList.size()==0}">
				暂无评论
			</c:when>
		<c:otherwise>
		 <c:forEach var="comment" items="${commentList}">
		  <div style="text-align:left;margin-left:20px;color: #444;border-bottom: 1px dotted #ccc;margin-bottom: 10px;">					
	      <div><span style="color:#04c;font-size:17px;font-weight:blod;margin-top:10px;">${comment.userName}</span>：</div>
	      <div style="padding-top:5px;"><span>${comment.content}</span></div>
		  <div style="padding-top:5px;padding-bottom: 5px;"><span><fmt:formatDate value="${comment.commentDate}" type="date" pattern="yyyy-MM-dd HH:mm"/>
		  </span></div>
		  </div>
		 </c:forEach>
		</c:otherwise>
		</c:choose>
	</div>			
	   
  </div>
  
  </div>
 



