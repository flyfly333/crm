package org.aptech.crm.utils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set; 
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 项目工具类
 * @author Miao  Long
 *
 */ 
public class ProjectUtils {
	private static Class [] classes;//要生成相应模块的实体类
	//创建freemarker 对象
	private static Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);   
	private static Map<String, Object> modal = new HashMap<>();
	  
	public static void setClasses(Class[] classes) {
		ProjectUtils.classes = classes;
	} 
	/**
	 * 获取ip地址方法
	 * @param request
	 * @return
	 */
	public static String getIP(HttpServletRequest request) {
		 String ip = request.getHeader("X-Forwarded-For");   
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("Proxy-Client-IP");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("WL-Proxy-Client-IP");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("HTTP_CLIENT_IP");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
         }  
         if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
             ip = request.getRemoteAddr();  
         }
         return ip;
	}
	
	
	/**
	 * freemarker 的框架配置
	 */
	static {
		   try {
			configuration.setDirectoryForTemplateLoading(new File("src/main/resources"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		   configuration.setDefaultEncoding("utf-8");
		   modal.put("projectName", "aptech.crm");
		   modal.put("jing", "#");
		   modal.put("dao", "$");
	}
	/**
	 * 生成dao接口
	 */
	public static void gererateDaoInterface() throws Exception {
		
		//获取模板
		Template template = configuration.getTemplate("dao.ftl");
		if (classes == null) {
			return;
		}
		String pkType = "Integer";
		for (Class clazz : classes) {
			modal.put("pojoName", clazz.getSimpleName());
			Field [] fields = clazz.getDeclaredFields();
			for (Field field : fields) {
				if (field.getAnnotations().length > 0) {
					if (field.getAnnotations()[0].annotationType() == Resource.class) {
						pkType = field.getType().getSimpleName();
					}
				}
			}
			modal.put("pkType",pkType);
			File file = new File("src/main/java/org/aptech/crm/dao/"+clazz.getSimpleName()+"Dao.java");
			Writer writer = new OutputStreamWriter(new FileOutputStream(file));
			template.process(modal,writer);
		} 
	}
	/**
	 * 生成sql mapper files 
	 */
	public static void generateMappers() throws Exception{
		Template template = configuration.getTemplate("mapper.ftl");
		if (classes == null || classes.length == 0) {
			return;
		} 
		   Set<String> keys = modal.keySet();
		   for (String string : keys) {
			System.out.println("key:" + string + ":" + modal.get(string));
		   }
		
		List<String> columnNames = new ArrayList<>();
		for (Class clazz : classes){ 
			modal.put("pojoName", clazz.getSimpleName());
			Field [] fields = clazz.getDeclaredFields();
			StringBuffer sb = new StringBuffer(clazz.getSimpleName());
			char[] chars = clazz.getSimpleName().toCharArray();
			for (int i = 1; i < chars.length; i++) {
				 if (Character.isUpperCase(chars[i])) {
					sb.insert(i, "_");
				}
			}
			modal.put("table_name", sb.toString());
			
			for (Field field : fields) {
				if (field.getAnnotations().length > 0 && field.getAnnotations()[0].annotationType() == Resource.class) {
					System.out.println(field.getName() + "字段的类型是:"+field.getAnnotations()[0].annotationType());
					modal.put("pkType", field.getType().getSimpleName());
				}else {
					columnNames.add(field.getName());
				}	
				
			}
			
			modal.put("columnNames", columnNames);

			for (String s : columnNames) {
				System.out.println(s);
			}
			File file = new File("src/main/java/org/aptech/crm/mappers/" + clazz.getSimpleName() + "Mapper.xml");
			Writer out = new OutputStreamWriter(new FileOutputStream(file));
			template.process(modal, out);
		}
	}
}
