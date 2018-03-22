package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Custom implements Serializable {
	private Integer id;		//客户编号
	
	private String customName;	//客户名称
	
	private String shortName;	//简称
	
	private String customType;	//客户种类
	
	private Trade trade;		//行业实体类
	
	private String customScale;	//规模（多少人）
	
	private String customCtage;	//客户阶段（售前，售后...）
	
	private String customSummary;	//公司简介
	
	private Integer customAssess;	//客户价值评估
	
	private String customCreditGrade;	//客户信用等级
	
	private String  customRelaGrade;	//客户管理等级
	
	private String customSource;	//客户来源
	
	private Address address;	//地址实体类（取出 国家、地区，省份，城市）
	
	private String customZipCode;	//邮编
	
	private String customPhone;		//电话
	
	private String customFax;		//传真
	
	private String customUrl;		//网址
	
	private String customAddress;	//详细地址
	
	private String customRemark;	//备注
	
	@JSONField(format="yyyy-hh-dd HH:mm:ss")
	private Date createTime;		//创建时间
	
	private User user;		//用户实体类（跟踪进行项目的用户）

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCustomName() {
		return customName;
	}

	public void setCustomName(String customName) {
		this.customName = customName;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getCustomType() {
		return customType;
	}

	public void setCustomType(String customType) {
		this.customType = customType;
	}

	public Trade getTrade() {
		return trade;
	}

	public void setTrade(Trade trade) {
		this.trade = trade;
	}

	public String getCustomScale() {
		return customScale;
	}

	public void setCustomScale(String customScale) {
		this.customScale = customScale;
	}

	public String getCustomCtage() {
		return customCtage;
	}

	public void setCustomCtage(String customCtage) {
		this.customCtage = customCtage;
	}

	public String getCustomSummary() {
		return customSummary;
	}

	public void setCustomSummary(String customSummary) {
		this.customSummary = customSummary;
	}

	public Integer getCustomAssess() {
		return customAssess;
	}

	public void setCustomAssess(Integer customAssess) {
		this.customAssess = customAssess;
	}

	public String getCustomCreditGrade() {
		return customCreditGrade;
	}

	public void setCustomCreditGrade(String customCreditGrade) {
		this.customCreditGrade = customCreditGrade;
	}

	public String getCustomRelaGrade() {
		return customRelaGrade;
	}

	public void setCustomRelaGrade(String customRelaGrade) {
		this.customRelaGrade = customRelaGrade;
	}

	public String getCustomSource() {
		return customSource;
	}

	public void setCustomSource(String customSource) {
		this.customSource = customSource;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getCustomZipCode() {
		return customZipCode;
	}

	public void setCustomZipCode(String customZipCode) {
		this.customZipCode = customZipCode;
	}

	public String getCustomPhone() {
		return customPhone;
	}

	public void setCustomPhone(String customPhone) {
		this.customPhone = customPhone;
	}

	public String getCustomFax() {
		return customFax;
	}

	public void setCustomFax(String customFax) {
		this.customFax = customFax;
	}

	public String getCustomUrl() {
		return customUrl;
	}

	public void setCustomUrl(String customUrl) {
		this.customUrl = customUrl;
	}

	public String getCustomAddress() {
		return customAddress;
	}

	public void setCustomAddress(String customAddress) {
		this.customAddress = customAddress;
	}

	public String getCustomRemark() {
		return customRemark;
	}

	public void setCustomRemark(String customRemark) {
		this.customRemark = customRemark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Custom [id=" + id + ", customName=" + customName + ", shortName=" + shortName + ", customType="
				+ customType + ", trade=" + trade + ", customScale=" + customScale + ", customCtage=" + customCtage
				+ ", customSummary=" + customSummary + ", customAssess=" + customAssess + ", customCreditGrade="
				+ customCreditGrade + ", customRelaGrade=" + customRelaGrade + ", customSource=" + customSource
				+ ", address=" + address + ", customZipCode=" + customZipCode + ", customPhone=" + customPhone
				+ ", customFax=" + customFax + ", customUrl=" + customUrl + ", customAddress=" + customAddress
				+ ", customRemark=" + customRemark + ", createTime=" + createTime + ", user=" + user + "]";
	}
	
}
