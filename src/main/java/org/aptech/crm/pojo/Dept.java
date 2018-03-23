package org.aptech.crm.pojo;

import java.io.Serializable;

public class Dept implements Serializable {
	
	private Integer id;		//编号
	
	private String deptCode;	//部门编码
	
	private String deptName;	//部门名称
	
	private Dept dept;		//父级实体类
	
	private String deptPrincipal;	//部门负责人
	
	private String deptPhone;		//部门电话
	
	private String deptFax;		//部门传真
	
	private String deptType;	//部门类型
	
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
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

	public String getDeptPrincipal() {
		return deptPrincipal;
	}

	public void setDeptPrincipal(String deptPrincipal) {
		this.deptPrincipal = deptPrincipal;
	}

	public String getDeptType() {
		return deptType;
	}

	public void setDeptType(String deptType) {
		this.deptType = deptType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Dept [id=" + id + ", deptCode=" + deptCode + ", deptName=" + deptName + ", dept=" + dept
				+ ", deptPrincipal=" + deptPrincipal + ", deptPhone=" + deptPhone + ", deptFax=" + deptFax
				+ ", deptType=" + deptType + ", remark=" + remark + "]";
	}
	
}
