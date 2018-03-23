<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<base href="<%=basePath%>">  
		<meta http-equiv="Content-Type" content="textml; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="easyui/themes/material/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<script type="text/javascript" src="easyui/jquery.min.js"></script> 
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">  
			$(function(){
				$("#customTable").datagrid({
					pagination : true,
					toolbar : "#tb",
					idField : "id"
				});
			})
			
			function setCondition(){
				var postData = {customname : $("#customname").val(),customCtage : $("#customCtage").combobox("getValue")};
				//var customCtage = $("#customCtage").combobox("getValue");
				
				
				$("#customTable").datagrid("reload",postData);
			}
		
			function resetCondition(){
				$("#customCondition").form("clear");
			}
			
			function add_user(){
				var d = $("<div></div>").appendTo("body");
				d.dialog({
					title : "添加用户",
					iconCls : "icon-add",
					width:500,
					height:300,
					modal:true,
					href : "custom/toAddCustom",
					onClose:function(){$(this).dialog("destroy"); },
					buttons:[{
						iconCls:"icon-ok",
						text:"确定",
						handler:function(){
							$("#customForm").form("submit",{
								url : "custom/addCustom",
								success : function(data){
									d.dialog("close");
									$("#customTable").datagrid("reload");
								}
							});
						}
					},{
						iconCls:"icon-cancel",
						text:"取消",
						handler:function(){
							d.dialog("close");
						}
					}]
				});
			}
		</script>  
	</head>  
	<body>  
		<h1>我的客户</h1>
		<form id="customCondition">
			<div class="easyui-panel" title="设置查询条件" style="padding:15px 10px;">
				客户名称 : <input type="text" name="customname" id="customname" />
				客户阶段 : 
				<select class="easyui-combobox" id="customCtage" name="customCtage" style="width:100px;">
					<option style="height: 15px;" value="">&nbsp;</option>
					<option value="售前跟踪">售前跟踪</option>
					<option value="合同执行">合同执行</option>
					<option value="售后服务">售后服务</option>
					<option value="合同期满">合同期满</option>
					<option value="意外终止">意外终止</option>
				</select>
				创建时间 : 
				
				<table style="display: inline-block;position: absolute;top: 126px;">
					<tr>
						<td>
							<input class="easyui-datebox" data-options="sharedCalendar:'#cc'">
						</td>
						<td>至</td>
						<td>
							<input class="easyui-datebox" data-options="sharedCalendar:'#cc'">
						</td>
					</tr>
				</table>
				<div id="cc" class="easyui-calendar"></div>
				<a id="btn" style="margin-left: 390px;" href="javascript:void(0)" onclick="setCondition();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">Search</a>
				<a id="btn" href="javascript:void(0)" onclick="resetCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">Reset</a>
			</div>
		</form>
		<table class="easyui-datagrid" id="customTable" title="My Customer"
				data-options="url:'custom/list',fitColumns:true,striped:true,rownumbers:true,iconCls:'icon-search'">
			<thead>
				<tr>
					<th data-options="field:'tyu',checkbox:true"></th>
					<th data-options="field:'id',width:80,align:'center'">编号</th>
					<th data-options="field:'shortName',width:80,align:'center'">助记简称</th>
					<th data-options="field:'customName',width:100,align:'center'">客户名称</th>
					<th data-options="field:'customCtage',width:80,align:'center'">客户阶段</th>
					<th data-options="field:'customType',width:80,align:'center'">客户种类</th>
					<th data-options="field:'createTime',width:200,align:'center'">创建时间</th>
				</tr>
			</thead>
		</table>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add_user();" data-options="iconCls:'icon-add',plain:true">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit_user();" data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="delete_user();" data-options="iconCls:'icon-remove',plain:true">删除</a>
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导出</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-sum',plain:true">批量导入</a> -->
		</div>
	</body>  
</html>
