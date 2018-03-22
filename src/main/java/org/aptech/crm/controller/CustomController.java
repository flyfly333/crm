package org.aptech.crm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.aptech.crm.dao.CustomDao;
import org.aptech.crm.pojo.Custom;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public Map<String, Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Custom custom,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		int start = (page - 1)*rows;
		map.put("totle", customDao.getCountByCondition(custom));
		map.put("rows", customDao.getListByCondition(start, rows, custom, sort, order));
		return map;
	}

}
