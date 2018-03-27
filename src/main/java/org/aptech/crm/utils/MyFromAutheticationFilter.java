package org.aptech.crm.utils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
/**
 * 自定义表单过滤器
 * @author Miao  Long
 *
 */
public class MyFromAutheticationFilter extends FormAuthenticationFilter {
     @Override
    protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {
    	 WebUtils.issueRedirect(request, response, getSuccessUrl(),null,true);
    }
}
