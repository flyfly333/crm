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
	<title>Role List</title>
	<jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="roleCondition" class = "easyui-panel" title = "查询条件">
	<form id = "roleForm1">
		角色名称 : <input type="text" id = "name"/> 
	    <a id="btn" href="javascript:void(0)" onclick = "setUserCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		<a id="btn" href="javascript:void(0)" onclick = "reset()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
	</form>
</div>
	 <table id = "roleTable" >
	 	  <thead> 
	 	  	<th data-options = "field:'id',width:30">编号</th>
	 	  	<th data-options = "field:'name',width:60">角色名称</th>
	 	  	<th data-options = "field:'available',width:30,formatter:isable">是否可用</th> 
	 	  	<th data-options = "field:'sas',width:30,formatter:operFormatter">操作</th>
	 	  </thead>
	 </table>
	
<div id="tb">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "add_role()" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "edit_role()" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_role()" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<script type="text/javascript">

	//分配权限列
	//自定义列
	function operFormatter(value,row,index){
		return "<a class = 'opBtn' title = '分配权限' onclick = 'allotPer("+row.id+")' href = 'javascript:void(0)'><img src = 'easyui/themes/icons/large_smartart.png' width='16'></img></a>";
	}
	//分配权限按钮点击事件
	function allotPer(rid){ 
		$("#roleTable").datagrid("clearSelections"); 
		var d  = $("<div></div>").appendTo("body");
		d.dialog({
			title:'分配权限',
			href:'permission/allotPer?rid=' + rid ,
			width:500,
			height:'400',
			modal:true,
			onClose:function (){$(this).dialog("destroy")},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){   
					 var nodes = $("#allotTree").tree("getChecked","checked");
					 var half_nodes = $("#allotTree").tree("getChecked","indeterminate");
					  
					 $.merge(nodes,half_nodes);
					 if (nodes.length == 0) {
						 alert("请选择权限！");
						return;
					  }
					 console.log(nodes);
					 var postDate = "";
					 for (var i = 0; i < nodes.length; i++) {
						postDate += "ids="+nodes[i].id + "&"; 
					 }
					 postDate += "roleId=" + rid;
					 $.post("permission/allotPer",postDate,function (data){
							if (data.result) {
								$.messager.show({
									title:'提示',
									msg:'分配成功!', 
									timeout:'2000'
								});
							}
							d.dialog("close");
						})  
					 
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#roleTable").datagrid("clearSelections");
				}
			}]
		});
		
		
	}
	//是否可用列
	function isable(value,row,index){
		if (row.available == 0) {
			return "否";
		} 
		return "是";
	}
	//修改角色方法
	function edit_role(){
		var row = $("#roleTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择角色!");
			return;
		}
		//选中最多的只保留最先选中的
		$("#roleTable").datagrid("clearSelections");
		$("#roleTable").datagrid("selectRecord",row.id);
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改角色',
			width:500,
			height:'auto',
			modal:true,
			href:'role/form',
			onClose:function (){ $(this).dialog("destroy"); },
			onLoad:function (){ 
				$.post("role/getRoleById",{id:row.id},function (data){
					console.log(data);
					$("#roleForm").form("load",data);
				})
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#roleForm").form("submit",{
						url : "role/edit",
						success : function(data){ 
							console.log(data);
							d.dialog("close");
							$("#roleTable").datagrid("reload");
							alert("修改成功！");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#roleTable").datagrid("clearSelections");
				}
			}]
			 
		})
	}
	
	 
	//添加方法
	function add_role(){
		 var d = $("<div></div>").appendTo("body");
		 d.dialog({
			 title:'添加角色',
			 width:500,
			 height:'auto',
			 modal:true,
			 href:'role/form',
			 onClose:function (){ $(this).dialog("destroy");},
			 buttons:[{
				 iconCls:'icon-ok',
				 text:'确定',
				 handler:function (){  
					   $("#roleForm").form("submit",{
						 url:'role/add',
						 success:function (data){
							 alert("添加成功！");
							 $("#roleTable").datagrid("reload");
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
		function delete_role(){
			var ids = $("#roleTable").datagrid("getSelections");
			 
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
					$.post("role/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#roleTable").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		//撤销条件点击事件
		function reset(){
			$("#roleForm1").form("clear");
		}

		//设置查询条件
		function setUserCondition(){ 
			var data = {name:$("#name").val()};  
			$("#roleTable").datagrid("reload",data); 
	    }
		
		 
		//给角色分配权限
		function allotPermission(rid){
			console.log(rid);
		}
		
		
		$(function (){  
			 //datagrid 组件
			$("#roleTable").datagrid({
				url:"role/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-search",
				pagination:true,
				toolbar:"#tb",
				idField:"id" ,
				onLoadSuccess:function (){
					$("a.opBtn").tooltip({
						position:'right'
					})
				}
			});
		})
</script>	  
</body>
</html>