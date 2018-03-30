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
	 <style type="text/css">
	 	/*easyui mian*/
#west .layout-panel-west .panel-header{ padding-left:5px; width:220px;height:30px;border-color:#d3d3d3;background:#f9fafc;color:#777;}
#west .layout-panel-west .panel-header .panel-title{padding-left:20px;height:30px;color:#777;line-height:30px;}
.label-mes{position:absolute;top:3px;display:none;margin-left:13px;padding:2px 3px;border-radius:3px;text-align:center;font-size:9px;line-height:.9;}
.label-success{background-color:#00a65a !important;}
#west .tree-icon{margin-top: 0px;}
#west .tree-hit{margin-top: 0px;}
#west .tree-node{padding-left:20px;height: 30px;line-height:30px;}
#west .tree-title{ padding-left:4px;color:#444;line-height: 30px;}
#west .tree-file{overflow:auto;background: url('topjui.blacklight.css');}
#west .tree-folder, .tree-folder-open{background: url('');height:30px;line-height: 30px;}
#west .tree-node-selected{background: #e7eaec;color:#444;}
#west .tree-node-hover{background: #e7eaec;color: #000000;}
#west .tree-node-hover .tree-title{color: #000000;}
#west .panel-header{padding-left: 20px;}
#west .panel-body{border: 0px;background: #f9fafc;}
#west .panel-icon{left: 14px;}
#west .panel-title{padding-left: 15px;height: 30px;font-size: 12px;line-height: 30px;}
#west .accordion{background: #F9FAFC;}
#west .accordion-body {border:0px;}
#west .accordion .accordion-header{height: 30px;border-top:solid 1px #ddd;border-left:3px #F9FAFC solid;background: #f9fafc;color:#444;line-height: 30px;}
#west .accordion .accordion-header-selected{border-left:3px #2c3b41 solid;background: #e7eaec;border-bottom:solid 0px #ddd;}
#west .accordion .accordion-header:hover{border-left:3px #2c3b41 solid;background: #e7eaec;color: #000;}
#west .accordion .accordion-header-selected .panel-title{color:#444;}
#west .accordion .accordion-header .panel-title:hover{color: #333;}
#west .layout-split-west{border-right: 3px solid #efefef;}
#west .tree-collapsed { display:inline-block; margin-top:0px; margin-right:0px;background:url(''); color:#000;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;}
#west .tree-collapsed:before{content:"\f0da";}
#west .tree-expanded { display:inline-block;margin-top:0px; margin-right:0px;background:url(''); color:#000;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;}
#west .tree-expanded:before{content:"\f0d7";}

#west .layout-split-west{border-right: 3px solid #efefef;}
#center .tabs-panels{border-bottom: 0px;}
#west .panel-header,#west .panel-body{border:0px;}


.user-image {float: left;margin-top: 10px;margin-right: 10px;width: 30px;height: 30px;border-radius: 50%;}
.user-name { float: left;display:block;overflow:hidden;padding-top:0;font-family: 'Microsoft YaHei',Arial,Verdana;}
.user-header{ padding-top:20px; background:#2c3b41; color:#fff;text-align:center;font-family:'Microsoft YaHei',Arial,Verdana;}
.user-header img{width:100px;height:100px;border-radius:50%;}

.tabs li.tabs-selected a.tabs-inner{border-top-color: #2c3b41;border-top-width: 3px;}
.banner{width: 100%;height: 50px;background: #2c3b41;color: #fff;}
.banner .l-btn-text{/* margin:0px; */}
.banner .webname{width: 215px;background:#2c3b41; text-align:left; padding-left:10px; font-weight:bold; font-size: 20px;line-height: 25px; }
.panel-icon, .panel-tool {margin-top:-6px;}
/*easyui inner*/
.window{padding: 0;border-width: 3px 1px 1px 1px;-webkit-border-radius: 5px;border-radius: 5px;box-shadow:1px 1px 50px rgba(0,0,0,.3);border-top-color: #2c3b41;}
.window .window-body{border-width:0px;}
.window .window-header .panel-tool{right: 12px;}
.window .window-header{height:30px;border-color: #e7eaec;background:#f9f9f9;}
.window .window-header .panel-icon{left: 12px;color: #444;font-weight: normal;font-size: 14px;}
.window .window-header .panel-with-icon{padding-left:30px;font-weight:normal;font-size:13px;}
.window .window-header .panel-icon, .window .window-header .panel-tool{margin-top:-8px;}
.window-proxy-mask, .window-mask{background:#D6D6D6;}
.datagrid-row{height:30px;}
.datagrid-row-selected{height: 30px;background: #e7eaec;color: #000;}
.datagrid-header-row{padding:0 10px 0 10px;height:30px;background: #f9f9f9;}
.datagrid-row-over, .datagrid-header td.datagrid-header-over{background: #e7eaec;}
.datagrid-cell, .datagrid-cell-group, .datagrid-header-rownumber, .datagrid-cell-rownumber{padding:0 7px;text-overflow: ellipsis;}
.accordion .accordion-header-selected {background: #2c3b41;}
/*btn*/

.bannerbtn{padding:18px 10px 6px 10px;height:25px;color:#fff;text-decoration:none;line-height:36px;}
.bannerbtn:hover{background:#1e282c;filter:none;}
.endbtndiv{padding:8px 10px 8px 0;border-top:1px solid #f0f0f0;background:#f9f9f9;text-align:right;}
.l-btn-left{margin:0;margin-top: 2px !important;}
.switchbutton-on{background:#f7a31e;color:#fff;}
.switchbutton-off{background:#E1E1E1;color:#000;}
/*顶部菜单*/
.bannerMenu{padding:5px;height:40px;color:#fff;text-decoration:none;font-size:18px;line-height:40px;filter:none;}
.bannerMenu lable{font-size:24px;}
.bannerMenu span{font-size:13px;font-family:'Microsoft YaHei',Arial,Verdana;letter-spacing:1px}
#north .topmenu{border-right:1px #1e282c solid;background:#2c3b41;text-align:center}
#north .topmenu:hover{background:#1e282c;text-align:center}
#north .selected{border-right:1px #1e282c solid;background:#1e282c;text-align:center}
#north .splitborder{width:1px;background:#1e282c;}
	  
	 .nodehover{ background: #eee;  color: #404040;}
	 .nodeselected{ background: #eee;  color: #404040;}
	 .tree-node a {color:#404040;text-decoration: none;}
	 
	 ul{padding: 0;margin: 0}
	 </style>
	 
	 
	 
	 <script type="text/javascript">
	 	function addTag(url,title){
	 		console.log(url);
	 		console.log(title);
	 		var tabs = $("#tabs");
	 		if (!tabs.tabs('exists',title)) { 
		 		tabs.tabs('add',{
		 			title:title,
		 			href:url,
		 			fit:true,
		 			closable:true,
		 			iconCls:'icon-search'
		 		})
	 		}else{
	 			tabs.tabs("select",title);
	 		}
	 	} 
	 	$(function (){
	 		$(".tree-node").mouseover(function (){
	 			$(this).addClass("nodehover");
		 	})
		 	$(".tree-node").mouseleave(function (){
		 		$(this).removeClass("nodehover");
		 	})
	 		$(".tree-node").click(function (){
		 		$(".nodeselected").removeClass("nodeselected");
		 		$(this).addClass("nodeselected");
		 	})
		 	
	 	})
	 </script>
	 <link type="text/css" href="/fonts/font-awesome.min.css" rel="stylesheet">
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true,disabled:true" style="height:80px; overflow:hidden; display: flex; justify-content:space-between;padding: 0 10px"  >
    	<div style = "line-height: 50px"><h1>CRM客户关系管理系统</h1></div>
    	<div style = "line-height: 80px">欢迎你,${login_user.userName}</div> 
    </div>   
    <div id="west"
     data-options="region:'west',split:true,disabled:true" style="width:200px;height: 100%">
      
     
    	<div id="aa" class="easyui-accordion"  >
		   <c:forEach items="${login_user.permissions}" var="parent">
		   		<c:if test="${parent.type == 'menu'}">
			   		<div title="${parent.text}" data-options="iconCls:'panel-icon fa fa-folder'" style="overflow:auto; ">
					 	<ul>
					 		<c:forEach items="${login_user.permissions}" var="children">
					 			<c:if test="${children.per.id == parent.id && children.type == 'link'}">
					 				<li>
					 				<div id="_easyui_tree_71" class="tree-node"><span class="tree-indent"></span><span class="tree-icon tree-file"></span><span class="tree-title"> 
					 				<a href = "javascript:void(0)" onclick = "addTag('${children.url}','${children.text}')" >${children.text}</a></span>
					 				</div>
					 				</li> 
					 			</c:if>
					 		</c:forEach>
					 	</ul>
			   		</div>
		   		</c:if>
		   </c:forEach>
		</div>	 
    </div>   
    <div id="center" data-options="region:'center' " style=" background:#eee;">
    	<div id="tabs" class="easyui-tabs" style="width:500px;height:250px;" data-options = "fit:true">   
		    <div title="主页" style="padding:20px;display:none;">   
		                        主页   
		    </div>   
	   </div>  
    </div>   
</body>  
</html>