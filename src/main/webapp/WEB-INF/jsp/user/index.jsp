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
	<title>user List</title>
	 <jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="condition" class = "easyui-panel" title = "查询条件">
	<form id = "userForm1">
		UserName : <input type="text" id = "username"/>
		Roles:
		<input id="roles"  name="dept"
	    data-options="valueField:'id',textField:'name',url:'role/all',panelHeight:'auto',multiple:true">
	    <a id="btn" href="javascript:void(0)" onclick = "setUserCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-sum'">查询</a>
		<a id="btn" href="javascript:void(0)" onclick = "resetUserCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
	</form>
</div>
	<table id = "dataGrid" title="用户列表">
		<thead>
			<th data-options = "field:'abc',width:30,checkbox:true"></th>
			<th data-options = "field:'id',width:30,sortable:true,order:'desc'">编号</th>
			<th data-options = "field:'userName',width:50">账号</th>
			<th data-options = "field:'userCode',width:40">用户编码</th>
			<th data-options = "field:'salt',width:50">盐值</th>
			<th data-options = "field:'phone',width:40">电话</th>
			<th data-options = "field:'dept1',width:50,formatter:deptFormatter">部门</th>
			<th data-options = "field:'post',width:50,formatter:postFormatter">职位</th>
			<th data-options = "field:'roles',width:120,formatter:roleFormatter">角色</th> 
		</thead>
	   <tbody>
	</tbody>
	</table>
	
<div id="tb">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "add_user()" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "edit_user()" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_user()" data-options="iconCls:'icon-remove',plain:true">删除</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "export_user()" data-options="iconCls:'icon-sum',plain:true">导出</a>
</div>
<script type="text/javascript">

	//返回部门名称
	function deptFormatter(value,row,index){
		if (row != null && row.dept != null) {
			return row.dept.text;
		}else{
			return "-";
		}
	}
	//返回职位名称
	function postFormatter(value,row,index){
		if (row != null) {
			return row.post.postName;
		}else{
			return "-";
		}
	}
	//修改用户方法
	function edit_user(){
		var row = $("#dataGrid").datagrid("getSelected");
		if (row == null) {
			alert("请选择用户!");
			return;
		}
		//选中最多的只保留最先选中的
		$("#dataGrid").datagrid("clearSelections");
		$("#dataGrid").datagrid("selectRecord",row.id);
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改用户',
			width:500,
			height:'auto',
			modal:true,
			href:'user/form',
			onClose:function (){ $(this).dialog("destroy"); },
			onLoad:function (){ 
				$.post("user/getUserById",{id:row.id},function (data){
					console.log(data);
					$("#userForm").form("load",data);
					var rids = new Array();
					$.each(data.roles,function (){
						rids.push(this.id); 
					});
					$("#rids").combobox("setValues",rids);
					$("#post").combobox("setValue",data.post.id);
					$("#dept").combobox("setValue",data.dept.id);
				})
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#userForm").form("submit",{
						url : "user/edit",
						success : function(data){ 
							console.log(data);
							d.dialog("close");
							$("#dataGrid").datagrid("reload");
							alert("修改成功！");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#dataGrid").datagrid("clearSelections");
				}
			}]
			 
		})
	}
	
	//部门下拉框改变事件
	function change(newValue,oldValue){
		$('#post').combobox('reload','post/getPostByDeptId?deptId='+newValue);  
	}
	//添加方法
	function add_user(){
		 var d = $("<div></div>").appendTo("body");
		 d.dialog({
			 title:'添加用户',
			 width:500,
			 height:500,
			 modal:true,
			 href:'user/form',
			 onClose:function (){ $(this).dialog("destroy");},
			 buttons:[{
				 iconCls:'icon-ok',
				 text:'确定',
				 handler:function (){ 
					 $("#userFrom").form("submit",{
						 url:'user/add',
						 success:function (data){
							 alert("添加成功！");
							 $("#dataGrid").datagrid("reload");
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
	function add_user(){
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'添加用户',
			width:500,
			height:'auto',
			modal:true,
			href:'user/form',
			onClose:function (){ $(this).dialog("destroy"); },
			buttons:[{
				iconCls:'icon-ok',
				text:'确定',
				handler:function (){ 
					//提交表单添加数据
					$("#userForm").form("submit",{
						url:'user/add',
						success:function (data){ 
							alert("添加成功!"); 
							$("#dataGrid").datagrid("reload");
							d.dialog("close");
						}
					}); 
				}
			}, {
				iconCls:'icon-cancel',
				text:'取消',
				handler:function (){
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

		//删除方法
		function delete_user(){
			var ids = $("#dataGrid").datagrid("getSelections");
			console.log(ids.length);
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
					$.post("user/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#dataGrid").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		 
		
		
		//撤销条件点击事件
		function resetUserCondition(){
			$("#userForm1").form("clear");
		}

		//设置查询条件
		function setUserCondition(){ 
		var data = {userName:$("#username").val()}; 
		var ids = $("#roles").combobox("getValues");
		for (var i = 0; i < ids.length; i++) {
			console.log(ids[i]);
			data["roles["+i+"].id"] = ids[i];
		} 
		$("#dataGrid").datagrid("reload",data); 
	    }
		
		//拼接角色信息
		function roleFormatter(value,row,index){
			if (value.length > 0) {
				var str = "";
				for (var i = 0; i < value.length; i++) {
					str += value[i].name + ", "
				}
				return str;
			}else{
				return "-";
			}
			
		}
		
		$(function (){  
			 //datagrid 组件
			$("#dataGrid").datagrid({
				url:"user/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-search",
				pagination:true,
				toolbar:"#tb",
				idField:"id" 
			});
		}) 
		
		$("#roles").tagbox({
			width:'auto',
			hasDownArrow:true,
			panelMinWidth:150
		}); 
	</script>	  
</body>
</html>