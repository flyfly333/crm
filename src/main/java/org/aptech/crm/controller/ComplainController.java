package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream; 
import javax.annotation.Resource; 
import javax.enterprise.inject.Default;

import org.apache.ibatis.annotations.Update;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.aptech.crm.dao.ComplainDao;
import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.Complain;
import org.aptech.crm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 用户控制器
 * @author Miao  Long 
 */
@Controller
@RequestMapping("/complain")
public class ComplainController {
	@Resource
	private ComplainDao complainDao;
	
  
	public void setUserDao(ComplainDao complainDao) {
		this.complainDao = complainDao;
	}
 
	@RequestMapping("/index")
	public String index() {
		return "complain/index";
	}
	
	@RequestMapping("/getComplainById")
	@ResponseBody
	public Complain getUserById(Integer id) {
		System.out.println(complainDao.getById(id));
		return complainDao.getById(id);
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
		complainDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Complain complain) {
		Map<String , Object> map = new HashMap<>(); 
		//添加用户
		complainDao.add(complain);
		map.put("result", true);
		return map; 
	}
	@RequestMapping("/form")
	public String complainForm() {
		return "complain/complain_form";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Complain complain,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		int start = (page - 1)*rows;
		Map<String,Object> map = new HashMap<>();
		map.put("total",complainDao.getCountByCondition(complain));
		map.put("rows",complainDao.getListByCondition(start, rows,complain, sort, order));
		return map;
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> Update(Complain complain ){
		 
		Map<String, Object> map = new HashMap<>();
		complainDao.update(complain);
		 
		map.put("result", true);
		return map;
	}
	
	 
}
