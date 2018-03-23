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
	<form id = "postForm" method="post">
		
		<div class = "item">
			 <span>部门:</span>
			 <select id="postDept" name = "dept.id" class="easyui-combotree" style="width:173px;"   
        data-options="url:'dept/all',required:true"></select> 
		</div> 
		<div class = "item">
			<input type="hidden" value="0" name = "id"/>
			 <span>职位名称:  </span><input type="text" name = "postName" />
		</div> 
		<div class = "item">
			 <span>职位描述:</span><input type="text" name = "postDesc" />
		</div> 
		 
	</form>
</body>
</html>