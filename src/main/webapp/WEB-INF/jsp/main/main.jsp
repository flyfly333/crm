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
	 <script type="text/javascript">
	 	function addTag(url,title){
	 		console.log(url);
	 		console.log(title);
	 		var tabs = $("#tabs");
	 		if (!tabs.tabs('exists',title)) { 
		 		tabs.tabs('add',{
		 			title:title,
		 			href:"comprecord/index",
		 			fit:true,
		 			closable:true,
		 			iconCls:'icon-search'
		 		})
	 		}else{
	 			tabs.tabs("select",title);
	 		}
	 	}
	 </script>
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true"  >
    	<h1>CRM客户关系管理系统</h1>欢迎你${login_user.userName}${login_user.dept.text}
    </div>   
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
    	<div id="aa" class="easyui-accordion" style="width:300px;height:200px;">
		  
		   <c:forEach items="${login_user.permissions}" var="parent">
		   		<c:if test="${parent.type == 'menu'}">
			   		<div title="${parent.text}" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">
					 	<ul>
					 		<c:forEach items="${login_user.permissions}" var="children">
					 			<c:if test="${children.per.id == parent.id && children.type == 'link'}">
					 				<li><a href = "javascript:void(0)" onclick = "addTag('${children.url}','${children.text}')" >${children.text}</a></li>
					 			</c:if>
					 		</c:forEach>
					 	</ul>
			   		</div>
		   		</c:if>
		   </c:forEach>
		</div>	 
    </div>   
    <div data-options="region:'center' " style=" background:#eee;">
    	<div id="tabs" class="easyui-tabs" style="width:500px;height:250px;" data-options = "fit:true">   
		    <div title="主页" style="padding:20px;display:none;">   
		                        主页   
		    </div>   
	   </div>  
    </div>   
</body>  
</html>