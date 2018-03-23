package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.aptech.crm.dao.RoleDao;
import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.Role;
import org.aptech.crm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 角色控制器
 * @author Miao  Long
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	private RoleDao roleDao;
	
	
	@RequestMapping("/index")
	public String index() {
		return "role/index";
	}
	
	@RequestMapping("/all")
	@ResponseBody
	public List<Role> getAll(){
		return roleDao.getAll();
	}
	
	
	
	@RequestMapping("/getRoleById")
	@ResponseBody
	public Role getRoleById(Integer id) {
		System.out.println(roleDao.getById(id));
		return roleDao.getById(id);
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
	    roleDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Role role,Integer [] rids) { 
		Map<String , Object> map = new HashMap<>(); 
		
		//添加用户
		roleDao.add(role); 
		map.put("result", true);
		return map; 
	}
	@RequestMapping("/form")
	public String userForm() {
		return "role/role_form";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Role role,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		int start = (page - 1)*rows;
		Map<String,Object> map = new HashMap<>();
		map.put("total",roleDao.getCountByCondition(role));
		map.put("rows",roleDao.getListByCondition(start, rows,role, sort, order));
		return map;
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> Update(Role role){ 
		Map<String, Object> map = new HashMap<>();
		//修改用户
		roleDao.update(role); 
		map.put("result", true);
		return map;
	}
	
	
}
