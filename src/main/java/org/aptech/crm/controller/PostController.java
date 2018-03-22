package org.aptech.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.aptech.crm.dao.DeptDao;
import org.aptech.crm.dao.PostDao;
import org.aptech.crm.pojo.Dept;
import org.aptech.crm.pojo.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/post")
public class PostController {
	@Resource
	private PostDao postDao;

	public void setDeptDao(PostDao postDao) {
		this.postDao = postDao;
	}
	
	@RequestMapping("/all")
	@ResponseBody
	public List<Post> getAll(){
		return postDao.getAll();
	}
	@RequestMapping("/getPostByDeptId")
	@ResponseBody
	public List<Post> getPostByDeptId(Integer deptId){
		return postDao.getPostByDeptId(deptId);
	}
	
}
