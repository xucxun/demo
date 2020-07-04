<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>友情链接管理页面</title>
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
  <!--工具栏：添加、修改、删除 -->
  <div id="toolbar">
	<a href="javascript:openAddLink()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
	<a href="javascript:openEditLink()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	<a href="javascript:deleteLink()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
  </div>
  
  <div id="dlg" class="easyui-dialog" style="width:500px;padding: 10px 20px;"  closed="true" buttons="#dlg-buttons">
	<form id="add" method="post">
		<table cellspacing="8px">
			<tr>
				<td>友情链接名称:</td>
				<td><input type="text" id="linkName" name="linkName" class="easyui-validatebox" required="true"/></td>
			</tr>
			<tr>
				<td>友情链接地址:</td>
				<td><input type="text" id="linkUrl" name="linkUrl" class="easyui-validatebox" required="true"/></td>
			</tr>
			<tr>
				<td>序号:</td>
				<td><input type="text" id="orderNum" name="orderNum" class="easyui-numberbox" required="true" style="width:60px;"/>（友情链接会根据序号从小到大排序）</td>
			</tr>
		</table>
	</form>	
  </div>
  <div id="dlg-buttons">
	<a href="javascript:saveLink()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeLink()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
  </div>
 <script type="text/javascript">
   var url;
	$(function() {
		//datagrid初始化
		$('#dg').datagrid({
		   title:'友情链接管理',
		  //请求数据的url
		   url:'${pageContext.request.contextPath}/admin/link/list.do',
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
				field : 'linkName',
				title : '友情链接名称',
				width : 50,
				align : 'center'
				
			}, {
				field : 'linkUrl',
				title : '友情链接地址',
				width : 100,
				align : 'center'
			}, {
				field : 'orderNum',
				title : '排序序号',
				width : 50,
				align : 'center'
			},
			] ],
		   
		});
	});
	
	//点击添加按钮弹出友情链接添加对话框
	function openAddLink(){
	  //打开对话框并且设置标题
	 $("#dlg").dialog("open").dialog("setTitle","添加友情链接信息");
	  //对话框居中
	  $("#dlg").window('center');   
	  //将url设置为添加
	  url = "${pageContext.request.contextPath }/admin/link/saveLink.do";	
	}
	//点击修改按钮弹出友情链接修改对话框
	function openEditLink(){
	  //对话框居中
	  $("#dlg").window('center');
	  //获取选中要修改的行
       var selectedRows = $("#dg").datagrid("getSelections");
       //判断是否有选择的行
       if(selectedRows.length!=1) {
           $.messager.alert("系统提示", "请选择一条要修改的友情链接信息");
          return;
       }
       //获取选择的数据
       var row = selectedRows[0];		
	   $("#dlg").dialog("open").dialog("setTitle","修改友情链接信息");
	   $("#add").form("load",row);
	   url="${pageContext.request.contextPath}/admin/link/saveLink.do?id="+row.id;
       
	}
	//保存友情链接信息
	function saveLink(){
		$("#add").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},//进行验证，通过才让提交
			success:function(result){
				var result = eval('('+result+')') ;
				if(result.success){
					$.messager.alert("系统提示","友情链接保存成功！");
					resetValue();//保存成功后将内容置空
					//关闭对话框
					$("#dlg").dialog("close");
					//刷新查询结果
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","友情链接保存失败！");
					return;
				}
			}
		});
	}
	//关闭对话框
	function closeLink(){
		$("#dlg").dialog("close");
		resetValue()
		
	}
	//清空对话框
	function resetValue(){
		$("#linkName").val("");
		$("#linkUrl").val("");
		$("#orderNum").val("");
	}
	//点击刷新按钮刷新查询的数据
	function reload(){
		$("#dg").datagrid("reload");
	}
	
	//点击删除按钮删除选中的友情链接
	function deleteLink(){
		//获取选中要删除的行
	     var selectedRows = $("#dg").datagrid("getSelections");
	     if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的友情链接！");
			return;
			}
	     //声明一个数组装选中数据的id
	     var ToRemoveId=[];
	     //循环遍历将选中行的id push进入数组
			for(var i=0;i<selectedRows.length;i++){
				ToRemoveId.push(selectedRows[i].id);
			}
		//循环遍历将选中行的id push进入数组
		var ids=ToRemoveId.join(",");
		 //提示是否确认删除
        $.messager.confirm("系统提示", "<font color=red>您确定要删除选中的"+selectedRows.length+"条友情链接么？</font>", function(r) {
            if(r) {
            	$.post("${pageContext.request.contextPath}/admin/link/deleteLink.do",{ids:ids},function(result){
					if(result.success){
						if(result.exist){
							$.messager.alert("系统提示",result.exist);
						}else{
							$.messager.alert("系统提示","友情链接删除成功!");
						}
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","友情链接删除失败！");
						}
					},"json");
            }
        });
	}
	
</script>
  
</body>
