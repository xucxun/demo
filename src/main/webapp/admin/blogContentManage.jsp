<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客内容管理页面</title>
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
</head>
<script type="text/javascript">
	var url;
	$(function() {
	//datagrid初始化
	$('#dg').datagrid({
		   title:'博客内容管理',
		  //请求数据的url
		   url:'${pageContext.request.contextPath}/admin/blog/list.do',
		   fitColumns : true,
		   pagination:true,
		   rownumbers:true,
		   fit:true,
		   loadMsg:'数据加载中...',
		   toolbar:'#toolbar',
		   frozenColumns : [ [ {
				field : 'checkbox',
				checkbox : true
			}, //复选框
			{
				field : 'id',
				title : '编号',
				width : 50,
				align : 'center'
			} //id字段
			] ],
		   columns : [ [ {
				field : 'title',
				title : '标题',
				width : 200,
				align : 'center'
				
			}, {
				field : 'releaseDate',
				title : '博客发布日期',
				width : 50,
				align : 'center'
			},{
				field : 'blogType',
				title : '博客类别',
				width : 50,
				align : 'center',
				formatter: function(value,row,index){
					return formatBlogType(value);
				}//调用公共函数返回博客类别名称
			}
			
			] ],
	   
		});
	});
	//format获取博客类别名称
	function formatBlogType(val,row){
		return val.typeName;
	}
	//输入标题搜索博客
	 function searchBlog(){
	$("#dg").datagrid('load',{"title":$("#search_title").val()});
	}
	//点击修改按钮修改博客内容
	function openEditBlog(){
		//获取选中的博客
		var selectedRows=$("#dg").datagrid("getSelections");
		//判断是否选中至多一条博客
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要修改的博客！");
			return;
		}
		var row=selectedRows[0];
		var url = '${pageContext.request.contextPath}/admin/editBlog.jsp?id='+row.id;
		var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
		$("#dlg").dialog({
			title:'修改博客',
			content: content,
	        fit:true,//大小自适应
	        modal: false,
	        top:0,
	        left:0,
	        resizable:true
		});
		$("#dlg").dialog("open");
	}
	
	//点击刷新按钮刷新查询的数据
	function reload(){
		$("#dg").datagrid("reload");
	}
	//点击删除按钮删除博客
	function deleteBlog(){
		//获取选中的行
		var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length==0){
			 $.messager.alert("系统提示","请至少选择一条要删除的博客");
			 return;
		 }
		 var toRemoveId=[];
		 for(var i=0;i<selectedRows.length;i++){
			 toRemoveId.push(selectedRows[i].id);
		 }
		 //转换为字符串
		 var ids = toRemoveId.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条博客吗？",function(r){
			 if(r){
				 $.post("${pageContext.request.contextPath}/admin/blog/deleteBlog.do",{ids:ids},function(result){
					 if(result.success){
						 $.messager.alert("系统提示","博客已成功删除！");
						 $("#dg").datagrid("reload");
					 }else{
						 $.messager.alert("系统提示","博客删除失败！"); 
					 }
				 },"json");//通过json传递
			 }
		 });
	}
	
</script>
<body>
	<table id="dg"  class="easyui-datagrid"></table>
  <!--工具栏：搜索、修改、删除博客功能 -->
  <div id="toolbar">
  <div>
	<a href="javascript:openEditBlog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	<a href="javascript:deleteBlog()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
	</div>
	<div>   标题：&nbsp;<input type="text" id="search_title" size="20" onkeydown="if(event.keyCode=13) searchBlog()"/>
			<a href="javascript:searchBlog()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
  </div>
  <div id="dlg">
  </div>
</body>
</html>