package crm;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.enterprise.inject.New;

import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.Dept;
import org.aptech.crm.pojo.Post;
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
  
	public void testUser2() { 
		  System.out.println("123");
	}

}
