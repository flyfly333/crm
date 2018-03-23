package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.aptech.crm.dao.DeptDao;
import org.aptech.crm.pojo.Dept;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/dept")
public class DeptController {
	@Resource
	private DeptDao deptDao;

	public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
	}
	
	@RequestMapping("/all")
	@ResponseBody
	public List<Dept> getAll(){
		return deptDao.getAll();
	}
	
	@RequestMapping("/index")
	public String index() {
		return "dept/index";
	}
	
	@RequestMapping("/getById")
	@ResponseBody
	public Dept getById(Integer id) {
		System.out.println(deptDao.getById(id));
		return deptDao.getById(id);
	}
	
	  
	@RequestMapping("/list")
	@ResponseBody
	public List<Dept> list(){
		List<Dept> list = deptDao.getAll();
		Dept dept = new Dept();
		dept.setId(0);
		dept.setText("顶级权限");
		list.add(0, dept);
		return list;
	}
	@RequestMapping("/list2")
	@ResponseBody
	public List<Dept> list2(){ 
		return deptDao.getAll();
	}
	@RequestMapping("/form")
	public String Form() {
		return "dept/dept_form";
	}
	
	
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Dept dept){
		  Map<String, Object> map = new HashMap<>(); 
		  deptDao.add(dept);
		  map.put("result", true);
		  return map;
	} 
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> update(Dept dept){
		System.out.println(dept);
		Map<String, Object> map = new HashMap<>();
		System.out.println(dept);
		deptDao.update(dept); 
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String, Object> update(Integer id){
		Map<String, Object> map = new HashMap<>();
		//先删除关系
		deptDao.deleteById(id);
		map.put("result", true);
		return map;
	}
	
	 
	
}
