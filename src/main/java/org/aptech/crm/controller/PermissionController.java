package org.aptech.crm.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map; 
import javax.annotation.Resource; 
import org.aptech.crm.dao.PermissionDao;
import org.aptech.crm.pojo.Permission; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/permission")
public class PermissionController {
	 
	@Resource
	private PermissionDao permissionDao;
	
	
	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	@RequestMapping("/index")
	public String index() {
		return "permission/index";
	}
	
	@RequestMapping("/getById")
	@ResponseBody
	public Permission getById(Integer id) {
		System.out.println(permissionDao.getById(id));
		return permissionDao.getById(id);
	}
	
	@RequestMapping("/all")
	@ResponseBody
	public List<Permission> getAll(){ 
		List<Permission> list = permissionDao.getAll();
		Permission top = new Permission();
		top.setText("顶级权限");
		top.setId(0);
		list.add(0,top);
		return list;
	}
	
	@RequestMapping(value = "/allotPer",method = RequestMethod.GET)
	public String allptPer(Integer rid,ModelMap modelMap) {
		modelMap.put("rid", rid);
		return "permission/allot_form";
	}
	
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Permission> list(){
		return permissionDao.getAll();
	}
	
	@RequestMapping("/form")
	public String Form() {
		return "permission/permission_form";
	}
	
	
	@RequestMapping(value = "/allotPer",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> allptPer(Integer roleId,Integer[] ids) {
		Map<String, Object> map = new HashMap<>();
		permissionDao.deleteRela(roleId);
		permissionDao.allotPer(roleId, ids);
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Permission permission){
		  Map<String, Object> map = new HashMap<>(); 
		  permissionDao.add(permission);
		  map.put("result", true);
		  return map;
	} 
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> update(Permission permission){
		Map<String, Object> map = new HashMap<>();
		System.out.println(permission);
		permissionDao.update(permission); 
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> update(Integer id){
		Map<String, Object> map = new HashMap<>();
		//先删除关系
		permissionDao.deletePerRela(id);
		permissionDao.deleteById(id);
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/getPerIdsByRid")
	@ResponseBody
	public List<Integer> getIdsByRid(Integer rid){
		System.out.println(rid);
		System.out.println(permissionDao.getPersByrid(rid).size());
		return permissionDao.getPersByrid(rid);
	}
	
}
