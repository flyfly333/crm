package org.aptech.crm.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 记录日志拦截器
 * @author Miao  Long
 *
 */
public class LogInterceptor extends HandlerInterceptorAdapter {
 
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
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	/**
	 *相应完成之后调用
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		String ip = ProjectUtils.getIP(request);
		String requestUrl = request.getRequestURL().toString();
		if (requestUrl.indexOf("user/index") > 0) {
			System.out.println("访问了user/index 页面");
		}
		System.out.println("handler" + handler.toString());
        System.out.println("请求地址：" + requestUrl);
		System.out.println(""  + request.getContextPath());
        
        //System.out.println("gameover!!!");
		System.out.println(request.getRemoteAddr());
		 
	}
}
