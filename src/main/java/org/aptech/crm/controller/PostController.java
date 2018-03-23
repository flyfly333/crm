package org.aptech.crm.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.aptech.crm.dao.PostDao;
import org.aptech.crm.pojo.Post;
import org.aptech.crm.pojo.Role;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/post")
public class PostController {
	@Resource
	private PostDao postDao;

	public void setDeptDao(PostDao postDao) {
		this.postDao = postDao;
	}
	
	@RequestMapping("/index")
	public String index() {
		return "post/index";
	}
	
	@RequestMapping("/form")
	public String userForm() {
		return "post/post_form";
	}
	
	@RequestMapping("/getPostById")
	@ResponseBody
	public Post getRoleById(Integer id) {
		System.out.println(postDao.getById(id));
		return postDao.getById(id);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Post post,Integer [] rids) { 
		System.out.println(post);
		Map<String , Object> map = new HashMap<>(); 
		//添加用户
		postDao.add(post); 
		map.put("result", true);
		return map; 
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
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
	    postDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> Update(Post post){ 
		Map<String, Object> map = new HashMap<>();
		//修改用户
		postDao.update(post); 
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Post post,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		int start = (page - 1)*rows;
		Map<String,Object> map = new HashMap<>();
		map.put("total",postDao.getCountByCondition(post));
		map.put("rows",postDao.getListByCondition(start, rows,post, sort, order));
		return map;
	}
	
}
