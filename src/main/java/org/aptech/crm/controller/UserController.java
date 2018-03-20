package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}
	
	public Map<String, Object> getListByCondition(){
		Map<String, Object> map = new HashMap<>();
		
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
