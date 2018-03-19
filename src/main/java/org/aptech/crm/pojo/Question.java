package org.aptech.crm.pojo;

import java.io.Serializable;

public class Question implements Serializable {
	private Integer id;		//QA库编号
	
	private String question;	//问题
	
	private String answer;		//答案
	
	private String hintText;	//提示关键字（搜索用）
	
	private String type;		//问题类型

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getHintText() {
		return hintText;
	}

	public void setHintText(String hintText) {
		this.hintText = hintText;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", question=" + question + ", answer=" + answer + ", hintText=" + hintText
				+ ", type=" + type + "]";
	}
	
}
