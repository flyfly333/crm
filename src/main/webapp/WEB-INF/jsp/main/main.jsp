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
	<title>CRM客户关系管理系统</title>
	 <jsp:include page="/commont.jsp"></jsp:include>
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true"  >
    	<h1>CRM客户关系管理系统</h1>
    </div>   
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
    	<div id="aa" class="easyui-accordion" style="width:300px;height:200px;">
		    <div title="Title1" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">
				 
		    </div>
		</div>	 
    </div>   
    <div data-options="region:'center' " style=" background:#eee;">
    	<div id="tt" class="easyui-tabs" style="width:500px;height:250px;" data-options = "fit:true">   
		    <div title="Tab1" style="padding:20px;display:none;">   
		        tab1    
		    </div>   
		    <div title="Tab2" data-options="closable:true" style="overflow:auto;padding:20px;display:none;">   
		        tab2    
		    </div>   
		    <div title="Tab3" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;display:none;">   
		        tab3    
		    </div>   
	   </div>  
    </div>   
</body>  
</html>