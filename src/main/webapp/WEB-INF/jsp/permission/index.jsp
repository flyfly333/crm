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
	<title>权限列表</title>
	<jsp:include page="/commont.jsp"></jsp:include>
	<script type="text/javascript">
	//删除权限
	function delete_permission(){
		var row = $("#permissionTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择权限!");
			return;
		}
		if (row.children.length > 0) {
			alert("该权限还有子权限不能删除！");
			return;
		}
		
		$.messager.confirm("提示","确定要删除么？",function (r){
			if (r) {
				$.post("permission/delete",{id:row.id},function (data){
					if (data.result) {
						alert("删除成功！");
						$("#permissionTable").treegrid("reload");
					}
				})
				
			}
		})
		
		
		
	}
	
	
	//修改权限
	function edit_permission(){
		var row = $("#permissionTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择权限！");
			return;
		}
		/* if (row.children.length > 0) {
			alert("该权限还有子权限不能删除！");
			return;
		} */
		 
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改权限',
			href:'permission/form',
			width:500,
			height:'auto',
			modal:true,
			onClose:function (){$(this).dialog("destroy");},
			onLoad:function (){
				$.post("permission/getById",{id:row.id},function (data){
					var parentid = 0;
					if (data.per != null) {
						parentid = data.per.id;
					} 
					//设置父级的选项
					$('#perParent').combotree('setValue',parentid); 
					$("#permissionForm").form("load",data);
					//禁用父级组件
					$("#perParent").combo("disable");
				}) 
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){ 
					$("#permissionForm").form("submit",{
						url:'permission/update',
						success:function (data){
						console.log(data);
						alert("修改成功！");
						$("#permissionTable").treegrid("reload");
					}
					})
					 d.dialog("close"); 
				   } 
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
				}
			}]
			
		})
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

	//添加权限
	function add_permission(){
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'添加权限',
			href:'permission/form',
			width:500,
			height:'auto',
			modal:true,
			onClose:function (){$(this).dialog("destroy");},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){ 
					$("#permissionForm").form("submit",{
						url:'permission/add',
						success:function (data){
							console.log(data);
							alert("添加成功！");
						}
						
					})
					 d.dialog("close"); 
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
				}
			}]
			
		})
	}
	
	function avaFormatter(value,row,index){
		if (row.available > 0) {
			return "是";
		}else{
			return "否";
		}
		
	}
	$(function(){
		$("#permissionTable").treegrid({
			toolbar:"#tb_permission",
			idField:"id",
			treeField:"text",
			animate:true,
			onLoadSuccess : function(){
				//$(this).treegrid("collapseAll");
			},
			loadFilter:function(data){
				 $.each(data,function (){
					 this.state = "closed";
				 })
				 return data;
			}    
		});
	});
</script>
</head>
<body>
	<table id="permissionTable"  title="Permission List"
        data-options="url:'permission/list',fitColumns:true,striped:true,iconCls:'icon-search'">
    <thead>
        <tr> 
            <th data-options="field:'text',width:100,sortable:true">权限名称</th>
            <th data-options="field:'percode',width:50">权限码</th>
            <th data-options="field:'available',width:100,formatter:avaFormatter">是否可用</th>
            <th data-options="field:'url',width:150">Url</th>
        </tr>
    </thead>
</table>
<div id="tb_permission">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add_permission();" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit_permission();" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="delete_permission();" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
</body>
</html>