package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream; 
import javax.annotation.Resource; 
import javax.enterprise.inject.Default;

import org.apache.ibatis.annotations.Update;
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
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserDao userDao;
	
  
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
 
	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}
	
	@RequestMapping("/getUserById")
	@ResponseBody
	public User getUserById(Integer id) {
		System.out.println(userDao.getById(id));
		return userDao.getById(id);
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
		Map<String,Object> map = new HashMap<>();
		map.put("total",userDao.getCount());
		map.put("rows",userDao.getListByCondition(start, rows,user, sort, order));
		return map;
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> Update(User user,Integer [] rids){
		for (Integer integer : rids) {
			System.out.println(integer);
		}
		Map<String, Object> map = new HashMap<>();
		userDao.update(user);
		userDao.deleteRela(user.getId());
		userDao.addUserRole(user.getId(), rids);
		map.put("result", true);
		return map;
	}
	
	/**
	 * 登录方法
	 * @param username
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getByName")
	@ResponseBody
	public Map<String, Object> selectByName(String username, String password) throws Exception{
		Map<String, Object> map = new HashMap<>();
		User user = userDao.selectByName(username);
		if(username == "" || password == "") {
			map.put("info", "请填写账号或密码！");
		}else {
			if(user != null) {
				if(!password.equals(user.getPassword())) {
					map.put("info", "密码错误！");
				}else {
					map.put("info", "登录成功！");
				}
			}else {
				map.put("info", "账号错误！");
			}
		}
		return map;
	}
}
