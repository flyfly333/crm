package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Log implements Serializable {
	private Integer id;		//编号
	
	private User user;		//用户实体类
	
	private String ip;	//ip地址
	
	@JSONField(format="yyyy-MM-dd hh:mm:ss")
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date logTime;		//操作时间
	
	private String logContext;		//日志内容
	
	private String moduleName;	//模块名称
	
	private List<Accessory> accessories;	//属于他的附件编号

	private String SlogTime;           //开始时间 //查询条件
	
	private String ElogTime;			//结束时间
	
	private String userName;            //操作人账号
	
	 
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSlogTime() {
		return SlogTime;
	}

	public void setSlogTime(String slogTime) {
		SlogTime = slogTime;
	}

	public String getElogTime() {
		return ElogTime;
	}

	public void setElogTime(String elogTime) {
		ElogTime = elogTime;
	}

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

	 

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getDateline() {
		return logTime;
	}

	public void setDateline(Date dateline) {
		this.logTime = dateline;
	}


	public Date getLogTime() {
		return logTime;
	}

	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}

	public String getLogContext() {
		return logContext;
	}

	public void setLogContext(String logContext) {
		this.logContext = logContext;
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
		return "Log [id=" + id + ", user=" + user + ", ip=" + ip + ", logTime=" + logTime + ", logContext=" + logContext
				+ ", moduleName=" + moduleName + ", accessories=" + accessories + ", SlogTime=" + SlogTime
				+ ", ElogTime=" + ElogTime + "]";
	}

	

	
}
