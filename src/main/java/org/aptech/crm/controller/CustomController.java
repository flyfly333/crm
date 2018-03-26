package org.aptech.crm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.aptech.crm.dao.AddressDao;
import org.aptech.crm.dao.CustomDao;
import org.aptech.crm.pojo.Address;
import org.aptech.crm.pojo.Custom;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 客户控制器
 * @author 高松柏
 *
 */
@Controller
@RequestMapping("/custom")
public class CustomController {
	@Resource
	private CustomDao customDao;

	public void setCustomDao(CustomDao customDao) {
		this.customDao = customDao;
	}
	
	@RequestMapping("/myCustom")
	public String myCustom() throws Exception {
		return "custom/myCustom";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Custom custom,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order,String startTime,String endTime) throws Exception {
		Map<String, Object> map = new HashMap<>();
		int start = (page - 1)*rows;
		map.put("total", customDao.getCountByCondition(custom,startTime,endTime));
		map.put("rows", customDao.getListByCondition(start, rows, custom, sort, order,startTime,endTime));
		return map;
	}
	
	@RequestMapping("/getAll")
	@ResponseBody
	public List<Custom> getAll() throws Exception{
		List<Custom> list = customDao.getAll();
		return list;
	}
	
	@RequestMapping("/toAddCustom")
	public String toAddCustom() throws Exception {
		return "custom/addCustom";
	}
	
	@RequestMapping("/addCustom")
	@ResponseBody
	public Map<String, Object> addCustom(Custom custom) throws Exception {
		Map<String, Object> map = new HashMap<>();
		customDao.add(custom);
		map.put("result", true);
		return map;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(Custom user){
		Map<String, Object> map = new HashMap<>();
		customDao.update(user);
		
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer[] ids) throws Exception {
		Map<String, Object> map = new HashMap<>();
		customDao.deleteByIds(ids);
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/view")
	@ResponseBody
	public Custom view(Integer id) throws Exception {
		return customDao.getById(id);
	}

}
