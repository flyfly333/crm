package org.aptech.crm.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aptech.crm.dao.LogDao;
import org.aptech.crm.pojo.Log;
import org.aptech.crm.pojo.User;
import org.hamcrest.core.SubstringMatcher;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContext;

/**
 * 记录日志拦截器
 * @author Miao  Long
 *
 */
public class LogInterceptor extends HandlerInterceptorAdapter {
	
	private static Properties properties = new Properties();
	
	@Resource
	private LogDao logDao;
	
	
	
	public void setLogDao(LogDao logDao) {
		this.logDao = logDao;
	}


	static {
		try {
			InputStream in = new FileInputStream(new File("src/main/resources/permission.properties"));
			properties.load(in);
		} catch (Exception e) {
			System.out.println("读取文件失败！");
			e.printStackTrace();
		}
	}
 
	/**
	 * 之前调用
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}
	
	/**
	 * 生成视图之前调用
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
		ModelAndView modelAndView) throws Exception {
//		HandlerMethod method = (HandlerMethod)handler;
//		
//		record re = method.getMethodAnnotation(record.class);
//		if (re != null) {
//			System.out.println("动作类型是：" + re.actionType() );
//			System.out.println("业务逻辑是：" + re.businessLogic());
//		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	/**
	 *相应完成之后调用
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("========================================");
		//ip地址
		String ip = ProjectUtils.getIP(request);
		System.out.println(ip);
		//日志内容
		String context = properties.getProperty(request.getRequestURI());
		if (context != null) {
			//模块名称
			String module  = new StringBuffer(context).substring(0,2);
			System.out.println(module);
			User user = (User) request.getSession().getAttribute("login_user");
			System.out.println(user);
			System.out.println("=======================================");
			Log log = new Log();
			log.setIp(ip);
			log.setLogContext(context);
			log.setLogTime(new Date());
			log.setUser(user); 
			log.setModuleName(module);
			System.out.println(log); 
			logDao.add(log);
			System.out.println("添加日志成功");
		}
		
		System.out.println("访问了uri" + request.getRequestURI());
		String requestUrl = request.getRequestURL().toString();
		if (requestUrl.indexOf("user/index") > 0) {
			System.out.println("访问了user/index 页面");
		} 
		System.out.println("handler" + handler.toString());
        System.out.println("请求地址：" + requestUrl);
		System.out.println(""  + request.getContextPath());
		System.out.println(request.getRemoteAddr());
		 
	}
}
