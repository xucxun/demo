<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入jsp标签 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息页面</title>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<!-- 引入JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<!-- 引入Easyui -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入ueditor1.4文件 -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor1.4/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/ueditor1.4/ueditor.all.min.js"></script>
<!-- zh.js保存为ANSI格式不会乱码 -->
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor1.4/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	//提交修改的博客个人信息
	function EditInfo(){
		//获取博主昵称
		var nickName=$("#nickName").val();
		//获取博主签名
		var sign=$("#sign").val();
		//获取博主个人简介
		var Info=UE.getEditor("editor").getContent();
		
		if(nickName==null||nickName==""){
			$.messager.alert("系统提示","昵称不能为空！");
		}else if(sign==null||sign==""){
			$.messager.alert("系统提示","个性签名不能为空！");
		}else if(info==null||info==""){
			$.messager.alert("系统提示","个人简介不能为空！");
		}else{
			$("#info").val(Info);
			$("#EditInfo").submit();
			
		}
	}
</script>
</head>
<body>
<div id="p" class="easyui-panel" title="修改个人信息" style="padding: 10px" data-options="fit:true">
 	<form id="EditInfo" action="${pageContext.request.contextPath}/admin/blogger/saveInfo.do" method="post"  enctype="multipart/form-data">
	<input type="hidden" id="id" name="id" value="${sessionScope.Blogger.id}"/>
	<input type="hidden" id="info" name="info" value="${sessionScope.Blogger.info}"/>
	
	<table cellspacing="20px">
		<tr>
			<td width="80px">用户名：</td>
			<td><p id="userName">${sessionScope.Blogger.userName}</p></td>
		</tr>
		<tr>
			<td>昵称：</td>
			<td><input type="text" id="nickName" name="nickName" style="width: 200px;" value="${sessionScope.Blogger.nickName}"/></td>
		</tr>
		<tr>
			<td>个性签名：</td>
			<td><input type="text" id="sign" name="sign" style="width: 400px;" value="${sessionScope.Blogger.sign}"/></td>
		</tr>
	
		<tr>
			<td>个人头像：</td>
			<td><input type="file" id="imageFile" name="imageFile" style="width: 400px;"/></td>
		</tr>
	
		<tr>
			<td>个人简介：</td>
			<td>
			<script id="editor" type="text/plain" style="width:100%;"></script>
		</td>
		</tr>

		<tr>
			<td colspan="2" align="center">
				<a href="javascript:EditInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">提交</a>
			</td> 
		</tr>
	</table>
	</form>
</div>
<script type="text/javascript">
	//实例化编辑器
	var ue = UE.getEditor("editor",{
		initialFrameHeight:120, //设置编辑器高度
	});
	ue.addListener("ready",function(){
		//通过ajax获取数据
		UE.ajax.request("${pageContext.request.contextPath}/admin/blogger/find.do",{
			method:"post",
			async: false,
			data:{},
			onsuccess:function(result){
				result = eval("("+result.responseText+")");
				$("#nickName").val(result.nickName);
				$("#sign").val(result.sign);
				UE.getEditor("editor").setContent(result.info);
			}
		});	
	
	});
	
	
</script>
</body>
</html>