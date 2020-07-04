<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<div class="new_list">
		<span class="glyphicon glyphicon-th-list"></span>&nbsp;&nbsp;最新发布
	</div>
<c:forEach var="blog" items="${blogList}">	
<div class="blogs">
  <ul style="list-style: none;">
	
	<li style="margin-bottom: 30px">
	 <span class="title"><a href="${pageContext.request.contextPath}/article/${blog.id}.html">${blog.title}</a></span>
	 <span class="date"><a href="${pageContext.request.contextPath}/article/${blog.id}.html"><fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy年MM月dd日"/> , <a style="color:#e1110b;">${blogger.nickName}</a></a></span>
	 <span class="summary">&nbsp;&nbsp;${blog.summary}</span>
	 <span class="info"> <span class="glyphicon glyphicon-time"></span>&nbsp;<fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy-MM-dd HH:mm"/>&nbsp;&nbsp;<span class="glyphicon glyphicon-comment"></span>&nbsp;${blog.replyNum} &nbsp;<span class="glyphicon glyphicon-eye-open"></span>&nbsp;${blog.viewNum}  </span>
	</li>
	
  </ul>		
</div>
</c:forEach>
<!-- 分页工具 -->
<div>
	<nav>
	  <ul class="pagination pagination-sm">
	    ${pageHtml}
	    </ul>
	</nav>
 </div>
