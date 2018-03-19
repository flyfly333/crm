package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class CustomCare implements Serializable {
	public Integer id;		//客户关怀编号
	
	private Custom custom;	//客户实体类
	
	private String careTheme;	//关怀主题
	
	private Date careTime;		//日期
	
	private String careContext;	//关怀内容
	
	private String contacts;	//联系人
	
	private String executor;	//执行人
	
	private String careType;	//关怀类型
	
	private String customFeedback;	//客户反馈
	
	private List<Accessory> accessorys;	//属于他的附件集合

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

	public String getCareTheme() {
		return careTheme;
	}

	public void setCareTheme(String careTheme) {
		this.careTheme = careTheme;
	}

	public Date getCareTime() {
		return careTime;
	}

	public void setCareTime(Date careTime) {
		this.careTime = careTime;
	}

	public String getCareContext() {
		return careContext;
	}

	public void setCareContext(String careContext) {
		this.careContext = careContext;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getExecutor() {
		return executor;
	}

	public void setExecutor(String executor) {
		this.executor = executor;
	}

	public String getCareType() {
		return careType;
	}

	public void setCareType(String careType) {
		this.careType = careType;
	}

	public String getCustomFeedback() {
		return customFeedback;
	}

	public void setCustomFeedback(String customFeedback) {
		this.customFeedback = customFeedback;
	}

	public List<Accessory> getAccessorys() {
		return accessorys;
	}

	public void setAccessorys(List<Accessory> accessorys) {
		this.accessorys = accessorys;
	}

	@Override
	public String toString() {
		return "CustomCare [id=" + id + ", custom=" + custom + ", careTheme=" + careTheme + ", careTime=" + careTime
				+ ", careContext=" + careContext + ", contacts=" + contacts + ", executor=" + executor + ", careType="
				+ careType + ", customFeedback=" + customFeedback + ", accessorys=" + accessorys + "]";
	}
	
}
