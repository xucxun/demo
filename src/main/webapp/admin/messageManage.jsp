<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言信息管理页面</title>
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
</head>
<body>
	<table id="dg"  class="easyui-datagrid"></table>
	<div id="toolbar">
	<a href="javascript:deleteComment()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
</div>
<script type="text/javascript">
   var url;
	$(function() {
		//datagrid初始化
		$('#dg').datagrid({
		   title:'留言信息管理',
		  //请求数据的url
		   url:'${pageContext.request.contextPath}/admin/message/list.do',
		   fitColumns : true,
		   pagination:true,
		   rownumbers:true,
		   fit:true,
		   loadMsg:'数据加载中...',
		   pageNumber:1,
		   pageSize : 5,
		   pageList : [ 5, 10, 15, 20 ,25 ],
		   toolbar:'#toolbar',
		   frozenColumns : [ [ {
				field : 'checkbox',
				checkbox : true
			}, //复选框
			{
				field : 'id',
				title : '编号',
				width : 100,
				align : 'center'
			} //id字段
			] ],
		   columns : [ [ {
				field : 'userName',
				title : '用户名称',
				width : 100,
				align : 'center'
			},{
				field : 'content',
				title : '评论内容',
				width : 200,
				align : 'center'
			},{
				field : 'date',
				title : '评论日期',
				width : 50,
				align : 'center'
			}
			] ],
		   
		});
	});
	//点击刷新按钮刷新查询的数据
	function reload(){
		$("#dg").datagrid("reload");
	}
	//点击删除按钮删除留言
	function deleteComment(){
		//获取选中的留言
		var selectedRows = $("#dg").datagrid("getSelections");
		//判断是否有选择的行
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请至少选择一条要删除的留言");
			return;
		}
		//声明一个数组装选中留言的id
		var ToRemoveId=[];
		//循环遍历将选中行的id push进入数组
		for(var i=0;i<selectedRows.length;i++){
			ToRemoveId.push(selectedRows[i].id);
		}
		var ids=ToRemoveId.join(",");
		//提示是否确认删除
		$.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条留言吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/admin/message/deleteMessage.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","留言已成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","留言删除失败！");
					}
				},"json");
			}
		});
		
		
	}
	
</script>
</body>
</html>