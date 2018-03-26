package org.aptech.crm.controller;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource; 
import org.aptech.crm.dao.QuestionDao;
import org.aptech.crm.pojo.Question;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestParam;  
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * 问题控制器
 * @author Miao  Long 
 */
@Controller
@RequestMapping("/question")
public class QuestionController {
	@Resource
	private QuestionDao questionDao;
	
  
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}
 
	@RequestMapping("/index")
	public String index() {
		return "question/index";
	}
	
	@RequestMapping("/getQuestionById")
	@ResponseBody
	public Question getQuestionById(Integer id) {
		System.out.println(questionDao.getById(id));
		return questionDao.getById(id);
	}
	
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Map<String, Object> batchDelete(Integer []ids){
	    Map<String, Object> map = new HashMap<>();
	    questionDao.deleteByIds(ids); 
		map.put("result", true);
		return map;
	}
	 
	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> add(Question question,String answer) { 
		Map<String , Object> map = new HashMap<>(); 
		questionDao.add(question); 
		map.put("result", true);
		return map; 
	}
	@RequestMapping("/form")
	public String QuestionForm() {
		return "question/question_form";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String,Object> getListByCondition(@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows,Question question,@RequestParam(defaultValue="id")String sort,@RequestParam(defaultValue = "asc")String order){
		System.out.println(question);
		int start = (page - 1)*rows;
		Map<String,Object> map = new HashMap<>(); 
		map.put("total",questionDao.getCount());
		map.put("rows",questionDao.getListByCondition(start, rows,question, sort, order));
		return map;
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String, Object> Update(Question question){
		 
		Map<String, Object> map = new HashMap<>();
		questionDao.update(question);
		 
		map.put("result", true);
		return map;
	} 
}
