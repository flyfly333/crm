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
	<title>Title</title>
</head>
<body>
	<form id = "roleForm" method="post">
		<div class = "item">
			<input type="hidden" value="0" name = "id"/>
			 <span>角色名称:  </span><input type="text" name = "name" />
		</div> 
		<div class = "item">
			 <span>是否锁定:</span><input name = "available" value="1" class="easyui-switchbutton" data-options="onText:'是',offText:'否'">
		</div>
	</form>
</body>
</html>