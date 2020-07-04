<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入 Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrapValidator.min.css">
<!-- 引入标题图片 -->
<link rel="SHORTCUT ICON" href="${pageContext.request.contextPath}/favicon.ico" >
 <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<!-- 引入 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/zh_CN.js"></script>

<title>个人博客系统后台页面</title>
<script type="text/javascript">
</script>
</head>
<style>
	html,body{
    width:100%;
    height:100%;  
    margin:0px;
}
    #main{
        width:100%;
        height:100%;
        display:flex;
        flex-wrap: wrap;
        flex-direction:row;
        justify-content: start;
    }
    li{
        list-style:none;
    }
 
    a{	
    	color:#23527c;
        text-decoration: none;
    }
    a:focus{
    text-decoration: none;
    }
     a:hover{
     text-decoration: none;
     color:#4d97d9;
     }
    li:hover{
        list-style:none;
    }
	.container{
	width:100%;
	}
	.panel-group a{
	cursor: pointer;
	}
	.panel-group li{
	padding-left:25px;
	}
	.panel-group .panel-body{
	padding-left:25px;
	} 
	.list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
 	background-color:#e0ecff;
 	text-shadow:none;
 	background-image:none;
 }
 .footer{
 	height:30px;
 	position: fixed;
        bottom: 0;
        padding-left:49%;
 }
 .modal-dialog {  
    margin: 200px auto;  
}  
.modal-body {
 	padding-left:40px;
 }
 .modal-body #editform{
 	padding-left:20px;
 }
 #editform .form-group{
 	margin-bottom:20px;
 }
 #editform .form-group:last-of-type{
 
 	margin-left:200px;
 	padding-top:15px;
}
</style>
<body>
<div class=main">
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="个人博客系统" href="#" style="padding-left:60px;"> 个人博客系统</a>
       </div>
       <div class="collapse navbar-collapse">
           <ul class="nav navbar-nav navbar-right">
               <li role="presentation">
                   <a>欢迎你： <span class="badge">${sessionScope.Blogger.userName}</span></a>
               </li>
            </ul>
       </div>
    </div>      
</nav>
	<!-- 左侧菜单栏 -->
<div class="container">
  <div class="col-sm-2">
  	<div class="panel-group" id="accordion">
  <!-- 博客管理 -->
	   <div title="博客管理" class="panel panel-default">
	    <div class="panel-heading">
	      <h4 class="panel-title">
	        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
	        <span class="glyphicon glyphicon-book"></span>&nbsp博客管理&nbsp</a>
	      </h4>
	    </div>
	    <div role="tabpanel" id="collapse1" class="panel-collapse collapse in">
	      <ul class="list-group">
	         <li role="presentation" class="linkactive list-group-item">
	         <a title="写博客"  href="#tab1-1" aria-controls="tab1-1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-pencil">&nbsp写博客</span></a></li>
	         <li role="presentation" class="list-group-item">
	         <a title="博客内容管理" href="#tab1-2" aria-controls="tab1-2" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-edit">&nbsp博客内容管理</span></a></li>
	      </ul>
	    </div>
	  </div>
  <!-- 博客类别管理 -->
	  <div title="博客类别管理" class="panel panel-default">
	    <div class="panel-heading">
	      <h4 class="panel-title">
	        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
	        <span class="glyphicon glyphicon-th-list"></span>&nbsp博客类别管理&nbsp</a>
	      </h4>
	    </div>
	    <div role="tabpanel" id="collapse2" class="panel-collapse collapse">
	      <ul class="list-group">
	         <li role="presentation" class="list-group-item">
	     <a href="#tab2-1" aria-controls="tab2-1" role="tab" data-toggle="tab" title="博客类别信息管理"><span class="glyphicon glyphicon-th-list">&nbsp博客类别信息管理</span></a></li>
	     </ul>
	     </div>
	    </div>
  <!-- 评论管理 -->
  <div title="评论管理" class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
        <span class="glyphicon glyphicon-comment"></span>&nbsp评论管理&nbsp</a>
      </h4>
    </div>
    <div role="tabpanel" id="collapse3" class="panel-collapse collapse">
      <ul class="list-group">
	    <li role="presentation" class="list-group-item">
	     <a title="评论信息管理" href="#tab3-1" aria-controls="tab3-1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-comment">&nbsp评论信息管理</span></a></div>
  </div>
  <!-- 留言信息管理 -->
  <div title="留言信息管理" class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
        <span class="glyphicon glyphicon-list-alt"></span>&nbsp留言信息管理&nbsp</a>
      </h4>
    </div>
    <div role="tabpanel" id="collapse4" class="panel-collapse collapse">
      <ul class="list-group">
	    <li role="presentation" class="list-group-item">
	     <a title="留言信息管理" href="#tab4-1" aria-controls="tab4-1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-list-alt">&nbsp留言信息管理</span></a></div>
  </div>
  <!-- 个人信息管理 -->
  <div title="个人信息管理" class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">
        <span class="glyphicon glyphicon-user"></span>&nbsp个人信息管理&nbsp</a>
      </h4>
    </div>
    <div classs="tabpanel" id="collapse5" class="panel-collapse collapse">
      <ul class="list-group">
	    <li role="presentation" class="list-group-item">
	     <a title="修改个人信息" href="#tab5-1" aria-controls="tab5-1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-user">&nbsp修改个人信息</span></a></div>
  </div>
  <!-- 系统管理 -->
  <div title="系统管理" class="panel panel-default">
	    <div class="panel-heading">
	      <h4 class="panel-title">
	        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">
	        <span class="glyphicon glyphicon-cog"></span>&nbsp系统管理&nbsp</a>
	      </h4>
	    </div>
	    <div id="collapse6" class="panel-collapse collapse">
	     <ul class="list-group">
	       <li role="presentation" class="list-group-item">
	         <a title="友情链接管理" href="#tab6-1" aria-controls="tab6-1" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-link">&nbsp友情链接管理</span></a>
	       </li>
	       <li role="presentation" class="list-group-item">
	         <a  class="editPwd" title="修改密码" href="#tab6-2" aria-controls="tab6-2" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-asterisk">&nbsp修改密码</span></a>
	         </li>
	       <li role="presentation" class="list-group-item">
	         <a onclick="logout()" title="安全退出" href="#tab6-3" aria-controls="tab6-3" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-log-out">&nbsp安全退出</span></a>
	        </li>
	      </ul>
	    </div>
	  </div>
