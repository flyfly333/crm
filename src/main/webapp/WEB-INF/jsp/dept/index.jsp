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
	<title>部门列表</title>
	<jsp:include page="/commont.jsp"></jsp:include>
	<script type="text/javascript">
	//删除部门
	function delete_dept(){
		var row = $("#deptTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择部门!");
			return;
		}
		if (row.children.length > 0) {
			alert("该部门还有子部门不能删除！");
			return;
		}
		
		$.messager.confirm("提示","确定要删除么？",function (r){
			if (r) {
				$.post("dept/delete",{id:row.id},function (data){
					if (data.result) {
						alert("删除成功！");
						$("#deptTable").treegrid("reload");
					}
				})
				
			}
		})
		
		
		
	}
	
	
	//修改部门
	function edit_dept(){
		var row = $("#deptTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择部门！");
			return;
		} 
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改部门',
			href:'dept/form',
			width:500,
			height:'auto',
			modal:true,
			onClose:function (){$(this).dialog("destroy");},
			onLoad:function (){
				$.post("dept/getById",{id:row.id},function (data){
					var parentid = 0;
					if (data.parentid >= 0) {
						parentid = data.parentid;
					}   
					//设置父级的选项
					$('#deptParent').combotree('setValue',parentid); 
					$("#deptForm").form("load",data); 
				}) 
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){ 
					$("#deptForm").form("submit",{
						url:'dept/update',
						success:function (data){
						console.log(data);
						alert("修改成功！");
						$("#deptTable").treegrid("reload");
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

	//添加部门
	function add_dept(){
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'添加部门',
			href:'dept/form',
			width:500,
			height:'auto',
			modal:true,
			onClose:function (){$(this).dialog("destroy");},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){ 
					$("#deptForm").form("submit",{
						url:'dept/add',
						success:function (data){
							console.log(data);
							alert("添加成功！");
							$("#deptTable").treegrid("reload");
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
		$("#deptTable").treegrid({
			toolbar:"#tb",
			idField:"id",
			treeField:"text",
			animate:true,
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
	<table id="deptTable"  title="dept List"
        data-options="url:'dept/list2',fitColumns:true,striped:true,iconCls:'icon-search'">
    <thead>
        <tr> 
            <th data-options="field:'text',width:100,sortable:true">部门名称</th>
			<th data-options="field:'deptPrincipal',width:50">部门负责人</th>
            <th data-options="field:'deptPhone',width:100">部门电话</th>
            <th data-options="field:'deptFax',width:100">部门传真</th>
           	<th data-options="field:'remark',width:150">备注</th> 
        </tr>
    </thead>
</table>
<div id="tb">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add_dept();" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit_dept();" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="delete_dept();" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
</body>
</html>