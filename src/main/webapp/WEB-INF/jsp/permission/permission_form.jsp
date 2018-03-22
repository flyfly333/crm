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
	<form id = "permissionForm" method="post">
		<div class = "item">
			 <span>父级权限:</span>
			 <select id="perParent" name = "per.id" class="easyui-combotree" style="width:173px;"   
        data-options="url:'permission/all',required:true"></select> 
		</div> 
		
		<div class = "item">
			 <input type="hidden" value="0" name = "id"/>
			 <span>权限名称:  </span><input type="text" name = "text" />
		</div>
		
		<div class="item">
		 	<span>权限码:  </span><input type="text" name = "percode" />
		 </div>
		
		<div class = "item">
			 <span>url:  </span><input type="text" name = "url" />
		</div>
		
		<div class = "item">
			 <span>类型:  </span><input type="text" name = "type" />
		</div>
		
		 
		
		<div class = "item">
			 <span>locked: </span><input name = "available" value="1" class="easyui-switchbutton" data-options="onText:'是',offText:'否'">
		</div> 
	</form>
</body>
</html>