</div>
</div>
<div class="col-md-10">
<div class="breadcrumbs" id="breadcrumbs">
	<!-- 面包屑导航 -->
	<ul class="breadcrumb">
		<li>
		<a href="${pageContext.request.contextPath}/admin/main.jsp">Home</a>
		</li>
		<li class="active"></li>	
	</ul>
	</div>
<!-- 内容展示页 -->
<div class="tab-content">
	 <div role="tabpanel" class="tab-pane active" id="tab1-0">
		<div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
	</div>
	<div role="tabpanel" class="tab-pane" id="tab1-1">
		<iframe id="iframe-page-content" src="${pageContext.request.contextPath}/admin/writeBlog.jsp"  style="zoom: 0.7;width:100%;" height="800" src="" frameBorder="0" width="99.6%"></iframe>
	</div>
	<div role="tabpanel" class="tab-pane" id="tab1-2">
		<iframe id="iframe-page-content" src="${pageContext.request.contextPath}/admin/blogContentManage.jsp" style="zoom: 0.7;width:100%;" height="800" src="" frameBorder="0" width="99.6%"></iframe>
	</div>
	<div role="tabpanel" class="tab-pane" id="tab2-1">
		<iframe id="iframe-page-content" src="${pageContext.request.contextPath}/admin/blogTypeMsg.jsp" style="zoom: 0.7;width:100%;" height="650" src="" frameBorder="0" ></iframe>
	</div>
	<div role="tabpanel" class="tab-pane" id="tab3-1">
		<iframe id="iframe-page-content" src="${pageContext.request.contextPath}/admin/commentManage.jsp" style="zoom: 0.7;width:100%;" height="800" src="" frameBorder="0" width="99.6%"></iframe>
	</div>
	<div role="tabpanel" class="tab-pane" id="tab4-1">
		<iframe id="iframe-page-content" src="${pageContext.request.contextPath}/admin/messageManage.jsp" style="zoom: 0.7;width:100%;" height="650" src="" frameBorder="0" width="99.6%"></iframe>
	</div>
	<div role="tabpanel" class="tab-pane" id="tab5-1">
		<iframe id="iframe-page-content" src="${pageContext.request.contextPath}/admin/editInfo.jsp" style="zoom: 0.7;width:100%;" height="800" src="" frameBorder="0" width="99.6%"></iframe>
	</div>
	<div role="tabpanel" class="tab-pane" id="tab6-1">
		<iframe id="iframe-page-content" src="${pageContext.request.contextPath}/admin/linkManage.jsp" style="zoom: 0.7;width:100%;" height="650" src="" frameBorder="0" width="99.6%"></iframe>
	</div>
