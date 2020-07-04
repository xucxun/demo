<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
<!--
.publish_message{
	padding: 10px;
	background-color: #fff;
	margin-top: 0px;
	margin-bottom: 10px;
	border-bottom: 1px solid #E5E5E5;
}
.publish_message p{
	padding-left: 13px;  
    margin-bottom: 0;
    font-size: 22px;
    font-weight: bold;
}
.message_list{
	border: 1px solid #E5E5E5;
	padding: 10px;
	background-color: #fff;
	margin-bottom: 10px;
	}
	.message_list  .message_list_title{
	font-size: 15px;
	font-weight: bold;
	border-bottom: 1px solid #E5E5E5;
	padding-left:5px;
	padding-top: 10px;
	}
	.message_list .messageDatas{
	padding-left: 15px;
    margin-top: 20px;
	}
-->
</style>
<script type="text/javascript">
//提交留言
function publishMessage(){
	//获取用户名
	var userName=$("#userName").val();
	//获取评论内容
	var content=$("#content").val();
	//校验提交留言
	if(content==null||content==''){
		alert("请输入留言内容！");
	}
	else if(userName==null||userName==''){
		alert("请输入用户名！");
	}
	else{
		$.post("${pageContext.request.contextPath}/saveMessage.do",
				{'content':content,'userName':userName},
				function(result){
					if(result.success){
						window.location.reload();
						alert("留言已提交成功");
					}else{
						alert("留言提交失败");
					}
				},"json");
	}
	
}
</script>
	<!-- 导航 --> 
	<div class="breadcrumbs" id="breadcrumbs">
	 <ul class="breadcrumb">
		<li>
		<a href="${pageContext.request.contextPath}/index.html">首页</a>
		</li>
		<li class="active">留言板</li>
	 </ul>
	</div>
	<!-- 发表留言 -->
	<div class="publish_message">
		<p>留言板</p>
		<div style="padding: 15px 15px;padding-top:0;">
			<textarea rows="3" style="width:100%;padding-left: 5px;padding-top: 5px;" id="content" name="content" placeholder="请输入你的留言"></textarea>
		</div>
		<div style="padding-left:20px;padding-bottom:10px;float:left;margin-top:4px;">
			用户名：<input type="text" name="userName" id="userName" size="10"/>
		</div>		
		<div class="publishButton" >
			<button style="margin-left:20px;" class="btn btn-info" type="button" onclick="publishMessage()">提交</button>
		</div>
	</div>
	
	<!-- 显示留言 -->
	<div class="message_list">
	<div class="message_list_title" style="font-size: 15px;color: #d9534f;"> 
		共${messageList.size()}条留言 
	</div>
	<div class="messageDatas">
		 <c:forEach var="message" items="${messageList}">
		  <div style="text-align:left;margin-left:20px;color: #444;border-bottom: 1px dotted #ccc;margin-bottom: 10px;">					
	     	 <div>
	     	   <span style="color:#04c;font-size:17px;font-weight:bold;margin-top:10px;">${message.userName}</span>：&nbsp;&nbsp;
	   		   <span>${message.content}</span></div>
		  	 <div style="padding-top:5px;padding-bottom: 5px;"><span><fmt:formatDate value="${message.date}" type="date" pattern="yyyy-MM-dd HH:mm"/>
		  	 </span>&nbsp;&nbsp;&nbsp;&nbsp;

             </div>
		  </div>	
		 </c:forEach>
	</div>			
	   
  </div>