<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html>  
<html>  
	<head>  
		<base href="<%=basePath%>">  
		<meta http-equiv="Content-Type" content="textml; charset=UTF-8">  
		<script type="text/javascript">  
  
		</script>  
	</head>  
	<body class="main"><!--  onload="select_type()" -->
    <form method="post" action="" id="form1" enctype="multipart/form-data">
		<div class="aspNetHidden">
			<input type="hidden" name="id">
		</div>
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tbody><tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tbody><tr>
                            <td height="25">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tbody><tr>
                                        <td class="td_base">新增我的客户
                                        </td>
                                    </tr>
                                </tbody></table>
                                <table class="form" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody><tr>
                                        <td colspan="4" align="center">
                                            <b>基本信息</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item"><font color="red">*</font>客户名称：
                                        </td>
                                        <td colspan="3">
                                            <input name="customName" type="text" id="Name" style="width:96%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" style="width: 20%"><font color="red">*</font>助记简称：
                                        </td>
                                        <td style="width: 30%">
                                            <input name="shortName" type="text" id="ZhuJiJc" style="width:90%;">
                                        </td>
                                        <td class="form-item" style="width: 20%">客户价值评估：
                                        </td>
                                        <td style="width: 30%">
                                            <span id="JiaZhiPg">
                                            <input id="JiaZhiPg_0" type="radio" name="customAssess" value="1">
                                            <label for="JiaZhiPg_0">高</label>
                                            <input id="JiaZhiPg_1" type="radio" name="customAssess" value="2" checked="checked">
                                            <label for="JiaZhiPg_1">中</label>
                                            <input id="JiaZhiPg_2" type="radio" name="customAssess" value="3">
                                            <label for="JiaZhiPg_2">低</label></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item"><font color="red">*</font>客户种类：
                                        </td>
                                        <td>
                                            <select name="customType" id="ZhongLei" style="width:90%;">
	<option value=""></option>
	<option value="普通">普通</option>
	<option value="潜在">潜在</option>
	<option value="VIP">VIP</option>
	<option value="失效">失效</option>

</select>
                                        </td>
                                        <td class="form-item">客户信用等级：
                                        </td>
                                        <td>
                                            <span id="XinYongDj">
                                            <input id="XinYongDj_0" type="radio" name="customCreditGrade" value="1">
                                            <label for="XinYongDj_0">高</label>
                                            <input id="XinYongDj_1" type="radio" name="customCreditGrade" value="2" checked="checked">
                                            <label for="XinYongDj_1">中</label>
                                            <input id="XinYongDj_2" type="radio" name="customCreditGrade" value="3">
                                            <label for="XinYongDj_2">低</label></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">客户行业：
                                        </td>
                                        <td>
                                            <select name="trade" id="HangYe" style="width:90%;">
	<option value=""></option>
	<option value="IT业">IT业</option>
	<option value="零售业">零售业</option>
	<option value="运输业">运输业</option>
	<option value="房地产业">房地产业</option>
	<option value="制造业">制造业</option>
	<option value="通讯业">通讯业</option>
	<option value="服务业">服务业</option>
	<option value="政府">政府</option>
	<option value="金融业">金融业</option>
	<option value="教育">教育</option>
	<option value="其它">其它</option>

</select>
                                        </td>
                                        <td class="form-item">客户关系等级：
                                        </td>
                                        <td>
                                            <select name="customRelaGrade" id="DengJi" style="width:90%;">
	<option value=""></option>
	<option value="密切">密切</option>
	<option value="较好">较好</option>
	<option value="一般">一般</option>
	<option value="较差">较差</option>

</select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">客户人员规模：
                                        </td>
                                        <td>
                                            <select name="customScale" id="GuiMo" style="width:90%;">
	<option value=""></option>
	<option value="10人以内">10人以内</option>
	<option value="10-20人">10-20人</option>
	<option value="20-50人">20-50人</option>
	<option value="50-200人">50-200人</option>
	<option value="200人以上">200人以上</option>

</select>
                                        </td>
                                        <td class="form-item">客户来源：
                                        </td>
                                        <td>
                                            <select name="customSource" id="LaiYuan" style="width:90%;">
	<option value=""></option>
	<option value="电话来访">电话来访</option>
	<option value="客户介绍">客户介绍</option>
	<option value="独立开发">独立开发</option>
	<option value="媒体宣传">媒体宣传</option>
	<option value="促销活动">促销活动</option>
	<option value="老客户">老客户</option>
	<option value="代理商">代理商</option>
	<option value="合作伙伴">合作伙伴</option>
	<option value="公开招标">公开招标</option>
	<option value="互联网">互联网</option>
	<option value="其他">其他</option>

