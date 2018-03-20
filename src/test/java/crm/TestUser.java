package crm;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-mybatis.xml")
public class TestUser {

	@Resource
	private UserDao userDao;
	
	
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
 
	@Test
	public void testUser() {
		System.out.println("userdao的值是：" + userDao);
		User user = userDao.getById(1);
		System.out.println(user);
	}

}
