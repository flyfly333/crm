package org.aptech.crm.pojo;

import java.io.Serializable;

public class Diction implements Serializable {
	private Integer id;		//字典表编号
	
	private String name;	//名称
	
	private Integer available;	//是否可用（0不可用，1可用）

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer available) {
		this.available = available;
	}

	@Override
	public String toString() {
		return "Diction [id=" + id + ", name=" + name + ", available=" + available + "]";
	}
	
}
