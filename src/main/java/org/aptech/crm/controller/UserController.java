package org.aptech.crm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 用户控制器
 * @author Miao  Long
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}
	
	public Map<String, Object> getListByCondition(){
		Map<String, Object> map = new HashMap<>();
		
		return map;
	}
}
