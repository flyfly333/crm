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
				var postData = {customName : $("#customName").val(),customCtage : $("#customCtage").combobox("getValue"),startTime : $("#startTime").val(), endTime : $("#endTime").val()};
				
				
				$("#customTable").datagrid("reload",postData);
			}
		
			function resetCondition(){
				$("#customCondition").form("clear");
			}
			
			function add_custom(){
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
							$("#form1").form("submit",{
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
			
			function edit_custom(){
				var row = $("#customTable").datagrid("getSelected");
				if(row == null){
					return;
				}

				//如果选中了多个，只保留row这个
				$("#customTable").datagrid("clearSelections");
				$("#customTable").datagrid("selectRecord",row.id);
				
				var d = $("<div></div>").appendTo("body");
				d.dialog({
					title : "编辑用户",
					iconCls : "icon-edit",
					width:500,
					height:300,
					modal:true,
					href : "custom/toAddCustom",
					onClose:function(){$(this).dialog("destroy"); },
					onLoad:function(){
						//发送异步请求，查询数据
						$.post("custom/view",{id:row.id},function(data){
							$("#form1").form("load",data);
							$("#address_form").combotree("setValue",data.address.id);
						});
					},
					buttons:[{
						iconCls:"icon-ok",
						text:"确定",
						handler:function(){
							$("#form1").form("submit",{
								url : "custom/edit",
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
			
			function delete_custom(){
				//1. 获取选中的数据，如果没有选中，则提示必须选中数据
				var selRows = $("#customTable").datagrid("getSelections");
				if(selRows.length == 0){
					$.messager.alert("提示","请选择要删除的数据行！","warning");
					return;
				}
				//2. 提示是否删除？是
				$.messager.confirm("提示","确定要删除选中的数据吗？",function(r){
					if(r){
						//3. 发送异步请求，带选中行的编号
						//拼接删除条件
						var postData = "";
						$.each(selRows,function(i){
							postData += "ids="+this.id;
							if(i < selRows.length - 1){
								postData += "&";
							}
						});
						$.post("custom/batchDelete",postData,function(data){
							if(data.result == true){
								//4. 删除成功后，刷新表格 reload
								$("#customTable").datagrid("reload");
							}
						});
					}
				});
			}
		</script>  
	</head>  
	<body>  
		<h1>我的客户</h1>
		<form id="customCondition">
			<div class="easyui-panel" title="设置查询条件" style="padding:15px 10px;">
				客户名称 : <input type="text" name="customName" id="customName" />
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
							<input class="easyui-datebox" id="startTime" name="startTime" data-options="sharedCalendar:'#cc'">
						</td>
						<td>至</td>
						<td>
							<input class="easyui-datebox" id="endTime" name="endTime" data-options="sharedCalendar:'#cc'">
						</td>
					</tr>
				</table>
				<div id="cc" class="easyui-calendar"></div>
				<a id="btn" style="margin-left: 390px;" href="javascript:void(0)" onclick="setCondition();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				<a id="btn" href="javascript:void(0)" onclick="resetCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
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
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add_custom();" data-options="iconCls:'icon-add',plain:true">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit_custom();" data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="delete_custom();" data-options="iconCls:'icon-remove',plain:true">删除</a>
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导出</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-sum',plain:true">批量导入</a> -->
		</div>
	</body>  
</html>
