package org.aptech.crm.pojo;

import java.io.Serializable;

public class Address implements Serializable {
	private Integer id;		//地址编号
	
	private String addName;	//地址名称
	
	private Address address;	//父级实体类

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAddName() {
		return addName;
	}

	public void setAddName(String addName) {
		this.addName = addName;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", addName=" + addName + ", address=" + address + "]";
	}
	
}
