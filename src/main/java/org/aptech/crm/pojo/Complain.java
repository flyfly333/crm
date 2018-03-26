package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class Complain implements Serializable {
	
	private Integer id;		//投诉编号
	
	private Custom custom;	//客户实体类
	
	private String compTheme;	//投诉主题
	
	private Integer compType;    //投诉类型
	
	private String compDesc;	//描述
	
	@JSONField(format="yyyy-MM-dd hh:mm:ss")
	private Date compTime;		//投诉时间
	
	private String compUser;	//投诉人实体类
	
	private Integer compDegree;	//紧急过程（1、2 、3）
	
	private String compCourse;	//处理过程
	
	private Integer compResult;	//处理结果
	
	private String compRemark;	//备注
	
	private String feedback;    //客户反馈
	
	private User user; 			//创建人

	private String Stime;       //开始查询时间字符串
	
	private String Etime;        //结束查询时间字符串
	
	
	public String getStime() {
		return Stime;
	}

	public void setStime(String stime) {
		Stime = stime;
	}

	public String getEtime() {
		return Etime;
	}

	public void setEtime(String etime) {
		Etime = etime;
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

	public Custom getCustom() {
		return custom;
	}

	public void setCustom(Custom custom) {
		this.custom = custom;
	}

	public String getCompTheme() {
		return compTheme;
	}

	public void setCompTheme(String compTheme) {
		this.compTheme = compTheme;
	}

	public Integer getCompType() {
		return compType;
	}

	public void setCompType(Integer compType) {
		this.compType = compType;
	}

	public String getCompDesc() {
		return compDesc;
	}

	public void setCompDesc(String compDesc) {
		this.compDesc = compDesc;
	}

	public Date getCompTime() {
		return compTime;
	}

	public void setCompTime(Date compTime) {
		this.compTime = compTime;
	}

	public String getCompUser() {
		return compUser;
	}

	public void setCompUser(String compUser) {
		this.compUser = compUser;
	}

	public Integer getCompDegree() {
		return compDegree;
	}

	public void setCompDegree(Integer compDegree) {
		this.compDegree = compDegree;
	}

	public String getCompCourse() {
		return compCourse;
	}

	public void setCompCourse(String compCourse) {
		this.compCourse = compCourse;
	}

	public Integer getCompResult() {
		return compResult;
	}

	public void setCompResult(Integer compResult) {
		this.compResult = compResult;
	}

	public String getCompRemark() {
		return compRemark;
	}

	public void setCompRemark(String compRemark) {
		this.compRemark = compRemark;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	@Override
	public String toString() {
		return "Complain [id=" + id + ", custom=" + custom + ", compTheme=" + compTheme + ", compType=" + compType
				+ ", compDesc=" + compDesc + ", compTime=" + compTime + ", compUser=" + compUser + ", compDegree="
				+ compDegree + ", compCourse=" + compCourse + ", compResult=" + compResult + ", compRemark="
				+ compRemark + ", feedback=" + feedback + "]";
	}

	 
}
