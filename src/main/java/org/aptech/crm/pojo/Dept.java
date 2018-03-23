package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.List;

public class Dept implements Serializable {
	
	private Integer id;		//编号
	
	private String deptCode;	//部门编码
	
	private String text;	//部门名称
	
	private List<Dept> children;	//父级实体类
	
	private String daptPrincipal;	//部门负责人
	
	private String deptPhone;		//部门电话
	
	private String deptFax;		//部门传真
	
	private String daptType;	//部门类型
	
	private String remark;		//备注

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<Dept> getChildren() {
		return children;
	}

	public void setChildren(List<Dept> children) {
		this.children = children;
	}

	public String getDaptPrincipal() {
		return daptPrincipal;
	}

	public void setDaptPrincipal(String daptPrincipal) {
		this.daptPrincipal = daptPrincipal;
	}

	public String getDeptPhone() {
		return deptPhone;
	}

	public void setDeptPhone(String deptPhone) {
		this.deptPhone = deptPhone;
	}

	public String getDeptFax() {
		return deptFax;
	}

	public void setDeptFax(String deptFax) {
		this.deptFax = deptFax;
	}

	public String getDaptType() {
		return daptType;
	}

	public void setDaptType(String daptType) {
		this.daptType = daptType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Dept [id=" + id + ", deptCode=" + deptCode + ", text=" + text + ", children=" + children + ", daptPrincipal="
				+ daptPrincipal + ", deptPhone=" + deptPhone + ", deptFax=" + deptFax + ", daptType=" + daptType
				+ ", remark=" + remark + "]";
	}

	 
	
}
