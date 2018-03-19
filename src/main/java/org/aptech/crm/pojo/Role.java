package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable {
	private Integer id;		//编号
	
	private String name;	//角色名称
	
	private Integer available;	//是否可用（0不可用，1可用）
	
	private List<User> users;	//用户集合
	
	private List<Permission> pers;	//权限集合
	
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

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Permission> getPers() {
		return pers;
	}

	public void setPers(List<Permission> pers) {
		this.pers = pers;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", available=" + available + ", users=" + users + ", pers=" + pers
				+ "]";
	}

}
