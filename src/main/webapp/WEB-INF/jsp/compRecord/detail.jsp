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
				<td class="form-item"><font color="red">*</font>对应客户：</td>
				<td colspan="3">
					 ${detailCompRecord.custom.customName}
				</td>
			</tr>
			<tr>
				<td class="form-item"><font color="red">*</font>服务主题：</td>
				<td colspan="3"> ${detailCompRecord.serTheme}</td>
			</tr>
			<tr>
				<td class="form-item" style="width: 20%">
				 服务类型：
				</td>
				  <td style="width: 30%">
				  	<div id = "serType">-</div>
					 
				 </td>
				<td class="form-item" style="width: 20%"> 服务方式：
				</td>
				<td style="width: 30%" id = "compRecordSerWay">
				  -
					 
				 </td>
			</tr>
			<tr>
				<td class="form-item"><font color="red">*</font>开始时间：</td>
				<td>
					 <fmt:formatDate value="${detailCompRecord.sTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
				</td>
				<td class="form-item"><font color="red">*</font>结束时间：</td>
				<td>
				<fmt:formatDate value="${detailCompRecord.eTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
				</td>
			</tr>
			<tr>
				<td class="form-item">客户联系人：</td>
				<td>
					  ${detailCompRecord.linkman.name}
				</td>
				<td class="form-item">执行人：</td>
				<td>
					  ${detailCompRecord.user.userName}
				</td>
			</tr>
			<tr>
				<td class="form-item">状态：</td>
				<td colspan="3" id = "compRecordStatus"> 
					  
				</td>
			</tr>
			<tr>
				<td class="form-item">服务内容：</td>
				<td colspan="3">
					${detailCompRecord.serContext}
				</td>
			</tr>
			 
			<tr>
				<td class="form-item">备注：</td>
				<td colspan="3"> 
					${detailCompRecord.remark }
				</td>
			</tr> 
		</tbody>
	</table>
     <script type="text/javascript">
 		 var compRecordType = ["答疑","故障排除","培训","升级","其他"];
 		 var compRecordSerWay = ["电话","传真","邮寄","上门","其他"];
 		 var compRecordStatus = ["未处理","处理中","已完成","不用处理"]; 
 		 $("#serType").html(compRecordType[${detailCompRecord.serType}]);
 		 $("#compRecordStatus").html(compRecordStatus[${detailCompRecord.status}]);
 		 $("#compRecordSerWay").html(compRecordSerWay[${detailCompRecord.serWay}])
</script>                           
  
</body>
</html>