package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Log implements Serializable {
	private Integer id;		//编号
	
	private User user;		//用户实体类
	
	private String ipAddress;	//ip地址
	
	private Date dateline;		//操作时间
	
	private String content;		//日志内容
	
	private String moduleName;	//模块名称
	
	private List<Accessory> accessories;	//属于他的附件编号

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Date getDateline() {
		return dateline;
	}

	public void setDateline(Date dateline) {
		this.dateline = dateline;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public List<Accessory> getAccessories() {
		return accessories;
	}

	public void setAccessories(List<Accessory> accessories) {
		this.accessories = accessories;
	}

	@Override
	public String toString() {
		return "Log [id=" + id + ", user=" + user + ", ipAddress=" + ipAddress + ", dateline=" + dateline + ", content="
				+ content + ", moduleName=" + moduleName + ", accessories=" + accessories + "]";
	}
	
}
