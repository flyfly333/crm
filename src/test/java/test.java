import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.aptech.crm.dao.CustomDao;
import org.aptech.crm.dao.LogDao;
import org.aptech.crm.pojo.Custom;
import org.aptech.crm.pojo.Log;
import org.aptech.crm.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-mybatis.xml")
public class test {
	@Resource
	private CustomDao customDao;
	@Resource
	private LogDao logDao;
	
	public void setCustomDao(CustomDao customDao) {
		this.customDao = customDao;
	}

	@Test
	public void test() {
		Md5Hash md5 = new Md5Hash("123456","qwe",2);
		System.out.println(md5.toString());
//		Log log = new Log();
//		User user = new User();
//		user.setId(1);
//		user.setUserName("miaomiaomiao");
//		log.setLogTime(new Date());
//		log.setLogContext("内容");
//		log.setUser(user);
//		log.setModuleName("模块名称");
//		log.setIp("ip");
//		logDao.add(log);
		
//		List<Custom> list = customDao.getListByCondition(0, 5, null, "id", "asc");
//		for (Custom custom : list) {
//			System.out.println(custom);
//		}
//		System.out.println(custom);
//		for(int i = 1; i <= 6; i++) {
//			Custom custom = customDao.getById(1);
//			customDao.add(custom);
//			System.out.println(i);
//		}
//		Integer[] ids = {7,6,5};
//		customDao.deleteByIds(ids);
	}

}
