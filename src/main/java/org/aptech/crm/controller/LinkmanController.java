package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.aptech.crm.dao.LinkmanDao;
import org.aptech.crm.pojo.Linkman;
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
@RequestMapping("/linkman")
public class LinkmanController {
	@Resource
	private LinkmanDao linkmanDao;
	
	public void setLinkmanDao(LinkmanDao linkmanDao) {
		this.linkmanDao = linkmanDao;
	}

	@RequestMapping("/linkman")
	public String myCustom() throws Exception {
		return "custom/linkman";
	}
	
	@RequestMapping("/getAll")
	@ResponseBody
	public List<Linkman> getAll() throws Exception {
		return linkmanDao.getAll();
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Linkman linkman,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order) throws Exception {
		Map<String, Object> map = new HashMap<>();
		int start = (page - 1)*rows;
		map.put("total", linkmanDao.getCountByCondition(linkman));
		map.put("rows", linkmanDao.getListByCondition(start, rows, linkman, sort, order));
		return map;
	}
	
	@RequestMapping("/toAddCustom")
	public String toAddCustom() throws Exception {
		return "custom/addCustom";
	}
	
	@RequestMapping("/addCustom")
	@ResponseBody
	public Map<String, Object> addCustom(Linkman linkman) throws Exception {
		Map<String, Object> map = new HashMap<>();
		linkmanDao.add(linkman);
		map.put("result", true);
		return map;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> edit(Linkman linkman){
		Map<String, Object> map = new HashMap<>();
		linkmanDao.update(linkman);
		
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer[] ids) throws Exception {
		Map<String, Object> map = new HashMap<>();
		linkmanDao.deleteByIds(ids);
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("/view")
	@ResponseBody
	public Linkman view(Integer id) throws Exception {
		return linkmanDao.getById(id);
	}

}
