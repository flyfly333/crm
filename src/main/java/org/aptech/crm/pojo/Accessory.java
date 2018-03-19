
package org.aptech.crm.pojo;

import java.io.Serializable;

public class Accessory implements Serializable {
	private Integer id;		//附件编号
	
	private String url;		//附件地址
	
	private Integer type;	//类型	（1.工作日志  2.交往记录  3.客户关怀）
	
	private Integer fileId;	//所属文件的编号

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getFileId() {
		return fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	@Override
	public String toString() {
		return "Accessory [id=" + id + ", url=" + url + ", type=" + type + ", fileId=" + fileId + "]";
	}
	
}
