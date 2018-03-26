package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

public class User implements Serializable {
	private Integer id;		//编号
	
	private String userCode;	//用户编码
	 
	private String userName;	//账号
	
	private String password;	//密码
	
	private Integer sex;		//性别
	
	private Dept dept;		//部门
	
	private Post post;	    //职位
	
	private String phone;	//电话
	
	@JSONField(format="yyyy-MM-dd")
	private Date birthday;	//出生日期
	
	private List<Role> roles;
	
	private Date rntryTime;	//入职日期
	
	private List<ContactRecord> contactRecords;		//交往记录和用户关系表（多对多交往记录的实体类集合）
	
	private Integer locked;	//是否锁定（0不可用，1是可用）
	
	private String salt;	//盐值

	 

public Integer getId() {
		
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}
	public Date getBirthday() {
		return birthday;
	}



	public String getUserCode() {
		return userCode;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}



	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}



	public String getSalt() {
		return salt;
	}



	public void setSalt(String salt) {
		this.salt = salt;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public Integer getSex() {
		return sex;
	}



	public void setSex(Integer sex) {
		this.sex = sex;
	}



	public Dept getDept() {
		return dept;
	}



	public void setDept(Dept dept) {
		this.dept = dept;
	}



	public Post getPost() {
		return post;
	}



	public void setPost(Post post) {
		this.post = post;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}

 



	public List<Role> getRoles() {
		return roles;
	}



	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
 
	public Date getRntryTime() {
		return rntryTime;
	}



	public void setRntryTime(Date rntryTime) {
		this.rntryTime = rntryTime;
	}



	public List<ContactRecord> getContactRecords() {
		return contactRecords;
	}



	public void setContactRecords(List<ContactRecord> contactRecords) {
		this.contactRecords = contactRecords;
	}



	public Integer getLocked() {
		return locked;
	}



	public void setLocked(Integer locked) {
		this.locked = locked;
	}



	@Override
	public String toString() {
		return "User [id=" + id + ", userCode=" + userCode + ", userName=" + userName + ", password=" + password
				+ ", sex=" + sex + ", dept=" + dept + ", post=" + post + ", phone=" + phone + ", birthday=" + birthday
				+ ", roles=" + roles + ", rntryTime=" + rntryTime + ", contactRecords=" + contactRecords + ", locked="
				+ locked + ", salt=" + salt + "]";
	}
 
	 
	

}
