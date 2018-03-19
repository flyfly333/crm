package org.aptech.crm.pojo;

import java.io.Serializable;

public class Post implements Serializable {
	private Integer id;		//职位编号
	
	private String postName;	//职位名称
	
	private String postDesc;	//职位描述
	
	private Dept dept;		//部门实体类

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getPostDesc() {
		return postDesc;
	}

	public void setPostDesc(String postDesc) {
		this.postDesc = postDesc;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", postName=" + postName + ", postDesc=" + postDesc + ", dept=" + dept + "]";
	}
	
}
