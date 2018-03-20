package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.IntStream;

import javax.annotation.Resource;
import javax.enterprise.inject.Default;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 用户控制器
 * @author Miao  Long
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserDao userDao;
	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
		userDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	
	
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(User user,Integer [] rids) {
		System.out.println(user);
		Map<String , Object> map = new HashMap<>();
		Md5Hash hash = new Md5Hash(user.getPassword(),user.getSalt());
		user.setPassword(hash.toString());
		System.out.println(user);
		//添加用户
		userDao.add(user);
		//添加关系
		userDao.addUserRole(user.getId(), rids);
		map.put("result", true);
		return map; 
	}
	@RequestMapping("/form")
	public String userForm() {
		return "user/user_form";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,User user,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		System.out.println(user.getUserName());
		System.out.println();
		int start = (page - 1)*rows;
		Map<String, Object> map = new HashMap<>();
		map.put("total",userDao.getCount());
		map.put("rows",userDao.getListByCondition(start, rows,user, sort, order));
		return map;
	}
}
