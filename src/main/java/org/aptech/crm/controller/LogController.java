package org.aptech.crm.controller;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.aptech.crm.dao.LogDao;
import org.aptech.crm.pojo.Log;
import org.aptech.crm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 问题控制器
 * @author Miao  Long 
 */
@Controller
@RequestMapping("/log")
public class LogController {
	@Resource
	private LogDao logDao;
	
  
	public void setLogDao(LogDao logDao) {
		this.logDao = logDao;
	}
 
	@RequestMapping("/main")
	public String index2(HttpServletRequest request) {
		User user = new User();
		request.getSession().setAttribute("login_user", user);
		return "main/main";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "log/index";
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
	    logDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Log log){
		Map<String, Object> map = new HashMap<>();
		logDao.add(log);
		map.put("result", true);
		return map;
	}  
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Log log,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		int start = (page - 1)*rows;
		Map<String,Object> map = new HashMap<>(); 
		map.put("total",logDao.getCountByCondition(log));
		map.put("rows",logDao.getListByCondition(start, rows,log, sort, order));
		return map;
	}
	 
}
