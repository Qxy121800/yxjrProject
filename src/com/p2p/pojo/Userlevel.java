package com.p2p.pojo;

import com.baomidou.mybatisplus.annotations.TableField;

public class Userlevel {
	@TableField("ul_id")
	private Integer ulid;
	@TableField("ul_name")
	private String ulname;
	@TableField("ul_levelValue")
	private String ullevelValue;
	@TableField("u_id")
	private Integer uid;
	
	@Override
	public String toString() {
		return "Userlevel [ulid=" + ulid + ", ulname=" + ulname + ", ullevelValue=" + ullevelValue + ", uid=" + uid
				+ "]";
	}
	public Userlevel() {
		super();
	}
	public Userlevel(Integer ulid, String ulname, String ullevelValue, Integer uid) {
		super();
		this.ulid = ulid;
		this.ulname = ulname;
		this.ullevelValue = ullevelValue;
		this.uid = uid;
	}
	public Integer getUlid() {
		return ulid;
	}
	public void setUlid(Integer ulid) {
		this.ulid = ulid;
	}
	public String getUlname() {
		return ulname;
	}
	public void setUlname(String ulname) {
		this.ulname = ulname;
	}
	public String getUllevelValue() {
		return ullevelValue;
	}
	public void setUllevelValue(String ullevelValue) {
		this.ullevelValue = ullevelValue;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	
}
