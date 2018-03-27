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
	<table class="form" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody><tr>
                                        <td class="form-item">对应客户：
                                        </td>
                                        <td colspan="3">
                                            <span id="KhName">${detailComplain.custom.customName}</span>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">投诉主题：
                                        </td>
                                        <td colspan="3">
                                            <span id="Zhuti">${detailComplain.compTheme}</span>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" style="width: 20%">投诉人：
                                        </td>
                                        <td style="width: 30%">
                                            <span id="Jiedai">${detailComplain.compUser}</span>&nbsp;
                                        </td>
                                        <td class="form-item" style="width: 20%">投诉分类：
                                        </td>
                                        <td style="width: 30%">
                                            <span id="Fenlei"></span>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">描述：
                                        </td>
                                        <td colspan="3">
                                            <span id="Miaoshu">${detailComplain.compDesc}</span>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">投诉时间：
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${detailComplain.compTime}" pattern = "yyyy-MM-dd hh:mm:ss"/>&nbsp;
                                        </td>
                                        <td class="form-item">处理结果：
                                        </td>
                                        <td colspan="3">
                                            <span id="Jieguo">complainResult[${detailComplain.compResult}]</span>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">紧急程度：
                                        </td>
                                        <td colspan="3">
                                            <span id="Chengdu">complainDegree[${detailComplain.compDegree}]</span>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">处理过程：
                                        </td>
                                        <td colspan="3">
                                            <span id="Guocheng">${detailComplain.compCourse}</span>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                    </tr>
                                    <tr>
                                        <td class="form-item">客户反馈：
                                        </td>
                                        <td colspan="3">
                                            <span id="Fankui">${detailComplain.feedback }</span>&nbsp;
                                        </td>
                                    </tr>
                                     
                                    <tr>
                                        <td class="form-item">备注：
                                        </td>
                                        <td colspan="3">
                                            <span id="Beizhu">${detailComplain.compRemark}</span>&nbsp;
                                        </td>
                                    </tr>
                                     
                                    <tr>
                                        <td align="center" colspan="4">
                                            <input id="Button2" type="button" value="返 回" onclick="history.go(-1)" class="mybtn">
                                        </td>
                                    </tr>
                                </tbody></table>
                                
  <script type="text/javascript">
		//紧急程度的数组
		var complainDegree = ["普通","紧急","非常紧急"];
		//投诉类型的数组
	    var complainType = ["产品投诉","服务投诉","客户意见","其他"];
	  	//处理结果数组
		var complainResult = ["未处理","处理中","已完成"];
	  	$("#Jieguo").html(complainResult[${detailComplain.compResult}]);
	  	$("#Chengdu").html(complainDegree[${detailComplain.compDegree}]);
	  	$("#Fenlei").html(complainType[${detailComplain.compType}]);
	</script>
</body>
</html>