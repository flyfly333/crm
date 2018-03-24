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
	 
</head>
<body>
	<form id = "questionForm" method="post">
		 <div class = "item">
			<input type="hidden" value="0" name = "id"  />
			<span>问题名称:  </span><input type="text" name = "question" style="width : 300px" />
		</div>
		 <div class = "item">
			 <span>答案:  </span><textarea rows="10" cols="50" name = "answer"></textarea>
		</div> 
		
		<div class = "item">
			 <span>搜索关键字:  </span><input type="text" name = "hintText" style="width : 300px" />
		</div>
		  
		<div class = "item">
			 <span>类型: </span>
			 <select name = "type" style="width : 300px">
			 	<option value = "产品问题">产品问题</option>
			 	<option value = "服务问题">服务问题</option>
			 	<option value = "商务问题">商务问题</option>
			 	<option value = "技术问题">技术问题</option>
			 </select>
		</div>   
	</form>
</body>
</html>