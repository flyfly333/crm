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
	<title>question List</title>
	 <jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="condition" class = "easyui-panel" title = "查询条件">
	<form id = "questionForm2">
		问题或答案 : <input class="easyui-textbox" type="text" id = "questionname" name = "question"/>
		&nbsp;&nbsp;&nbsp;问题类型: <select id="questionType" class="easyui-combobox" name="type"  " data-options="panelHeight:120,width:100">   
				    <option value="">&nbsp;</option> 
				    <option value="产品问题">产品问题</option> 
				    <option value="服务问题">服务问题</option>
				    <option value="商务问题">商务问题</option>
				    <option value="技术问题">技术问题</option> 
				</select>  

	    <a id="btn" href="javascript:void(0)" onclick = "setQuestionCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-sum'">查询</a>
		<a id="btn" href="javascript:void(0)" onclick = "reset()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
	</form>
</div>
	<table id = "questionTable" title="问题列表">
		<thead>
			<th data-options = "field:'abc',width:30,checkbox:true"></th>
			<th data-options = "field:'id',width:30,sortable:true,order:'desc'">编号</th>
			<th data-options = "field:'abcc',width:200,formatter:titleFormatter ">问题</th>
			<th data-options = "field:'type',width:40">类型</th>
			<th data-options = "field:'hintText',width:50">关键词</th>
		</thead>
	   <tbody>
	</tbody>
	</table>
	
<div id="tb_question">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "add_question()" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "edit_question()" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_question()" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<script type="text/javascript">

	//返回题目的自定义方法
	function titleFormatter(value,row,index){ 
		return "<a href = 'javascript:void(0)' onclick = 'detail("+row.id+")'>"+row.question+" </a>";
	}
	//查看详情模态框
	function detail(id){
		$.post("question/getQuestionById",{id:id},function (data){
			console.log(data);
			var d = $("<div></div>").appendTo("body");
			d.dialog({
				title:'查看详情',
				width:800,
				height:'auto',
				modal:true,
				href:'question/form',
				onClose:function (){ $(this).dialog("destroy"); },
				onLoad:function (){
						$("#questionForm").form("load",data); 
						$("#questionForm input").attr("readonly",true);
						$("#questionForm textarea").attr("readonly",true);
						$("#questionForm select").attr("disabled","disabled");
				},
				buttons:[ {
					iconCls:"icon-cancel",
					text:"关闭",
					handler:function(){
						d.dialog("close");
						$("#questionTable").datagrid("clearSelections");
					}
				}]
				 
			})
		 
		})
	}
	 
	//修改问题方法
	function edit_question(){
		var row = $("#questionTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择问题!");
			return;
		}
		//选中最多的只保留最先选中的
		$("#questionTable").datagrid("clearSelections");
		$("#questionTable").datagrid("selectRecord",row.id);
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改问题',
			width:800,
			height:'auto',
			modal:true,
			href:'question/form',
			onClose:function (){ $(this).dialog("destroy"); },
			onLoad:function (){ 
				$.post("question/getQuestionById",{id:row.id},function (data){
					console.log(data);
					$("#questionForm").form("load",data);
				})
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#questionForm").form("submit",{
						url : "question/edit",
						success : function(data){ 
							console.log(data);
							d.dialog("close");
							$("#questionTable").datagrid("reload");
							alert("修改成功！");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#questionTable").datagrid("clearSelections");
				}
			}]
			 
		})
	}
	
	 
	//添加方法
	
	function add_question(){
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'添加问题',
			width:800,
			height:'auto',
			modal:true,
			href:'question/form',
			onClose:function (){ $(this).dialog("destroy"); },
			buttons:[{
				iconCls:'icon-ok',
				text:'确定',
				handler:function (){ 
					//提交表单添加数据
					/* $.get("question/add",{question:'miaolong',answer:'miaolong',hintText:'mmiaolong',type:'123'},function (){
						alert("添加成功！");
						d.dialog("close");
					}) */
					  $("#questionForm").form("submit",{
						url:'question/add',
						success:function (data){ 
							alert("添加成功!"); 
							$("#questionTable").datagrid("reload");
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
		function delete_question(){
			var ids = $("#questionTable").datagrid("getSelections");
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
					$.post("question/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#questionTable").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		 
		
		
		//撤销条件点击事件
		function reset(){
			$("#questionForm2").form("clear");
		}

		//设置查询条件
		function setQuestionCondition(){ 
			var data = {question:$("#questionname").val(),type:$("#questionType").val()}; 
			$("#questionTable").datagrid("reload",data); 
	    }
		
		$(function (){  
			 //datagrid 组件
			$("#questionTable").datagrid({
				url:"question/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-search",
				pagination:true,
				toolbar:"#tb_question",
				idField:"id" 
			});
		}) 
		
		 
	</script>	  
</body>
</html>