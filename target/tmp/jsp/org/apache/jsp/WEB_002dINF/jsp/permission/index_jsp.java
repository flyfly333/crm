/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.4.0.M1
 * Generated at: 2018-03-22 13:59:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.permission;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("file:/C:/Users/Miao%20%20Long/.m2/repository/org/apache/taglibs/taglibs-standard-impl/1.2.5/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1519896787640L));
    _jspx_dependants.put("jar:file:/C:/Users/Miao%20%20Long/.m2/repository/org/apache/taglibs/taglibs-standard-impl/1.2.5/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425949870000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html lang=\"en-US\">\r\n");
      out.write("<head>\r\n");
      out.write(" \t<base href=\"");
      out.print(basePath );
      out.write("\">\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<title>权限列表</title>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/commont.jsp", out, false);
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t//删除权限\r\n");
      out.write("\tfunction delete_permission(){\r\n");
      out.write("\t\tvar row = $(\"#permissionTable\").datagrid(\"getSelected\");\r\n");
      out.write("\t\tif (row == null) {\r\n");
      out.write("\t\t\talert(\"请选择权限!\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif (row.children.length > 0) {\r\n");
      out.write("\t\t\talert(\"该权限还有子权限不能删除！\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.messager.confirm(\"提示\",\"确定要删除么？\",function (r){\r\n");
      out.write("\t\t\tif (r) {\r\n");
      out.write("\t\t\t\t$.post(\"permission/delete\",{id:row.id},function (data){\r\n");
      out.write("\t\t\t\t\tif (data.result) {\r\n");
      out.write("\t\t\t\t\t\talert(\"删除成功！\");\r\n");
      out.write("\t\t\t\t\t\t$(\"#permissionTable\").treegrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t})\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t})\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t//修改权限\r\n");
      out.write("\tfunction edit_permission(){\r\n");
      out.write("\t\tvar row = $(\"#permissionTable\").datagrid(\"getSelected\");\r\n");
      out.write("\t\tif (row == null) {\r\n");
      out.write("\t\t\talert(\"请选择权限！\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t/* if (row.children.length > 0) {\r\n");
      out.write("\t\t\talert(\"该权限还有子权限不能删除！\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t} */\r\n");
      out.write("\t\t \r\n");
      out.write("\t\tvar d = $(\"<div></div>\").appendTo(\"body\");\r\n");
      out.write("\t\td.dialog({\r\n");
      out.write("\t\t\ttitle:'修改权限',\r\n");
      out.write("\t\t\thref:'permission/form',\r\n");
      out.write("\t\t\twidth:500,\r\n");
      out.write("\t\t\theight:'auto',\r\n");
      out.write("\t\t\tmodal:true,\r\n");
      out.write("\t\t\tonClose:function (){$(this).dialog(\"destroy\");},\r\n");
      out.write("\t\t\tonLoad:function (){\r\n");
      out.write("\t\t\t\t$.post(\"permission/getById\",{id:row.id},function (data){\r\n");
      out.write("\t\t\t\t\tvar parentid = 0;\r\n");
      out.write("\t\t\t\t\tif (data.per != null) {\r\n");
      out.write("\t\t\t\t\t\tparentid = data.per.id;\r\n");
      out.write("\t\t\t\t\t} \r\n");
      out.write("\t\t\t\t\t//设置父级的选项\r\n");
      out.write("\t\t\t\t\t$('#perParent').combotree('setValue',parentid); \r\n");
      out.write("\t\t\t\t\t$(\"#permissionForm\").form(\"load\",data);\r\n");
      out.write("\t\t\t\t\t//禁用父级组件\r\n");
      out.write("\t\t\t\t\t$(\"#perParent\").combo(\"disable\");\r\n");
      out.write("\t\t\t\t}) \r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tbuttons:[{\r\n");
      out.write("\t\t\t\ticonCls:\"icon-ok\",\r\n");
      out.write("\t\t\t\ttext:\"确定\",\r\n");
      out.write("\t\t\t\thandler:function(){ \r\n");
      out.write("\t\t\t\t\t$(\"#permissionForm\").form(\"submit\",{\r\n");
      out.write("\t\t\t\t\t\turl:'permission/update',\r\n");
      out.write("\t\t\t\t\t\tsuccess:function (data){\r\n");
      out.write("\t\t\t\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t\t\t\talert(\"修改成功！\");\r\n");
      out.write("\t\t\t\t\t\t$(\"#permissionTable\").treegrid(\"reload\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t})\r\n");
      out.write("\t\t\t\t\t d.dialog(\"close\"); \r\n");
      out.write("\t\t\t\t   } \r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ticonCls:\"icon-cancel\",\r\n");
      out.write("\t\t\t\ttext:\"取消\",\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\td.dialog(\"close\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}]\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t})\r\n");
      out.write("\t}\r\n");
      out.write("\t//自定义弹框方法\r\n");
      out.write("\tfunction alert(message){\r\n");
      out.write("\t\t$.messager.show({\r\n");
      out.write("\t\t\ttitle:'提示信息',\r\n");
      out.write("\t\t\tmsg:message,\r\n");
      out.write("\t\t\ttimeout:1000,\r\n");
      out.write("\t\t\tshowType:'slide',\r\n");
      out.write("\t\t\tshowSpeed:200,\r\n");
      out.write("\t\t\tstyle:{\r\n");
      out.write("\t\t\t\tright:'1000',\r\n");
      out.write("\t\t\t\ttop:0,\r\n");
      out.write("\t\t\t\tbottom:''\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t})\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t//添加权限\r\n");
      out.write("\tfunction add_permission(){\r\n");
      out.write("\t\tvar d = $(\"<div></div>\").appendTo(\"body\");\r\n");
      out.write("\t\td.dialog({\r\n");
      out.write("\t\t\ttitle:'添加权限',\r\n");
      out.write("\t\t\thref:'permission/form',\r\n");
      out.write("\t\t\twidth:500,\r\n");
      out.write("\t\t\theight:'auto',\r\n");
      out.write("\t\t\tmodal:true,\r\n");
      out.write("\t\t\tonClose:function (){$(this).dialog(\"destroy\");},\r\n");
      out.write("\t\t\tbuttons:[{\r\n");
      out.write("\t\t\t\ticonCls:\"icon-ok\",\r\n");
      out.write("\t\t\t\ttext:\"确定\",\r\n");
      out.write("\t\t\t\thandler:function(){ \r\n");
      out.write("\t\t\t\t\t$(\"#permissionForm\").form(\"submit\",{\r\n");
      out.write("\t\t\t\t\t\turl:'permission/add',\r\n");
      out.write("\t\t\t\t\t\tsuccess:function (data){\r\n");
      out.write("\t\t\t\t\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t\t\t\t\talert(\"添加成功！\");\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t})\r\n");
      out.write("\t\t\t\t\t d.dialog(\"close\"); \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ticonCls:\"icon-cancel\",\r\n");
      out.write("\t\t\t\ttext:\"取消\",\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\td.dialog(\"close\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}]\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t})\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction avaFormatter(value,row,index){\r\n");
      out.write("\t\tif (row.available > 0) {\r\n");
      out.write("\t\t\treturn \"是\";\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\treturn \"否\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t$(\"#permissionTable\").treegrid({\r\n");
      out.write("\t\t\ttoolbar:\"#tb\",\r\n");
      out.write("\t\t\tidField:\"id\",\r\n");
      out.write("\t\t\ttreeField:\"text\",\r\n");
      out.write("\t\t\tanimate:true,\r\n");
      out.write("\t\t\tonLoadSuccess : function(){\r\n");
      out.write("\t\t\t\t//$(this).treegrid(\"collapseAll\");\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tloadFilter:function(data){\r\n");
      out.write("\t\t\t\t $.each(data,function (){\r\n");
      out.write("\t\t\t\t\t this.state = \"closed\";\r\n");
      out.write("\t\t\t\t })\r\n");
      out.write("\t\t\t\t return data;\r\n");
      out.write("\t\t\t}    \r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<table id=\"permissionTable\"  title=\"Permission List\"\r\n");
      out.write("        data-options=\"url:'permission/list',fitColumns:true,striped:true,iconCls:'icon-search'\">\r\n");
      out.write("    <thead>\r\n");
      out.write("        <tr> \r\n");
      out.write("            <th data-options=\"field:'text',width:100,sortable:true\">权限名称</th>\r\n");
      out.write("            <th data-options=\"field:'percode',width:50\">权限码</th>\r\n");
      out.write("            <th data-options=\"field:'available',width:100,formatter:avaFormatter\">是否可用</th>\r\n");
      out.write("            <th data-options=\"field:'url',width:150\">Url</th>\r\n");
      out.write("        </tr>\r\n");
      out.write("    </thead>\r\n");
      out.write("</table>\r\n");
      out.write("<div id=\"tb\">\r\n");
      out.write("<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"add_permission();\" data-options=\"iconCls:'icon-add',plain:true\">添加</a>\r\n");
      out.write("<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"edit_permission();\" data-options=\"iconCls:'icon-edit',plain:true\">修改</a>\r\n");
      out.write("<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"delete_permission();\" data-options=\"iconCls:'icon-remove',plain:true\">删除</a>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
