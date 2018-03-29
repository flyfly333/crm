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
<form id = "comprecordForm2" action="">
	<table class="form" border="0" cellpadding="0" cellspacing="0"
		width="100%">
		<tbody>
			<tr>
				<input type = "hidden" name = "id" value="0"/>
				<td class="form-item"><font color="red">*</font>对应客户：</td>
				<td colspan="3">
					<input id = "serCustom" name = "custom.id" class="easyui-combobox" name="dept"   
   					 data-options="valueField:'id',textField:'customName',url:'custom/getAll',limitToList:true" style = "width: 220px" />  
				</td>
			</tr>
			<tr>
				<td class="form-item"><font color="red">*</font>服务主题：</td>
				<td colspan="3"><input name="serTheme" class = "easyui-textbox" type="text" id="Zhuti"
					style="width: 96%;"></td>
			</tr>
			<tr>
				<td class="form-item" style="width: 20%">
				<font color="red">*</font>服务类型：
				</td>
				  <td style="width: 30%">
					<select name = "serType"  class="easyui-combobox" style = "width: 173px" data-options = "panelHeight:130,editable:false,width:220" >
						<option value="0">答疑</option>
						<option value="1">故障排除</option>
						<option value="2">培训</option>
						<option value="3">升级</option>
						<option value="4">其他</option>
				  </select>
				 </td>
				<td class="form-item" style="width: 20%"><font color="red">*</font>服务方式：
				</td>
				<td style="width: 30%">
					<select name = "serWay"  class="easyui-combobox" style = "width: 173px" data-options = "panelHeight:130,editable:false,width:220" >
							<option value="0">电话</option>
							<option value="1">传真</option>
							<option value="2">邮寄</option>
							<option value="3">上门</option>
							<option value="4">其他</option>
					 </select>
				 </td>
			</tr>
			<tr>
				<td class="form-item"><font color="red">*</font>开始时间：</td>
				<td>
					<input  id="stime" name = "sTime"  type= "text" class= "easyui-datetimebox"  data-options="editable:false" style = "width: 220px"> </input>
				</td>
				<td class="form-item"><font color="red">*</font>结束时间：</td>
				<td>
					<input  id="etime" name = "eTime"  type= "text" class= "easyui-datetimebox"  data-options="editable:false" style = "width: 220px"> </input>
				</td>
			</tr>
			<tr>
				<td class="form-item">客户联系人：</td>
				<td>
					<input id = "serCustomLinkman" name = "linkman.id" class="easyui-combobox" name="dept"   
   					 data-options="valueField:'id',textField:'name',url:'linkman/getAll',limitToList:true" style = "width: 220px" />  
				</td>
				<td class="form-item">执行人：</td>
				<td>
					<input id = "serUser" name = "user.id" class="easyui-combobox" name="dept"   
   					 data-options="valueField:'id',textField:'userName',url:'user/getAll',limitToList:true" style = "width: 220px" />  
				</td>
			</tr>
			<tr>
				<td class="form-item">状态：</td>
				<td colspan="3"> 
					<input id="Zhuangtai_0" type="radio" name="status" value="3">
					<label for="Zhuangtai_0">无需处理</label>
					<input id="Zhuangtai_1" type="radio" name="status" value="0" checked="checked">
					<label for="Zhuangtai_1">未处理</label>
					<input id="Zhuangtai_2" type="radio" name="status" value="1">
					<label for="Zhuangtai_2">处理中</label>
					<input id="Zhuangtai_3" type="radio" name="status" value="2">
					<label for="Zhuangtai_3">处理完成</label></span>
				</td>
			</tr>
			<tr>
				<td class="form-item">服务内容：</td>
				<td colspan="3"><textarea name=serContext rows="2" cols="20"
						id="Fuwu" style="height: 30px; width: 96%;"></textarea></td>
			</tr>
			 
			<tr>
				<td class="form-item">备注：</td>
				<td colspan="3"><textarea name="remark" rows="2" cols="20"
						id="Beizhu" style="height: 30px; width: 96%;"></textarea></td>
			</tr> 
		</tbody>
	</table>
	</form>
</body>
</html>