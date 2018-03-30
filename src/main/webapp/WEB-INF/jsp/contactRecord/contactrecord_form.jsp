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
<form id = "contactrecordForm2" action="">
	<table class="form" border="0" cellpadding="0" cellspacing="0"
		width="100%">
		<tbody>
			<tr>
				<input type = "hidden" name = "id" value="0"/>
				<td class="form-item"><font color="red">*</font>对应客户：</td>
				<td colspan="3">
					<input id = "contactCustom" name = "custom.id" class="easyui-combobox" name="dept"   
   					 data-options="valueField:'id',textField:'customName',url:'custom/getAll',limitToList:true" style = "width: 220px" />  
				</td>
			</tr> 
			<tr>
				<td class="form-item"><font color="red">*</font>主题：</td>
				<td  ><input name="contactTheme" class = "easyui-textbox" type="text"  
					 ></td>
				<td class="form-item">客户联系人：</td>
				<td>
					<input id = "contactLinkman" name = "linkmanName" class="easyui-combobox" name="dept"   
   					 data-options="valueField:'name',textField:'name',url:'linkman/getAll' " style = "width: 220px" />  
				</td>
				
				 
			</tr>
			
			
			<tr>
				<td class="form-item" style="width: 20%">
				 交往类型：
				</td>
				  <td style="width: 30%">
					<select name = "contactType"  class="easyui-combobox" style = "width: 173px" data-options = "panelHeight:230,editable:false,width:220" >
						<option value="0">电话</option>
						<option value="1">上门</option>
						<option value="2">来访接待</option>
						<option value="3">会议</option>
						<option value="4">培训</option>
						<option value="5">商务餐饮</option>
						<option value="6">外出活动</option>
						<option value="7">其他</option>
				  </select>
				 </td>
				<td class="form-item" style="width: 20%"><font color="red">*</font>
				日期：
				</td>
				<td style="width: 30%">
					 <input  id="contactTime" name = "contactTime1"  type= "text" class= "easyui-datebox"  data-options="editable:false" style = "width: 220px"> </input>
				 </td>
			</tr>
			 
			
			 
			<tr>
				<td class="form-item">行动描述：</td>
				<td colspan="3"><textarea name="contactDesc" rows="2" cols="20"
						id="Fuwu" style="height: 30px; width: 96%;"></textarea></td>
			</tr>
			<tr>
				<td class="form-item">参与人员：</td>
				<td colspan="3"><textarea name="remark" rows="2" cols="20"
				 id="Beizhu" style="height: 30px; width: 96%;">未完成</textarea>
				 </td>
			</tr> 
		</tbody>
	</table>
	</form>
</body>
</html>