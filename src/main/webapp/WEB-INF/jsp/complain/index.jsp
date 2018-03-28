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
	<title>complain List</title>
	<jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="condition" class = "easyui-panel" title = "查询条件">
	<form id = "complainForm">
		UserName : <input type="text" id = "complainName"/> 
		&nbsp;&nbsp;&nbsp;时间&nbsp;&nbsp;<input  id="Sdata" name = "compTime"  type= "text" class= "easyui-datebox"  data-options="editable:false"> </input>
		&nbsp;&nbsp;到&nbsp;&nbsp;<input  id="Edata" name = "compTime"  type= "text" class= "easyui-datebox"  data-options="editable:false"> </input>
	    <a id="btn" href="javascript:void(0)" onclick = "setComplainCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-sum'">查询</a>
		<a id="btn" href="javascript:void(0)" onclick = "reset()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
	</form>
</div>
	<table id = "complainTable" title="投诉列表">
		<thead>
			<th data-options = "field:'abc',width:30,checkbox:true"></th>
			<th data-options = "field:'id',width:30,sortable:true,order:'desc',align:'center'">编号</th>
			<th data-options = "field:'compTheme',width:250,formatter:themeFormatter">投诉主题</th>
			<th data-options = "field:'aaa',width:50,formatter:customFormatter,align:'center'">对应客户</th>
			<th data-options = "field:'compType',width:40,formatter:typeFormatter,align:'center'">投诉分类</th>
			<th data-options = "field:'compTime',width:100,align:'center'">投诉时间</th>
			<th data-options = "field:'compDegree',width:40,formatter:degreeFormatter,align:'center'">紧急程度</th>
			<th data-options = "field:'compResult',width:40,formatter:resultFormatter,align:'center'">处理结果</th>
			<th data-options = "field:'user',width:50,formatter:userFormatter">创建人</th>
		</thead>
	   <tbody>
	</tbody>
</table>
	
<div id="tb_complain">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "add_complain()" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "edit_complain()" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_complain()" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<script type="text/javascript">

	//创建主题自定义列
	function themeFormatter(value,row,index){
		console.log(row.id);
		if (row == null) {
			return "-";
		}
		return "<a href = 'complain/detail?id="+row.id+"'>"+row.compTheme+"</a>"
	}
	//创建人自定义列
	function userFormatter(value,row,index){
		if (row != null && row.user != null) {
			return row.user.userName;
		}else{
			return "-";
		}
	}
	//处理结果数组
	var complainResult = ["未处理","处理中","已完成"];
	//处理结果的自定义列
	function resultFormatter(value,row,index){
		return "<img src = '/images/cl_"+row.compResult+".gif' title = '"+complainResult[row.compResult]+"'/>";
	} 
	//紧急程度的数组
	var complainDegree = ["普通","紧急","非常紧急"];
	//紧急程度的自定义列
	function degreeFormatter(value,row,index){
		return "<img src = '/images/ts_"+row.compDegree+".gif' title = '"+complainDegree[row.compDegree]+"'/>";
	}
	//投诉类型的数组
    var complainType = ["产品投诉","服务投诉","客户意见","其他"];
		
	//返回投诉分类
	function typeFormatter(value,row,index) {
		if (row != null && row.compType > 0) {
			return complainType[row.compType];
		}else{
			return "-";
		}
	}
	//返回客户名称
	function customFormatter(value,row,index){
		if (row != null && row.custom != null) {
			return row.custom.shortName;
		}else{
			return "-";
		}
	}
	 
	//修改用户方法
	function edit_complain(){
		var row = $("#complainTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择信息!");
			return;
		}
		//选中最多的只保留最先选中的
		$("#complainTable").datagrid("clearSelections");
		$("#complainTable").datagrid("selectRecord",row.id);
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改投诉信息',
			width:500,
			height:'auto',
			modal:true,
			href:'complain/form',
			onClose:function (){ $(this).dialog("destroy"); },
			onLoad:function (){ 
				$.post("complain/getComplainById",{id:row.id},function (data){
					$("#complainForm2").form("load",data);
					$("#complainCustomId").combobox("setValue",data.custom.id);
					$("#Stime").datetimebox("setValue",data.compTime);
				})
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#complainForm2").form("submit",{
						url : "complain/edit",
						success : function(data){ 
							console.log(data);
							d.dialog("close");
							$("#complainTable").datagrid("reload");
							alert("修改成功！");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#complainTable").datagrid("clearSelections");
				}
			}]
			 
		})
	}
	
	 
	//添加方法
	function add_complain(){
		 var d = $("<div></div>").appendTo("body");
		 d.dialog({
			 title:'添加投诉信息',
			 width:500,
			 height:500,
			 modal:true,
			 href:'complain/form',
			 onClose:function (){ $(this).dialog("destroy");},
			 buttons:[{
				 iconCls:'icon-ok',
				 text:'确定',
				 handler:function (){ 
					 
					 console.log($("#complainForm2"));
					  $("#complainForm2").form("submit",{
						 url:'complain/add',
						 success:function (data){
							 alert("添加成功！");
							 $("#complainTable").datagrid("reload");
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
		function delete_complain(){
			var ids = $("#complainTable").datagrid("getSelections");
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
					$.post("complain/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#complainTable").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		 
		
		
		//撤销条件点击事件
		function reset(){
			$("#complainForm").form("clear");
		}

		//设置查询条件
		function setComplainCondition(){ 
			console.log($("#Sdata").val())
			var data = {compTheme:$("#complainName").val(),Stime:$("#Sdata").val(),Etime:$("#Edata").val()}; 
			$("#complainTable").datagrid("reload",data); 
	    }
		
		 
		
		$(function (){  
			 //datagrid 组件
			$("#complainTable").datagrid({
				url:"complain/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-search",
				pagination:true,
				toolbar:"#tb_complain",
				idField:"id" 
			});
		}) 
		
		 
	</script>	  
</body>
</html>