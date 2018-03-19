package org.aptech.crm.pojo;

import java.io.Serializable;
import java.util.Date;

public class TalkComment implements Serializable {
	private Integer id;		//工作报告评论编号
	
	private WorkTalk workTalk;	//工作报告实体类
	
	private String commentContext;	//评论内容
	
	private Integer commentUserId;	//评论人
	
	private Date commentTime;		//评论时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public WorkTalk getWorkTalk() {
		return workTalk;
	}

	public void setWorkTalk(WorkTalk workTalk) {
		this.workTalk = workTalk;
	}

	public String getCommentContext() {
		return commentContext;
	}

	public void setCommentContext(String commentContext) {
		this.commentContext = commentContext;
	}

	public Integer getCommentUserId() {
		return commentUserId;
	}

	public void setCommentUserId(Integer commentUserId) {
		this.commentUserId = commentUserId;
	}

	public Date getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	@Override
	public String toString() {
		return "TalkComment [id=" + id + ", workTalk=" + workTalk + ", commentContext=" + commentContext
				+ ", commentUserId=" + commentUserId + ", commentTime=" + commentTime + "]";
	}
	
}
