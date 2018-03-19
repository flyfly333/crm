package org.aptech.crm.pojo;

import java.io.Serializable;

public class Trade implements Serializable {
	private Integer id;		//行业编号
	
	private String name;	//行业名称
	
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
		return "Trade [id=" + id + ", name=" + name + ", available=" + available + "]";
	}
	
}
