<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<jsp:include page="/commont.jsp"></jsp:include>
</head>
<body>

	<table class="form" border="0" cellpadding="0" cellspacing="0"
		width="100%">
		<tbody>
			<tr>
				<input type = "hidden" name = "id" value="0"/>
				<td class="form-item"> 对应客户：</td>
				<td colspan="3">${detailContactRecord.custom.customName }</td>
			</tr> 
			<tr>
				<td class="form-item"> 主题：</td>
				<td > ${detailContactRecord.contactTheme }</td>
				<td class="form-item">客户联系人：</td>
				<td> ${detailContactRecord.linkmanName}</td> 
			</tr> 
			<tr>
				<td class="form-item" style="width: 20%">
				 交往类型：
				</td>
				  <td style="width: 30%" id = "contactType">  </td>
				<td class="form-item" style="width: 20%"> 日期： </td>
				<td style="width: 30%">
					<fmt:formatDate value="${detailContactRecord.contactTime}" pattern="yyyy-MM-dd"/>
				</td>
			</tr> 
			<tr>
				<td class="form-item">行动描述：</td>
				<td colspan="3"> ${detailContactRecord.contactDesc}</td>
			</tr>
			<tr>
				<td class="form-item">参与人员：</td>
				<td colspan="3">未完成 </td>
			</tr> 
		</tbody>
	</table>
     <script type="text/javascript">
     var contactRecordSerWay = ["电话","上门","来访接待","会议","培训","商务餐饮","外出活动","其他"];
 		 $("#contactType").html(contactRecordSerWay[${detailContactRecord.contactType}]);
 		 
 		 
 		 
</script>                           
  
</body>
</html>