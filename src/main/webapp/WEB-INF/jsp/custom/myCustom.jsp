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
  
		</script>  
	</head>  
	<body>  
		<h1>我的客户</h1>
		<table class="easyui-datagrid" title="My Customer"
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
	</body>  
</html>
