<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
 	<base href="<%=basePath %>">
	<meta charset="UTF-8">
	<title>Post List</title>
	<jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="postCondition" class = "easyui-panel" title = "查询条件">
	<form id = "postForm1">
		职位名称 : <input type="text" id = "postName"/> 
	    <a id="btn" href="javascript:void(0)" onclick = "setUserCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		<a id="btn" href="javascript:void(0)" onclick = "reset()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
	</form>
</div>
	 <table id = "postTable" >
	 	  <thead> 
	 	  	<th data-options = "field:'123',width:30,checkbox:true"></th>
	 	  	<th data-options = "field:'id',width:30">编号</th>
	 	  	<th data-options = "field:'postName',width:60">职位名称</th>
	 	  	<th data-options = "field:'sas',width:50,formatter:deptFormatter">所属部门</th>
	 	  	<th data-options = "field:'postDesc',width:100">描述</th> 
	 	  </thead>
	 </table>
	
<div id="tb">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "add_post()" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "edit_post()" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_post()" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<script type="text/javascript">

	 
	//自定义列（部门名称）
	function deptFormatter(value,row,index){
		return row.dept.text;
	}
	
	 
	//修改角色方法
	function edit_post(){
		var row = $("#postTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择角色!");
			return;
		}
		//选中最多的只保留最先选中的
		$("#postTable").datagrid("clearSelections");
		$("#postTable").datagrid("selectRecord",row.id);
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改角色',
			width:500,
			height:'auto',
			modal:true,
			href:'post/form',
			onClose:function (){ $(this).dialog("destroy"); },
			onLoad:function (){ 
				$.post("post/getPostById",{id:row.id},function (data){
					console.log(data);
					$("#postForm").form("load",data);
					$("#postDept").combotree("setValue",data.dept.id);
					 
				})
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#postForm").form("submit",{
						url : "post/edit",
						success : function(data){ 
							console.log(data);
							d.dialog("close");
							$("#postTable").datagrid("reload");
							alert("修改成功！");
							$("#postTable").datagrid("clearSelections");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#postTable").datagrid("clearSelections");
				}
			}]
			 
		})
	}
	
	 
	//添加方法
	function add_post(){
		 var d = $("<div></div>").appendTo("body");
		 d.dialog({
			 title:'添加职位',
			 width:500,
			 height:'auto',
			 modal:true,
			 href:'post/form',
			 onClose:function (){ $(this).dialog("destroy");},
			 buttons:[{
				 iconCls:'icon-ok',
				 text:'确定',
				 handler:function (){  
					   $("#postForm").form("submit",{
						 url:'post/add',
						 success:function (data){
							 alert("添加成功！");
							 $("#postTable").datagrid("reload");
							 d.dialog("close");
						 }
					 })  
				 }
			 },{
				 iconCls:'icon-cancel',
				 text:'取消',
				 handler:function (data){
					 d.dialog("close");
				 }
				 
			 }]
		 });
	}
	 	 
	//自定义弹框方法
	function alert(message){
		$.messager.show({
			title:'提示信息',
			msg:message,
			timeout:1000,
			showType:'slide',
			showSpeed:200,
			style:{
				right:'1000',
				top:0,
				bottom:''
			}
		})
		
	}

		//删除方法
		function delete_post(){
			var ids = $("#postTable").datagrid("getSelections");
			if (ids.length == 0) {
				$.messager.alert("提示","请选择要删除的行！","warning");
				return;
			}
			$.messager.confirm("确定","确定要删除么?",function (r){
				//如果点击的是确认按钮
				if (r) {
					var idStr = "ids=" + ids[0].id;
					for (var i = 1; i < ids.length; i++) {
						idStr += "&ids=" + ids[i].id;
					}
					$.post("post/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#postTable").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		//撤销条件点击事件
		function reset(){
			$("#postForm1").form("clear");
		}

		//设置查询条件
		function setUserCondition(){ 
			var data = {name:$("#name").val()};  
			$("#postTable").datagrid("reload",data); 
	    }
		
		 
		 
		
		$(function (){  
			 //datagrid 组件
			$("#postTable").datagrid({
				url:"post/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-more",
				pagination:true,
				toolbar:"#tb",
				idField:"id" 
				 
			});
		})
</script>	  
</body>
</html>