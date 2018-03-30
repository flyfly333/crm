package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class ContactRecord implements Serializable {
	private Integer id;		//交往记录编号
	
	private Custom custom;	//对应客户的实体类
	
	private String contactTheme;	//交往主题
	
	private String linkmanName;	//客户联系人实体类
	
	private String contactDesc;	//交往描述
	
	@JSONField(format="yyyy-MM-dd")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date contactTime;	//日期
	
	private int contactType;    //交往类型
	
	private User user;	//创建人的实体类
	
	private List<User> users;	//交往记录和用户关系表（多对多用户的实体类集合）
	
	private List<Accessory> accessories;	//属于他的附件集合

	private String sTime;                 //开始时间  （查询条件）
	
	private String eTime;                 //结束时间
	
	
	
	public String getsTime() {
		return sTime;
	}

	public void setsTime(String sTime) {
		this.sTime = sTime;
	}

	public String geteTime() {
		return eTime;
	}

	public void seteTime(String eTime) {
		this.eTime = eTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	
	public Date getContactTime() {
		return contactTime;
	}

	public void setContactTime(Date contactTime) {
		this.contactTime = contactTime;
	}

	public int getContactType() {
		return contactType;
	}

	public void setContactType(int contactType) {
		this.contactType = contactType;
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

	

	public String getLinkmanName() {
		return linkmanName;
	}

	public void setLinkmanName(String linkmanName) {
		this.linkmanName = linkmanName;
	}

	public String getContactDesc() {
		return contactDesc;
	}

	public void setContactDesc(String contactDesc) {
		this.contactDesc = contactDesc;
	}

	public Date getCustomTime() {
		return contactTime;
	}

	public void setCustomTime(Date customTime) {
		this.contactTime = customTime;
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
		return "ContactRecord [id=" + id + ", custom=" + custom + ", contactTheme=" + contactTheme + ", linkmanName="
				+ linkmanName + ", contactDesc=" + contactDesc + ", contactTime=" + contactTime + ", contactType="
				+ contactType + ", user=" + user + ", users=" + users + ", accessories=" + accessories + ", sTime="
				+ sTime + ", eTime=" + eTime + "]";
	}

	
	
}
