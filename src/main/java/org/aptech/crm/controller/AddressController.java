package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.aptech.crm.dao.AddressDao;
import org.aptech.crm.pojo.Address;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Resource
	public AddressDao addressDao;

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
	@RequestMapping("/getProAll")
	@ResponseBody
	public Map<String, Object> selectProvinceAll(Integer parentId) throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		List<Address> list = addressDao.getProvinceAll(parentId);
		map.put("province", list);
		
		return map;
	}
}
