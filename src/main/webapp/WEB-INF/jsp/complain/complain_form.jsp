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
	<form id = "complainFrom" method="post">
		<div class = "item">
			<input type="hidden" value="0" name = "id"/>
			 <span>投诉主题:  </span><input type="text" class="easyui-textbox" name = "compTheme" />
		</div>
		<div class = "item">
			 <span>投诉类型:  </span>
			  <select name = "compType"  class="easyui-combobox" style = "width: 173px" data-options = "panelHeight:100,editable:false" >
			 	<option value = "1">产品投诉</option>
			 	<option value = "2">服务投诉</option>
			 	<option value = "3">客户意见</option>
			 	<option value = "4">其他</option>
			  </select>
		</div>
		 
		<div class = "item">
			 <span>投诉时间:  </span>
			 <input  id="Sdata" name = "compTime"  type= "text" class= "easyui-datebox"  data-options="editable:false"> </input>
		</div>
		<div class = "item">
			<span>投诉人:  </span>
			<input type="text" name = "compUser"/>
		</div>
		<div class = "item"> <span>紧急程度:  </span>
			 <input type="radio" name="compDegree" value="1" checked="checked">普通
			 <input type="radio" name="compDegree" value="2">紧急
			 <input type="radio" name="compDegree" value="3">非常紧急
		</div>
		 <div class = "item"> <span>处理结果:  </span>
			 <input type="radio" name="compResult" value="1" checked="checked">未处理
			 <input type="radio" name="compResult" value="2">处理中
			 <input type="radio" name="compResult" value="3">处理完成
		</div> 
		<div class = "item">
			 <span>描述: </span> 
			<textarea name="compDesc" rows="4" cols="40"></textarea>
		</div>
		 <div class = "item">
			 <span>处理过程: </span> 
			<textarea name="compDesc" rows="4" cols="40"></textarea>
		</div>  
	</form>
</body>
</html>