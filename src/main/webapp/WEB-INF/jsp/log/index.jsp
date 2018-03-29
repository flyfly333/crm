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
	<title>log List</title>
	<jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>
<div id="condition" class = "easyui-panel" title = "查询条件">
	<form id = "logForm">
		<table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
        <tbody><tr>
            <td align="right">操作人员： </td>
             <td> <input id="logUserName"  name="user.userName" class="easyui-textbox" type="text"  class="mytext" style="width:150px;"></td>
             
             <td align="right">日志内容：  </td>
            <td><input id="logContext" name="logContext" class="easyui-textbox" type="text"  class="mytext" style="width:150px;"></td>
             <td align="right">日志类型： </td>
            <td>
				<select id = "logType" class="easyui-combobox" data-options="panelHeight:50,editable:false" name="logType" style="width:100px;">   
				    <option value="1">操作日志</option>   
				    <option value = "0">登录日志</option>   
				</select>  
			</td>
             </tr>
              <tr>
             <td align="right">IP地址： </td>
              <td> <input id="logIp" name="ip" class="easyui-textbox" type="text"  class="mytext" style="width:150px;">  </td>
              <td align="right">操作日期： </td>
              	<td colspan="3">
              	   <input  id="SlogTime" name = "compTime"  type= "text" class= "easyui-datebox"  data-options="editable:false,width:148"> </input>
				  &nbsp;&nbsp;到&nbsp;&nbsp;<input  id="ElogTime" name = "ElogTime"  type= "text" class= "easyui-datebox"  data-options="editable:false,width:148"> </input>
	              <a id="btn" href="javascript:void(0)" onclick = "setLogCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-sum'">查询</a>
				  <a id="btn" href="javascript:void(0)" onclick = "resetLogCondition()" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">撤销</a>
	 		 </td>
             </tr>
        </tbody></table>                
	   </form>
</div>
	<table id = "logTable" title="用户列表">
		<thead>
			<th data-options = "field:'abc',width:30,checkbox:true"></th>
			<th data-options = "field:'id',width:30,sortable:true,order:'desc',align:'center'">编号</th>
			<th data-options = "field:'dateline',width:100,align:'center'">操作时间</th>
			<th data-options = "field:'userName',width:40,align:'center'">操作人</th>
			<th data-options = "field:'ip',width:50,align:'center'">IP地址</th>
			<th data-options = "field:'moduleName',width:40,align:'center'">模块名称</th>
			<th data-options = "field:'logContext',width:250,formatter:logContextFormatter">日志内容</th>
		</thead>
	   <tbody>
	</tbody>
	</table>
	
<div id="tb_log">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "delete_log()" data-options="iconCls:'icon-remove',plain:true">删除</a>
<a href="javascript:void(0)" class="easyui-linkbutton" onclick = "export_log()" data-options="iconCls:'icon-sum',plain:true">导出</a>
</div>
<script type="text/javascript"> 

	function logContextFormatter(value,row,index){
		if (row.logType == 0) {
			return row.user.userName + "登录了系统";
		}else{
			return row.logContext;
		}
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
		function delete_log(){
			var ids = $("#logTable").datagrid("getSelections");
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
					$.post("log/batchDelete",idStr,function (data){
						if (data.result == true) {
							$("#logTable").datagrid("reload");
							alert("删除成功!");
						}
					})
				}
			}); 
		}
		 
		
		
		//撤销条件点击事件
		function resetLogCondition(){
			$("#logForm").form("clear");
		}

		//设置查询条件
		function setLogCondition(){ 
			 
		var data = {
			userName:$("#logUserName").val(),
			moduleName:$("#logModalName").val(),
			logContext:$("#logContext").val(),
			ip:$("#logIp").val(),
			SlogTime:$("#SlogTime").val(),
			ElogTime:$("#ElogTime").val(),
			logType:$("#logType").val()
		}; 
			$("#logTable").datagrid("reload",data); 
	    }
		
		 
		
		$(function (){  
			 //datagrid 组件
			$("#logTable").datagrid({
				url:"log/list",
				rownumbers:true,
				striped:true,
				fitColumns:true,
				iconCls:"icon-search",
				pagination:true,
				toolbar:"#tb_log",
				idField:"id" 
			});
		}) 
		
		 
	</script>	  
</body>
</html>