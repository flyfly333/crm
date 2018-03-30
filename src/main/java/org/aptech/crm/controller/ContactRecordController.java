package org.aptech.crm.controller;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource; 
import org.aptech.crm.dao.ContactRecordDao;
import org.aptech.crm.pojo.ContactRecord;
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
@RequestMapping("/contactrecord")
public class ContactRecordController {
	@Resource
	private ContactRecordDao contactRecordDao;
	
  
	public void setUserDao(ContactRecordDao contactRecordDao) {
		this.contactRecordDao = contactRecordDao;
	}
 
	@RequestMapping("/index")
	public String index() {
		return "contactRecord/index";
	}
	
	@RequestMapping("/detail")
	public String detail(ModelMap modelMap,Integer id) {
		modelMap.put("detailContactRecord", contactRecordDao.getById(id));
		return "contactRecord/detail";
	}
	
	@RequestMapping("/getContactRecordById")
	@ResponseBody
	public ContactRecord getUserById(Integer id) {
		System.out.println(contactRecordDao.getById(id));
		return contactRecordDao.getById(id);
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
		contactRecordDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(ContactRecord contactRecord) {
		Map<String , Object> map = new HashMap<>(); 
		User user = new User();
		user.setId(1);
		contactRecord.setUser(user);
		//添加用户
		contactRecordDao.add(contactRecord);
		map.put("result", true);
		return map; 
	}
	@RequestMapping("/form")
	public String contactRecordForm() {
		return "contactRecord/contactrecord_form";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,ContactRecord contactRecord,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		System.out.println(contactRecord);
		int start = (page - 1)*rows;
		Map<String,Object> map = new HashMap<>();
		map.put("total",contactRecordDao.getCountByCondition(contactRecord));
		map.put("rows",contactRecordDao.getListByCondition(start, rows,contactRecord, sort, order));
		return map;
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> Update(ContactRecord contactRecord ){
		Map<String, Object> map = new HashMap<>();
		contactRecordDao.update(contactRecord);
		map.put("result", true);
		return map;
	}
	
	 
}
