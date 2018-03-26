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
	<form id = "deptForm" method="post">
		<div class = "item">
			 <span>父级部门:</span>
			 <select id="deptParent" name = "dept.id" class="easyui-combotree" style="width:173px;"   
        data-options="url:'dept/list',required:true"></select> 
		</div> 
		
		<div class = "item">
			 <input type="hidden" value="0" name = "id"/>
			 <span>部门名称:  </span><input type="text" name = "text" />
		</div>
		
		<div class = "item">
			 <span>部门编码:  </span><input type="text" name = "deptCode" />
		</div>
		
		<div class="item">
		 	<span>负责人:  </span><input type="text" name = "deptPrincipal" />
		 </div>
		
		<div class = "item">
			 <span>部门电话:  </span><input type="text" name = "deptPhone" />
		</div>
		
		<div class = "item">
			 <span>部门传真:  </span><input type="text" name = "deptFax" />
		</div>
		
		<div class = "item">
			 <span>备注:  </span><input type="text" name = "remark" />
		</div> 
	</form>
</body>
</html>