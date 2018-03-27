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
	<form id = "complainForm2" method="post">
		<div class = "item">
			 <span>对应客户:  </span>
			<input id = "complainCustomId" name = "custom.id" class="easyui-combobox" name="dept"   
    data-options="valueField:'id',textField:'customName',url:'custom/getAll',limitToList:true" style = "width: 220px" />  
		</div>
		<div class = "item">
			<input type="hidden" value="0" name = "id"/>
			 <span>投诉主题:  </span><input type="text" class="easyui-textbox" name = "compTheme" style = "width: 220px" />
		</div>
		
		<div class = "item">
			 <span>投诉类型:  </span>
			  <select name = "compType"  class="easyui-combobox" style = "width: 173px" data-options = "panelHeight:100,editable:false,width:220" >
			 	<option value = "0">产品投诉</option>
			 	<option value = "1">服务投诉</option>
			 	<option value = "2">客户意见</option>
			 	<option value = "3">其他</option>
			  </select>
		</div>
		 
		<div class = "item">
			 <span>投诉时间:  </span>
			 <input  id="Stime" name = "Stime"  type= "text" class= "easyui-datetimebox"  data-options="editable:false" style = "width: 220px"> </input>
		</div>
		<div class = "item">
			<span>投诉人:  </span>
			<input type="text" class="easyui-textbox" name = "compUser" style = "width: 220px"/>
		</div>
		<div class = "item">
			 <span>客户反馈: </span> 
			 <input type = "text" class="easyui-textbox" name = "feedback" style = "width: 220px"/>
		</div>
		<div class = "item"> <span>紧急程度:  </span>
			 <input type="radio" name="compDegree" value="0" >普通
			 <input type="radio" name="compDegree" value="1">紧急
			 <input type="radio" name="compDegree" value="2">非常紧急
		</div>
		 <div class = "item"> <span>处理结果:  </span>
			 <input type="radio" name="compResult" value="0">未处理
			 <input type="radio" name="compResult" value="1">处理中
			 <input type="radio" name="compResult" value="2">处理完成
		</div> 
		<div class = "item">
			 <span>描述: </span> 
			<textarea name="compDesc" rows="2" cols="40"></textarea>
		</div>
		 <div class = "item">
			 <span>处理过程: </span> 
			<textarea name="compCourse" rows="2" cols="40"></textarea>
		</div> 
		<div class = "item">
			 <span>备注: </span>
			<textarea name="compRemark" rows="2" cols="40"></textarea>
		</div>  
	</form>
</body>
</html>