</select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item"><font color="red">*</font>客户阶段：
                                        </td>
                                        <td colspan="3">
                                            <select name="customCtage" id="JieDuan" style="width:96%;">
	<option value=""></option>
	<option value="售前跟踪">售前跟踪</option>
	<option value="合同执行">合同执行</option>
	<option value="售后服务">售后服务</option>
	<option value="合同期满">合同期满</option>
	<option value="意外终止">意外终止</option>

</select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            <b>联系方式</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">省份：
                                        </td>
                                        <td>
                                            <select class="easyui-combobox" name="address.name" style="width:100px;">
												<option style="height: 15px;" value="">&nbsp;</option>
												<c:forEach items="${province }" var="pro">
													<option value="${pro.id }">${pro.name }</option>
												</c:forEach>
											</select>
                                        </td>
                                        <td class="form-item">电话：
                                        </td>
                                        <td>
                                            <input name="customPhone" type="text" id="Dianhua" style="width:90%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">城市：
                                        </td>
                                        <td>
                                            <select class="easyui-combobox" name="address.name" style="width:100px;">
												<option style="height: 15px;" value="">&nbsp;</option>
												<!-- 异步获取城市 -->
											</select>
                                        </td>
                                        <td class="form-item">传真：
                                        </td>
                                        <td>
                                            <input name="customFax" type="text" id="Chuanzheng" style="width:90%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">县区：
                                        </td>
                                        <td>
                                            <select class="easyui-combobox" name="address.name" style="width:100px;">
												<option style="height: 15px;" value="">&nbsp;</option>
												<!-- 异步获取县区 -->
											</select>
                                        </td>
                                        <td class="form-item">网址：
                                        </td>
                                        <td>
                                            <input name="customUrl" type="text" id="Wangzhi" style="width:90%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">邮编：
                                        </td>
                                        <td>
                                            <input name="customZipCode" type="text" id="YouBian" style="width:90%;">
                                        </td>
                                        <td class="form-item">地址：
                                        </td>
                                        <td>
                                            <input name="customAddress" type="text" id="Dizhi" style="width:90%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            <b>备注</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">备注：
                                        </td>
                                        <td colspan="3">
                                            <textarea name="customRemark" rows="2" cols="20" id="Remark" style="height:48px;width:96%;"></textarea>
                                        </td>
                                    </tr>
                                </tbody></table>
                            </td>
                        </tr>
                    </tbody></table>
                </td>
            </tr>
        </tbody></table>
        <input name="SharingUserZd" type="text" id="SharingUserZd" style="display: none">
        <input name="SharingUserKx" type="text" id="SharingUserKx" style="display: none">
        <input name="Number" type="text" value="2018322101357884678" id="Number" style="display: none">
        <script language="javascript">
            var wName_1;
            function opengx1() {
                var num = Math.random();
                var str = "" + document.getElementById('SharingUserZd').value + "";

                //browser
                var bstr = getBrowserType();
                if (bstr == '3' | bstr == '4' | bstr == '5') {
                    window.open("../../Choose/crm/Xzyh.aspx?tmp=" + num + "&requeststr=" + str + "", 'window', 'height=580,width=750,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
                }
                else {
                    wName_1 = window.showModalDialog("../../choose/crm/Xzyh.aspx?tmp=" + num + "&requeststr=" + str + "", "window", "dialogWidth:750px;DialogHeight=580px;status:no;scroll=yes;help:no");
                }

                var arr = wName_1.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("SharingUserZd").value = arr[0];
                    document.getElementById("SharingNameZd").value = arr[1];
                }
            }

            function setValue_staff(str) {
                var arr = str.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("SharingUserZd").value = arr[0];
                    document.getElementById("SharingNameZd").value = arr[1];
                }
            }

            var wName_2;
            function opengx2() {
                var num = Math.random();
                var str = "" + document.getElementById('SharingUserKx').value + "";

                //browser
                var bstr = getBrowserType();
                if (bstr == '3' | bstr == '4' | bstr == '5') {
                    window.open("../../Choose/crm/Xzyh2.aspx?tmp=" + num + "&requeststr=" + str + "", 'window', 'height=580,width=750,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
                }
                else {
                    wName_2 = window.showModalDialog("../../choose/crm/Xzyh2.aspx?tmp=" + num + "&requeststr=" + str + "", "window", "dialogWidth:750px;DialogHeight=580px;status:no;scroll=yes;help:no");
                }

                var arr = wName_2.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("SharingUserKx").value = arr[0];
                    document.getElementById("SharingNameKx").value = arr[1];
                }
            }

            function setValue_staff2(str) {
                var arr = str.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("SharingUserKx").value = arr[0];
                    document.getElementById("SharingNameKx").value = arr[1];
                }
            }
        </script>
    </form>


</body> 
</html>
