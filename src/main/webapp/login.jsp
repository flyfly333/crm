<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html dir="ltr" lang="en-US">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="<%=basePath%>">

	<title>联想后台系统——登录</title>
	<!--- CSS --->
	<link rel="stylesheet" href="login.css" type="text/css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
		
	</script>
	
	</head>

	<body>
		<div id="container">
			<form action="user/getByName" method="post">
				<div class="login">联想后台统登录</div>
				<div class="username-text">用户名:</div>
				<div class="password-text">密码:</div>
				<div class="username-field">
					<input type="text" name="username" value="" />
				</div>
				<div class="password-field">
					<input type="password" name="password" value="" />
				</div>
				<input type="checkbox" id="remember-me" /><label for="remember-me">记住我</label>
				
				<div class="forgot-usr-pwd"></div>
				<input type="submit" name="submit" value="GO" />
			</form>
				<c:if test="${result>0 }">
					<script type="text/javascript">
						alert("123");
						//window.location.href = "admin/index.jsp";
					</script>
				</c:if>
				<c:if test="${result<=0 }">
					<script type="text/javascript">
						alert("账号或密码错误!!!");
					</script>
				</c:if>
		</div>
	</body>
</html>

