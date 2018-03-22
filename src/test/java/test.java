import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.aptech.crm.dao.CustomDao;
import org.aptech.crm.pojo.Custom;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-mybatis.xml")
public class test {
	@Resource
	private CustomDao customDao;
	
	public void setCustomDao(CustomDao customDao) {
		this.customDao = customDao;
	}

	@Test
	public void test() {
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
