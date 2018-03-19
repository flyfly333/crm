package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class WorkTalk implements Serializable {
	private Integer id;		//工作报告表编号
	
	private String talkTheme;	//报告主题
	
	private Date talkTime;	//时间
	
	private String talkDesc;	//报告描述
	
	private List<Accessory> accessories;	//属于他的附件集合

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTalkTheme() {
		return talkTheme;
	}

	public void setTalkTheme(String talkTheme) {
		this.talkTheme = talkTheme;
	}

	public Date getTalkTime() {
		return talkTime;
	}

	public void setTalkTime(Date talkTime) {
		this.talkTime = talkTime;
	}

	public String getTalkDesc() {
		return talkDesc;
	}

	public void setTalkDesc(String talkDesc) {
		this.talkDesc = talkDesc;
	}

	public List<Accessory> getAccessories() {
		return accessories;
	}

	public void setAccessories(List<Accessory> accessories) {
		this.accessories = accessories;
	}

	@Override
	public String toString() {
		return "WorkTalk [id=" + id + ", talkTheme=" + talkTheme + ", talkTime=" + talkTime + ", talkDesc=" + talkDesc
				+ ", accessories=" + accessories + "]";
	}
	
}
