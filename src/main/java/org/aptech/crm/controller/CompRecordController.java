package org.aptech.crm.controller;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource; 
import org.aptech.crm.dao.CompRecordDao;
import org.aptech.crm.pojo.CompRecord;
import org.aptech.crm.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 用户控制器
 * @author Miao  Long 
 */
@Controller
@RequestMapping("/comprecord")
public class CompRecordController {
	@Resource
	private CompRecordDao compRecordDao;
	
  
	public void setUserDao(CompRecordDao compRecordDao) {
		this.compRecordDao = compRecordDao;
	}
 
	@RequestMapping("/index")
	public String index() {
		return "compRecord/index";
	}
	
	@RequestMapping("/detail")
	public String detail(ModelMap modelMap,Integer id) {
		modelMap.put("detailCompRecord", compRecordDao.getById(id));
		return "compRecord/detail";
	}
	
	@RequestMapping("/getCompRecordById")
	@ResponseBody
	public CompRecord getUserById(Integer id) {
		System.out.println(compRecordDao.getById(id));
		return compRecordDao.getById(id);
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
		compRecordDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(CompRecord compRecord) {
		Map<String , Object> map = new HashMap<>(); 
		User user = new User();
		user.setId(1);
		compRecord.setUser(user);
		//添加用户
		compRecordDao.add(compRecord);
		map.put("result", true);
		return map; 
	}
	@RequestMapping("/form")
	public String compRecordForm() {
		return "compRecord/comprecord_form";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,CompRecord compRecord,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		System.out.println(compRecord);
		int start = (page - 1)*rows;
		Map<String,Object> map = new HashMap<>();
		map.put("total",compRecordDao.getCountByCondition(compRecord));
		map.put("rows",compRecordDao.getListByCondition(start, rows,compRecord, sort, order));
		return map;
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> Update(CompRecord compRecord ){
		Map<String, Object> map = new HashMap<>();
		compRecordDao.update(compRecord);
		map.put("result", true);
		return map;
	}
	
	 
}
