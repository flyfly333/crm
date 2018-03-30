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
	<title>客服记录列表</title>
	<jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="compRecordCondition" class = "easyui-panel" title = "查询条件">
<form id = "comRecordForm" action="">
		<table cellspacing="0" cellpadding="0" width="100%" border="0"
			class="form">
			<tbody>
				<tr>
					<td align="right">客服主题：</td>
					<td>
						<input type="text" class="easyui-textbox" id = "serTheme"/> 
					</td>
					<td align="right">对应客户：</td>
					<td> 
						<input id = "custom" name = "custom.id" class="easyui-combobox" name="dept"   
    data-options="valueField:'id',textField:'customName',url:'custom/getAll',limitToList:true" style = "width: 220px" />  
					</td>
					<td align="right">状态：</td>
					<td> 
					<select id="serRecordStatus" class="easyui-combobox" data-options="panelHeight:100,editable:false" style="width:200px;">   
					   <option selected="selected" value="-1">&nbsp;</option>
					   <option value="3">无需处理</option>
					   <option value="0">未处理</option>
					   <option value="1">处理中</option>
					   <option value="2">处理完成</option>
					</select> 
					</td>
				</tr>
				<tr>
					<td align="right">日期：</td>
					<td colspan="4">
					 <input  id="Qstime"  type= "text" class= "easyui-datetimebox"  data-options="editable:false" style = "width: 220px"> </input> 至  
					 <input  id="Qetime"  type= "text" class= "easyui-datetimebox"  data-options="editable:false" style = "width: 220px"> </input>
					 <a id="btn" href="javascript:void(0)" onclick = "setCompRecordCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-sum'">查询</a>
					 <a id="btn" href="javascript:void(0)" onclick = "resetCompRecordCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
					</td>
				</tr>
			</tbody>
</table>
</form>

		

</div>
	<table id = "comprecordTable" title="服务列表">
		<thead>
			<th data-options = "field:'abc',width:30,checkbox:true"></th>
			<th data-options = "field:'id',width:30,sortable:true,order:'desc',align:'center'">编号</th>
			<th data-options = "field:'serTheme',width:250,formatter:serThemeFormatter">服务主题</th>
			<th data-options = "field:'custom',width:50,formatter:serCustomFormatter,align:'center'">对应客户</th>
			<th data-options = "field:'serType',width:40,formatter:serTypeFormatter,align:'center'">服务类型</th>
			<th data-options = "field:'serWay',width:100,align:'center',formatter:serWayFormatter">服务方式</th>
			<th data-options = "field:'status',width:50,formatter:compRecordStatusFormatter,align:'center'">状态</th>
			<th data-options = "field:'sTime',width:100,align:'center'">开始时间</th>
			<th data-options = "field:'user',width:40,formatter:serUserFormatter,align:'center'">执行人</th>
		</thead>
	   <tbody>
	</tbody>
</table>
	
<div id="tb_comprecord">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "add_comprecord()" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "edit_comprecord()" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_comprecord()" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<script type="text/javascript">

	//设置查询条件
	function setCompRecordCondition(){ 
	console.log($("#compRecordCondition #Qstime").val());
		var data = {serTheme:$("#compRecordCondition #serTheme").val(),
				 sTime:$("#compRecordCondition #Qstime").val(),
				 eTime:$("#compRecordCondition #Qstime").val(), 
				status:$("#compRecordCondition #serRecordStatus").val(),
				"custom.id":$("#compRecordCondition #custom").val() 
		}; 
		$("#comprecordTable").datagrid("reload",data); 
	}

	//创建主题自定义列
	function serThemeFormatter(value,row,index){
		 
		if (row == null) {
			return "-";
		}
		return "<a href = 'comprecord/detail?id="+row.id+"'>"+row.serTheme+"</a>"
	}
	//服务类型列
	var compRecordSerWay = ["电话","传真","邮寄","上门","其他"];
	function serWayFormatter(value,row,index){
		if (row.serWay != null) {
			return compRecordSerWay[row.serWay];
		}else{
			return "-";
		}
	}
	//执行人自定义列
	function serUserFormatter(value,row,index){
		if (row != null && row.user != null) {
			return row.user.userName;
		}else{
			return "-";
		}
	}
	//处理结果数组
	var compRecordStatus = ["未处理","处理中","已完成","不用处理"];
	//状态自定义列
	function compRecordStatusFormatter(value,row,index){
		return "<img src = '/images/cl_"+row.status+".gif' title = '"+compRecordStatus[row.status]+"'/>";
	}  
	
		
	//返回投诉分类
	//服务类型的数组
    var compRecordType = ["答疑","故障排除","培训","升级","其他"];
	function serTypeFormatter(value,row,index) {
		if (row != null && row.serType >= 0) {
			return compRecordType[row.serType];
		}else{
			return "-";
		}
	}
	//返回客户名称
	function serCustomFormatter(value,row,index){
		if (row != null && row.custom != null) {
			return row.custom.shortName;
		}else{
			return "-";
		}
	}
	 
	//修改服务信息方法
	function edit_comprecord(){
		var row = $("#comprecordTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择信息!");
			return;
		}
		//选中最多的只保留最先选中的
		$("#comprecordTable").datagrid("clearSelections");
		$("#comprecordTable").datagrid("selectRecord",row.id);
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改服务信息',
			width:850,
			height:450,
			modal:true,
			href:'comprecord/form',
			onClose:function (){ $(this).dialog("destroy"); },
			onLoad:function (){ 
				$.post("comprecord/getCompRecordById",{id:row.id},function (data){
					console.log(data);
					$("#comprecordForm2").form("load",data);
					$("#serCustom").combobox("setValue",data.custom.id);
					$("#serCustomLinkman").combobox("setValue",data.linkman.id);
					$("#serUser").combobox("setValue",data.user.id);
					$("#stime").datetimebox("setValue",data.sTime);
					$("#etime").datetimebox("setValue",data.eTime);
				})
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#comprecordForm2").form("submit",{
						url : "comprecord/edit",
						success : function(data){ 
							console.log(data);
							d.dialog("close");
							$("#comprecordTable").datagrid("reload");
							alert("修改成功！");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#comprecordTable").datagrid("clearSelections");
				}
			}]
			 
		})
	}
	
	 
	//添加方法
	function add_comprecord(){
		 var d = $("<div></div>").appendTo("body");
		 d.dialog({
			 title:'添加服务信息',
			 width:850,
			 height:450,
			 modal:true,
			 href:'comprecord/form',
			 onClose:function (){ $(this).dialog("destroy");},
			 buttons:[{
				 iconCls:'icon-ok',
				 text:'确定',
				 handler:function (){  
					 console.log($("#comprecordForm2"));
					  $("#comprecordForm2").form("submit",{
						 url:'comprecord/add',
						 success:function (data){
							 alert("添加成功！");
							 $("#comprecordTable").datagrid("reload");
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
		function delete_comprecord(){
			var ids = $("#comprecordTable").datagrid("getSelections");
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
					$.post("comprecord/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#comprecordTable").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		 
		
		
		//撤销条件点击事件
		function resetCompRecordCondition(){
			$("#comRecordForm").form("clear");
		}

		
		
		 
		
		$(function (){  
			 //datagrid 组件
			$("#comprecordTable").datagrid({
				url:"comprecord/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-search",
				pagination:true,
				toolbar:"#tb_comprecord",
				idField:"id" 
			});
		}) 
		
		 
	</script>	  
</body>
</html>