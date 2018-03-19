package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;

public class Complain implements Serializable {
	private Integer id;		//投诉编号
	
	private Custom custom;	//客户实体类
	
	private String compTheme;	//投诉主题
	
	private String compDesc;	//描述
	
	private Date compTime;		//投诉时间
	
	private Linkman linkman;	//投诉人实体类
	
	private Integer compDegree;	//紧急过程（0、1、2）
	
	private String compCourse;	//处理过程
	
	private Integer compResult;	//处理结果
	
	private String compRemark;	//备注

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

	public String getCompTheme() {
		return compTheme;
	}

	public void setCompTheme(String compTheme) {
		this.compTheme = compTheme;
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

	public Linkman getLinkman() {
		return linkman;
	}

	public void setLinkman(Linkman linkman) {
		this.linkman = linkman;
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

	@Override
	public String toString() {
		return "Complain [id=" + id + ", custom=" + custom + ", compTheme=" + compTheme + ", compDesc=" + compDesc
				+ ", compTime=" + compTime + ", linkman=" + linkman + ", compDegree=" + compDegree + ", compCourse="
				+ compCourse + ", compResult=" + compResult + ", compRemark=" + compRemark + "]";
	}
	
}
