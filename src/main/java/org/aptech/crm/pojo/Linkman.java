package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;

public class Linkman implements Serializable {
	private Integer id;		//联系人编号
	
	private Custom custom;	//对应的客户实体类
	
	private String name;	//联系人姓名
	
	private Integer sex;	//性别（0女，1男）
	
	private String service;	//负责业务
	
	private String title;	//称呼
	
	private String section;		//部门
	
	private String post;		//职务
	
	private Integer type;		//联系人类型（1主联系人，0联系人）
	
	private String workPhone;	//工作电话
	
	private String email;		//邮箱
	
	private String movePhone;	//移动电话
	
	private String QQ;		//QQ号码
	
	private String homeAddress;		//家庭地址
	
	private Date birthday;		//生日
	
	private String hobby;		//爱好
	
	private String remark;		//备注
	
	private User user;		//当前登录用户实体类（取出用户姓名作为创建人）
	
	private Date createTime;	//创建时间

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getWorkPhone() {
		return workPhone;
	}

	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMovePhone() {
		return movePhone;
	}

	public void setMovePhone(String movePhone) {
		this.movePhone = movePhone;
	}

	public String getQQ() {
		return QQ;
	}

	public void setQQ(String qQ) {
		QQ = qQ;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Linkman [id=" + id + ", custom=" + custom + ", name=" + name + ", sex=" + sex + ", service=" + service
				+ ", title=" + title + ", section=" + section + ", post=" + post + ", type=" + type + ", workPhone="
				+ workPhone + ", email=" + email + ", movePhone=" + movePhone + ", QQ=" + QQ + ", homeAddress="
				+ homeAddress + ", birthday=" + birthday + ", hobby=" + hobby + ", remark=" + remark + ", user=" + user
				+ ", createTime=" + createTime + "]";
	}
	
	
	
}
