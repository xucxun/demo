<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入jsp标签 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写博客页面</title>
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
<style>

</style>
</head>
<body>
<div id="p" class="easyui-panel" title="写博客" style="padding:10px" data-options="fit:true">
<table cellspacing="20px" style="height:350px;">
	<tr>
		<td width="80px">博客标题：</td>
		<td><input type="text" id="title" name="title" style="width: 400px;"/></td>
	</tr>
	<tr>
		<td>所属类别：</td>
		<td>
			<select class="easyui-combobox"  id="blogTypeId" name="blogType.id" style="width: 154px;" editable="false" panelHeight="auto">
				<option value="">---请选择博客类别---</option>
				<c:forEach var="blogType" items="${blogTypeCountList}">
					<option value="${blogType.id}">${blogType.typeName}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>博客内容：</td>
		<td>
			<script id="editor" type="text/plain" style="width:100%;"></script>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<a href="javascript:publishBlog()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">发布博客</a></td>
	</tr>
</table>
</div>
<script type="text/javascript">
	//实例化编辑器
	var ue = UE.getEditor("editor",{
		initialFrameHeight:200//设置编辑器高度
	});
	//发表博客
	function publishBlog(){
		//获取博客标题
		var title=$("#title").val();
		//获取博客类别id
		var blogTypeId=$("#blogTypeId").combobox("getValue");
		//获取内容 
		var content=UE.getEditor('editor').getContent();
		//截取正文（无标签）前200字符 作为博客摘要
		var summary=UE.getEditor('editor').getContentTxt().substr(0,200);
		//校验
		if(title==null || title==''){
			$.messager.alert("系统提示","请输入标题！");
		}else if(blogTypeId==null || blogTypeId==''){
			$.messager.alert("系统提示","请选择博客类别！");
		}else if(content==null || content==''){
			$.messager.alert("系统提示","请编辑博客内容！");
		}else{
			$.post("${pageContext.request.contextPath}/admin/blog/saveBlog.do",
				{
					'title':title,
					'blogType.id':blogTypeId,
					'content':content,
					'contentNoTag':UE.getEditor('editor').getContentTxt(),
					'summary':summary				
					},
					function(result){
						if(result.success){
							$.messager.alert("系统提示","博客发布成功！");
						}else{
							$.messager.alert("系统提示","博客发布失败！");
						}
				},"json");
		}
	}
</script>
<script type="text/javascript">
</script>
</body>
</html>