</div><!-- content -->
</div>
</div><!-- container -->
</div>
	<div class="footer">
	<strong>© CopyRight   2020   XUN的个人博客系统  </strong>
	</div>
<!-- 修改密码boostrap模态框 -->
<div class="modal fade" id="PwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			
			<div class="modal-body">
				<form id="editform">
                    <div class="form-group" style="margin-top:20px">   
                    	<label> 用户名：</label>     
                        <input type="text" id="userName" name="userName" readonly="readonly" value="${sessionScope.Blogger.userName}" style="width:200px;margin-left:27px;"/>
                    </div>
                    <div class="form-group">        
                        <label> 新密码：</label>
                        <input type="password" id="newPassword" name="newPassword"  required="true" style="width:200px;margin-left:27px;"/>
                    </div>
                    <div class="form-group">        
                        <label> 确认新密码：</label>
                        <input type="password" id="newPassword2" name="newPassword2"  required="true" style="width:200px"/>
                        <div style="display: inline" id="tip"></div>
                    </div>
                            
                    <div class="form-group">
                        <span id="returnMessage" class="glyphicon"> </span>
                        <button type="button" class="btn btn-default right" data-dismiss="modal" class="closeEdit">关闭</button>
                        <button id="savePwd" type="button" class="btn btn-primary">保存</button>
					 </div>	
			</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
var url;
	$(function() {
		//var height=document.documentElement.clientHeight;
		//document.getElementById('iframe-page-content').style.height=height+'px';
		
		$(".list-group li").click(function() {
		      $(".list-group .linkactive").removeClass('linkactive active');
		      $(this).addClass('linkactive');
		      
		      var title = $(".linkactive a").attr("title");
		      console.log(title);
		      $(".breadcrumb .active").text(title);
		  });
		
		   
	});
	var menuClick = function(menuUrl) {
		$("#iframe-page-content").attr('src',menuUrl);
	};
	//打开修改密码的模态框样式
	 $(".editPwd").click(function() {
		 $('#PwdModal').modal('show'); 
		 url="${pageContext.request.contextPath}/admin/blogger/editPwd.do?id=${sessionScope.Blogger.id}";
		 $("#newPassword").val("");
		 $("#newPassword2").val("");
		 
	 });
   
	 	//定义bootstrapValidator表单样式
		 $('#editform').bootstrapValidator({	
			 message: '输入值不合法',
	         feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove', 
	            validating: 'glyphicon glyphicon-refresh'
	            },
	         fields: {
	        	 newPassword: {
	                    validators: {
	                        notEmpty: {//检测非空
	                            message: '请输入密码'
	                        },
	                    }
	                },
				newPassword2: {	       
		                validators: {
			                notEmpty: {
			                  message: '请确认新密码'
			              },
			               identical: {//与指定控件内容比较是否相同，比如两次密码不一致
			                  field: 'newPassword',//指定控件name
			                  message: '两次输入的密码不同'
			              },
			
			         }
			     }
	         }
		 });
	 //校验并提交表单参数
	 $("#savePwd").click(function(){
		 var newPassword=$("#newPassword").val();
		 var newPassword2=$("#newPassword2").val(); 
		 $("#editform").bootstrapValidator('validate');
		 if ($("#editform").data('bootstrapValidator').isValid()) {
			 $.ajax({
	                url: url,
	                async: false,
	                type: 'post',
	                data:{"newPassword":newPassword,"newPassword2":newPassword},	          
	                success:function(result){
	            	 var result = eval('('+result+')');
	            	 console.log(result);
	 				if(result.success){
	 					$("#returnMessage").hide().html('<label class="label label-danger">密码修改成功，下次登录生效!</label>').show(300);
	 					
	 				}else{
	 				    $("#returnMessage").hide().html('<label class="label label-danger">密码修改失败!</label>').show(300);
	 					return;
	 				}
	 			}
	 		});
		 }
	 });
	 //退出系统
	 function logout(){
		 alert("您确定要退出系统吗？");
		 window.location.href="${pageContext.request.contextPath}/admin/blogger/logout.do";
	 }
	 
</script>

</body>
</html>
