package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.List;

public class Permission implements Serializable {
	private Integer id;		//编号
	
	private String text;	//权限名称
	
	private String type;	//权限类型（menu和permission）
	
	private String url;		//权限路径
	
	private String percode;	//权限码（格式 user:add）
	
	private Permission per;	//父级权限实体类
	
	private List<Permission> children;	//所有父级权限的实体类
	
	private Integer sortstring;		//排序列
	
	private Integer available;		//是否可用（0不可用，1可用）
	
	private List<Role> roles;		//角色集合

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPercode() {
		return percode;
	}

	public void setPercode(String percode) {
		this.percode = percode;
	}

	public Permission getPer() {
		return per;
	}

	public void setPer(Permission per) {
		this.per = per;
	}

	public List<Permission> getChildren() {
		return children;
	}

	public void setChildren(List<Permission> children) {
		this.children = children;
	}

	public Integer getSortstring() {
		return sortstring;
	}

	public void setSortstring(Integer sortstring) {
		this.sortstring = sortstring;
	}

	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer available) {
		this.available = available;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return "Permission [id=" + id + ", text=" + text + ", type=" + type + ", url=" + url + ", percode=" + percode
				+ ", per=" + per + ", children=" + children + ", sortstring=" + sortstring + ", available=" + available
				+ ", roles=" + roles + "]";
	} 
}
