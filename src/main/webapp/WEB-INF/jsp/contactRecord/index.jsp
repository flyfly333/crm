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
	<title>交往记录列表</title>
	<jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="contactRecordCondition" class = "easyui-panel" title = "查询条件">
<form id = "contactRecordForm" action="">
		<table cellspacing="0" cellpadding="0" width="100%" border="0"
			class="form">
			<tbody>
				<tr>
					<td align="right">交往主题：</td>
					<td>
						<input type="text" class="easyui-textbox" id = "contactTheme"/> 
					</td>
					<td align="right">对应客户：</td>
					<td> 
						<input id = "custom"  class="easyui-combobox" name="dept"   
    data-options="valueField:'id',textField:'customName',url:'custom/getAll',limitToList:true" style = "width: 220px" />  
					</td>
					  
					<td align="right">日期：</td>
					<td colspan="3">
					 <input  id="Qstime"  type= "text" class= "easyui-datebox"  data-options="editable:false" style = "width: 120px"> </input> 至  
					 <input  id="Qetime"  type= "text" class= "easyui-datebox"  data-options="editable:false" style = "width: 120px"> </input>
					 <a id="btn" href="javascript:void(0)" onclick = "setContactRecordCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-sum'">查询</a>
					 <a id="btn" href="javascript:void(0)" onclick = "resetContactRecordCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
					</td>
				</tr>
			</tbody>
</table>
</form>

		

</div>
	<table id = "contactrecordTable" title="交往记录列表">
		<thead>
			<th data-options = "field:'abc',width:30,checkbox:true"></th>
			<th data-options = "field:'id',width:30,sortable:true,order:'desc',align:'center'">编号</th>
			<th data-options = "field:'contactTheme',width:250,formatter:contactThemeFormatter">交往主题</th>
			<th data-options = "field:'custom',width:50,formatter:contactCustomFormatter,align:'center'">对应客户</th>
			<th data-options = "field:'contactType',width:40,formatter:contactTypeFormatter,align:'center'">交往类型</th>
			<th data-options = "field:'linkmanName',width:100,align:'center'">联系人</th>
			<th data-options = "field:'contactTime',width:100,align:'center'">交往时间</th>
			<th data-options = "field:'user',width:40,formatter:contactUserFormatter,align:'center'">创建人</th>
		</thead>
	   <tbody>
	</tbody>
</table>
	
<div id="tb_contactrecord">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "add_contactrecord()" data-options="iconCls:'icon-add',plain:true">添加</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "edit_contactrecord()" data-options="iconCls:'icon-edit',plain:true">修改</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_contactrecord()" data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>
<script type="text/javascript">

	//设置查询条件
	function setContactRecordCondition(){ 
	//console.log($("#contactRecordCondition #Qstime").val() == "");
	//console.log($("#contactRecordCondition #custom").val())
		var data = {contactTheme:$("#contactRecordCondition #contactTheme").val(),
				 sTime:$("#contactRecordCondition #Qstime").val(),
				 eTime:$("#contactRecordCondition #Qetime").val(), 
				"custom.id":$("#contactRecordCondition #custom").val(),
				"custom.id":$("#contactRecordCondition #custom").val() 
		}; 
		$("#contactrecordTable").datagrid("reload",data); 
	}

	//创建交往主题自定义列
	function contactThemeFormatter(value,row,index){
		if (row == null) {
			return "-";
		}
		return "<a href = 'contactrecord/detail?id="+row.id+"'>"+row.contactTheme+"</a>"
	}
	//交往类型列
	var contactRecordSerWay = ["电话","上门","来访接待","会议","培训","商务餐饮","外出活动","其他"];
	function contactTypeFormatter(value,row,index){
		if (row.contactType != null) {
			return contactRecordSerWay[row.contactType];
		}else{
			return "-";
		}
	}
	//执行人自定义列
	function contactUserFormatter(value,row,index){
		if (row != null && row.user != null) {
			return row.user.userName;
		}else{
			return "-";
		}
	}
	 
	
		
	 
	//返回客户名称
	function contactCustomFormatter(value,row,index){
		if (row != null && row.custom != null) {
			return row.custom.shortName;
		}else{
			return "-";
		}
	}
	 
	//修改交往信息方法
	function edit_contactrecord(){
		var row = $("#contactrecordTable").datagrid("getSelected");
		if (row == null) {
			alert("请选择信息!");
			return;
		}
		//选中最多的只保留最先选中的
		$("#contactrecordTable").datagrid("clearSelections");
		$("#contactrecordTable").datagrid("selectRecord",row.id);
		var d = $("<div></div>").appendTo("body");
		d.dialog({
			title:'修改交往信息',
			width:850,
			height:450,
			modal:true,
			href:'contactrecord/form',
			onClose:function (){ $(this).dialog("destroy"); },
			onLoad:function (){ 
				$.post("contactrecord/getContactRecordById",{id:row.id},function (data){
					$("#contactrecordForm2").form("load",data); 
					$("#contactLinkman").combobox("setValue",data.linkmanName);
					$("#contactCustom").combobox("setValue",data.custom.id);
					$("#contactCreateUser").combobox("setValue",data.user.id);
					$("#contactTime").datebox("setValue",data.contactTime);
					$("#contactType").combobox("setValue",data.contactType);
				})
			},
			buttons:[{
				iconCls:"icon-ok",
				text:"确定",
				handler:function(){
					$("#contactrecordForm2").form("submit",{
						url : "contactrecord/edit",
						success : function(data){ 
							console.log(data);
							d.dialog("close");
							$("#contactrecordTable").datagrid("reload");
							alert("修改成功！");
						}
					});
				}
			},{
				iconCls:"icon-cancel",
				text:"取消",
				handler:function(){
					d.dialog("close");
					$("#contactrecordTable").datagrid("clearSelections");
				}
			}]
			 
		})
	}
	
	 
	//添加方法
	function add_contactrecord(){
		 var d = $("<div></div>").appendTo("body");
		 d.dialog({
			 title:'添加交往信息',
			 width:850,
			 height:450,
			 modal:true,
			 href:'contactrecord/form',
			 onClose:function (){ $(this).dialog("destroy");},
			 buttons:[{
				 iconCls:'icon-ok',
				 text:'确定',
				 handler:function (){  
					 console.log($("#contactrecordForm2"));
					  $("#contactrecordForm2").form("submit",{
						 url:'contactrecord/add',
						 success:function (data){
							 alert("添加成功！");
							 $("#contactrecordTable").datagrid("reload");
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
		function delete_contactrecord(){
			var ids = $("#contactrecordTable").datagrid("getSelections");
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
					$.post("contactrecord/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#contactrecordTable").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		 
		
		
		//撤销条件点击事件
		function resetContactRecordCondition(){
			$("#contactRecordForm").form("clear");
		}

		
		
		 
		
		$(function (){  
			 //datagrid 组件
			$("#contactrecordTable").datagrid({
				url:"contactrecord/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-search",
				pagination:true,
				toolbar:"#tb_contactrecord",
				idField:"id" 
			});
		}) 
		
		 
	</script>	  
</body>
</html>