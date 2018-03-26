package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.List;

public class Address implements Serializable {
	private Integer id;		//地址编号
	
	private String text;	//地址名称
	
	private List<Address> children;	//父级实体类

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<Address> getChildren() {
		return children;
	}

	public void setChildren(List<Address> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", text=" + text + ", children=" + children + "]";
	}
}
