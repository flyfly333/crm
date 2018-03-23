package org.aptech.crm.controller;

import java.util.List;

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
		for (Dept dept : deptDao.getAll()) {
			System.out.println("123");
			System.out.println(dept);
			//System.out.println(dept.getChildren().size());
		}
		return deptDao.getAll();
	}
	
}
