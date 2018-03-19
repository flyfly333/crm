package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;

public class CompRecord implements Serializable {
	private Integer id;		//客服记录编号
	
	private String serTheme;	//服务主题
	
	private Custom custom;		//客户实体类
	
	private String serType;		//服务类型
	
	private String serWay;		//服务方式
	
	private String serContext;	//服务内容
	
	private Date sTime;		//开始时间
	
	private Date eTime;		//结束时间
	
	private Linkman linkman;	//客户联系人实体类
	
	private User user;		//执行人  用户实体类
	
	private Integer status;		//状态 （0.无需处理  1.未处理  2.处理中  3.处理完成）
	
	private String remark;		//备注

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSerTheme() {
		return serTheme;
	}

	public void setSerTheme(String serTheme) {
		this.serTheme = serTheme;
	}

	public Custom getCustom() {
		return custom;
	}

	public void setCustom(Custom custom) {
		this.custom = custom;
	}

	public String getSerType() {
		return serType;
	}

	public void setSerType(String serType) {
		this.serType = serType;
	}

	public String getSerWay() {
		return serWay;
	}

	public void setSerWay(String serWay) {
		this.serWay = serWay;
	}

	public String getSerContext() {
		return serContext;
	}

	public void setSerContext(String serContext) {
		this.serContext = serContext;
	}

	public Date getsTime() {
		return sTime;
	}

	public void setsTime(Date sTime) {
		this.sTime = sTime;
	}

	public Date geteTime() {
		return eTime;
	}

	public void seteTime(Date eTime) {
		this.eTime = eTime;
	}

	public Linkman getLinkman() {
		return linkman;
	}

	public void setLinkman(Linkman linkman) {
		this.linkman = linkman;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "CompRecord [id=" + id + ", serTheme=" + serTheme + ", custom=" + custom + ", serType=" + serType
				+ ", serWay=" + serWay + ", serContext=" + serContext + ", sTime=" + sTime + ", eTime=" + eTime
				+ ", linkman=" + linkman + ", user=" + user + ", status=" + status + ", remark=" + remark + "]";
	}
	
}
