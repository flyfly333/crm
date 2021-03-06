package org.aptech.crm.dao;  
import java.util.List;

import org.aptech.crm.pojo.Post;
/**
 * 职位dao接口  
 */
public interface PostDao extends CommonDao<Post, Integer> {

	 public List<Post> getPostByDeptId(Integer deptId);
}