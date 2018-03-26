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
				$("#linkmanTable").datagrid({
					pagination : true,
					toolbar : "#tb",
					idField : "id"
				});
			})
			
			function customFormatter(value,row,index){
				if(value.length == 0){
					return "-";
				}
				var str = value.customName;
				return str;
			}
			function userFormatter(value,row,index){
				if(value.length == 0){
					return "-";
				}
				var str = value.userName;
				return str;
			}
			
			function typeFormatter(value,row,index){
				if(value == 0){
					return "联系人";
				}
				return "主联系人";
			}
			
			function setCondition(){
				var postData = {name : $("#linkmanName").val(),"custom.id" : $("#custom_name").combobox("getValue")};
				$("#linkmanTable").datagrid("reload",postData);
			}
		
			function resetCondition(){
				$("#linkmanCondition").form("clear");
			}
			
			function add_linkman(){
				var d = $("<div></div>").appendTo("body");
				d.dialog({
					title : "添加用户",
					iconCls : "icon-add",
					width:500,
					height:300,
					modal:true,
					href : "linkman/toAddlinkman",
					onClose:function(){$(this).dialog("destroy"); },
					buttons:[{
						iconCls:"icon-ok",
						text:"确定",
						handler:function(){
							$("#form1").form("submit",{
								url : "linkman/addlinkman",
								success : function(data){
									d.dialog("close");
									$("#linkmanTable").datagrid("reload");
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
			
			function edit_linkman(){
				var row = $("#linkmanTable").datagrid("getSelected");
				if(row == null){
					return;
				}

				//如果选中了多个，只保留row这个
				$("#linkmanTable").datagrid("clearSelections");
				$("#linkmanTable").datagrid("selectRecord",row.id);
				
				var d = $("<div></div>").appendTo("body");
				d.dialog({
					title : "编辑用户",
					iconCls : "icon-edit",
					width:500,
					height:300,
					modal:true,
					href : "linkman/toAddlinkman",
					onClose:function(){$(this).dialog("destroy"); },
					onLoad:function(){
						//发送异步请求，查询数据
						$.post("linkman/view",{id:row.id},function(data){
							$("#form1").form("load",data);
							$("#address_form").combotree("setValue",data.address.id);
						});
					},
					buttons:[{
						iconCls:"icon-ok",
						text:"确定",
						handler:function(){
							$("#form1").form("submit",{
								url : "linkman/edit",
								success : function(data){
									d.dialog("close");
									$("#linkmanTable").datagrid("reload");
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
			
			function delete_linkman(){
				//1. 获取选中的数据，如果没有选中，则提示必须选中数据
				var selRows = $("#linkmanTable").datagrid("getSelections");
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
						$.post("linkman/batchDelete",postData,function(data){
							if(data.result == true){
								//4. 删除成功后，刷新表格 reload
								$("#linkmanTable").datagrid("reload");
							}
						});
					}
				});
			}
		</script>  
	</head>  
	<body>  
		<h1>我的客户</h1>
		<form id="linkmanCondition">
			<div class="easyui-panel" title="设置查询条件" style="padding:15px 10px;">
				联系人姓名 : <input type="text" name="name" id="linkmanName" />
				对应客户 : 
				<select id="custom_name" name = "customName" class="easyui-combobox" style="width:200px;" 
					data-options="valueField:'id',textField:'customName',url:'custom/getAll'"></select>
				<a id="btn" style="margin-left: 390px;" href="javascript:void(0)" onclick="setCondition();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				<a id="btn" href="javascript:void(0)" onclick="resetCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>
			</div>
		</form>
		<table class="easyui-datagrid" id="linkmanTable" title="My Linkman"
				data-options="url:'linkman/list',fitColumns:true,striped:true,rownumbers:true,iconCls:'icon-search'">
			<thead>
				<tr>
					<th data-options="field:'tyu',checkbox:true"></th>
					<th data-options="field:'id',width:80,align:'center'">编号</th>
					<th data-options="field:'name',width:80,align:'center'">联系人姓名</th>
					<th data-options="field:'workPhone',width:100,align:'center'">工作电话</th>
					<th data-options="field:'movePhone',width:80,align:'center'">移动电话</th>
					<th data-options="field:'email',width:80,align:'center'">邮件地址</th>
					<th data-options="field:'type',width:80,align:'center',formatter:typeFormatter">联系人类型</th>
					<th data-options="field:'custom',width:200,align:'center',formatter:customFormatter">对应客户</th>
					<th data-options="field:'user',width:80,align:'center',formatter:userFormatter">创建人</th>
				</tr>
			</thead>
		</table>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add_linkman();" data-options="iconCls:'icon-add',plain:true">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit_linkman();" data-options="iconCls:'icon-edit',plain:true">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="delete_linkman();" data-options="iconCls:'icon-remove',plain:true">删除</a>
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">导出</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-sum',plain:true">批量导入</a> -->
		</div>
	</body>  
</html>
