package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ContactRecord implements Serializable {
	private Integer id;		//交往记录编号
	
	private Custom custom;	//对应客户的实体类
	
	private String contactTheme;	//交往主题
	
	private Linkman linkman;	//客户联系人实体类
	
	private String contactDesc;	//交往描述
	
	private Date customTime;	//日期
	
	private User user;	//创建人的实体类
	
	private List<User> users;	//交往记录和用户关系表（多对多用户的实体类集合）
	
	private List<Accessory> accessories;	//属于他的附件集合

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Custom getCustom() {
		return custom;
	}

	public void setCustom(Custom custom) {
		this.custom = custom;
	}

	public String getContactTheme() {
		return contactTheme;
	}

	public void setContactTheme(String contactTheme) {
		this.contactTheme = contactTheme;
	}

	public Linkman getLinkman() {
		return linkman;
	}

	public void setLinkman(Linkman linkman) {
		this.linkman = linkman;
	}

	public String getContactDesc() {
		return contactDesc;
	}

	public void setContactDesc(String contactDesc) {
		this.contactDesc = contactDesc;
	}

	public Date getCustomTime() {
		return customTime;
	}

	public void setCustomTime(Date customTime) {
		this.customTime = customTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Accessory> getAccessories() {
		return accessories;
	}

	public void setAccessories(List<Accessory> accessories) {
		this.accessories = accessories;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "ContactRecord [id=" + id + ", custom=" + custom + ", contactTheme=" + contactTheme + ", linkman="
				+ linkman + ", contactDesc=" + contactDesc + ", customTime=" + customTime + ", user=" + user
				+ ", users=" + users + ", accessories=" + accessories + "]";
	}
	
}
