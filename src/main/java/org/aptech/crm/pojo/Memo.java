package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;

public class Memo implements Serializable {
	private Integer id;		//代办事宜编号
	
	private Custom custom;	//对应客户的实体类
	
	private String contactTheme;	//交往主题
	
	private Linkman linkman;	//客户联系人实体类
	
	private String contactDesc;	//交往描述
	
	private Date customTime;	//日期
	
	private User user;	//创建人的实体类
	
	private Integer contactStatus;		//状态（1.未结束  2.已结束  3.取消）

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

	public Integer getContactStatus() {
		return contactStatus;
	}

	public void setContactStatus(Integer contactStatus) {
		this.contactStatus = contactStatus;
	}

	@Override
	public String toString() {
		return "Memo [id=" + id + ", custom=" + custom + ", contactTheme=" + contactTheme + ", linkman=" + linkman
				+ ", contactDesc=" + contactDesc + ", customTime=" + customTime + ", user=" + user + ", contactStatus="
				+ contactStatus + "]";
	}
	
}
