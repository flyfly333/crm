/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.4.0.M1
 * Generated at: 2018-03-30 03:41:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.contactRecord;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class contactrecord_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t<title>Title</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form id = \"contactrecordForm2\" action=\"\">\r\n");
      out.write("\t<table class=\"form\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\r\n");
      out.write("\t\twidth=\"100%\">\r\n");
      out.write("\t\t<tbody>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<input type = \"hidden\" name = \"id\" value=\"0\"/>\r\n");
      out.write("\t\t\t\t<td class=\"form-item\"><font color=\"red\">*</font>对应客户：</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<input id = \"contactCustom\" name = \"custom.id\" class=\"easyui-combobox\" name=\"dept\"   \r\n");
      out.write("   \t\t\t\t\t data-options=\"valueField:'id',textField:'customName',url:'custom/getAll',limitToList:true\" style = \"width: 220px\" />  \r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"form-item\"><font color=\"red\">*</font>主题：</td>\r\n");
      out.write("\t\t\t\t<td  ><input name=\"contactTheme\" class = \"easyui-textbox\" type=\"text\"  \r\n");
      out.write("\t\t\t\t\t ></td>\r\n");
      out.write("\t\t\t\t<td class=\"form-item\">客户联系人：</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input id = \"contactLinkman\" name = \"linkmanName\" class=\"easyui-combobox\" name=\"dept\"   \r\n");
      out.write("   \t\t\t\t\t data-options=\"valueField:'name',textField:'name',url:'linkman/getAll' \" style = \"width: 220px\" />  \r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"form-item\" style=\"width: 20%\">\r\n");
      out.write("\t\t\t\t 交往类型：\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t  <td style=\"width: 30%\">\r\n");
      out.write("\t\t\t\t\t<select name = \"contactType\"  class=\"easyui-combobox\" style = \"width: 173px\" data-options = \"panelHeight:230,editable:false,width:220\" >\r\n");
      out.write("\t\t\t\t\t\t<option value=\"0\">电话</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"1\">上门</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"2\">来访接待</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"3\">会议</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"4\">培训</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"5\">商务餐饮</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"6\">外出活动</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"7\">其他</option>\r\n");
      out.write("\t\t\t\t  </select>\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t\t<td class=\"form-item\" style=\"width: 20%\"><font color=\"red\">*</font>\r\n");
      out.write("\t\t\t\t日期：\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<td style=\"width: 30%\">\r\n");
      out.write("\t\t\t\t\t <input  id=\"contactTime\" name = \"contactTime1\"  type= \"text\" class= \"easyui-datebox\"  data-options=\"editable:false\" style = \"width: 220px\"> </input>\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t \r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"form-item\">行动描述：</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"><textarea name=\"contactDesc\" rows=\"2\" cols=\"20\"\r\n");
      out.write("\t\t\t\t\t\tid=\"Fuwu\" style=\"height: 30px; width: 96%;\"></textarea></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td class=\"form-item\">参与人员：</td>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"><textarea name=\"remark\" rows=\"2\" cols=\"20\"\r\n");
      out.write("\t\t\t\t id=\"Beizhu\" style=\"height: 30px; width: 96%;\">未完成</textarea>\r\n");
      out.write("\t\t\t\t </td>\r\n");
      out.write("\t\t\t</tr> \r\n");
      out.write("\t\t</tbody>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t</form>\r\n");
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
