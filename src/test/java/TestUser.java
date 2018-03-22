 
import java.util.List;

import javax.annotation.Resource;
import org.aptech.crm.dao.DeptDao;
import org.aptech.crm.dao.PostDao;
import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.Post;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-mybatis.xml")
public class TestUser {

	@Resource
	private UserDao userDao;
	
	@Resource
	private DeptDao deptDao;
	@Resource
	private PostDao postDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	 
    public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
	}


	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}


	
	
	
	@Test
	public void testUser2() { 
		List<Post> list = postDao.getPostByDeptId(2);
		
		for (Post post : list) {
			System.out.println(post);
		}
		System.out.println("123");
	}

}
